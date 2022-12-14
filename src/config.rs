use std::{
    collections::{hash_map::Entry, HashMap},
    error::Error,
    fmt,
    mem,
};

#[derive(Default)]
pub struct Config {
    pub global_names: Vec<Option<String>>,
    pub global_types: Vec<Option<Type>>,
    pub scripts: Vec<Script>,
    pub rooms: Vec<Room>,
    pub enums: Vec<Enum>,
    pub enum_names: HashMap<String, EnumId>,
    pub assocs: Vec<Assoc>,
    pub assoc_names: HashMap<String, AssocId>,
    pub assocs_pending_parse: Vec<String>, // temporary
    pub suppress_preamble: bool,
    pub aside: bool,
}

#[derive(Default)]
pub struct Room {
    pub vars: Vec<Var>,
    pub scripts: Vec<Script>,
}

#[derive(Default)]
pub struct Script {
    pub name: Option<String>,
    pub params: Option<u16>,
    pub locals: Vec<Var>,
    pub skip_do_blocks: bool,
}

#[derive(Default)]
pub struct Var {
    pub name: Option<String>,
    pub ty: Option<Type>,
}

pub struct Enum {
    pub name: String,
    pub values: HashMap<i32, String>,
}

pub struct Assoc {
    pub types: Vec<Type>,
}

pub type EnumId = usize;
pub type AssocId = usize;

pub enum Type {
    Any,
    Char,
    Enum(EnumId),
    Script,
    Array {
        item: Box<Type>,
        y: Box<Type>,
        x: Box<Type>,
    },
    AssocArray {
        assoc: AssocId,
        y: Box<Type>,
        x: Box<Type>,
    },
}

impl Config {
    pub fn from_ini(ini: &str) -> Result<Self, Box<dyn Error>> {
        let mut result = Self {
            global_names: Vec::with_capacity(1024),
            global_types: Vec::with_capacity(1024),
            scripts: Vec::with_capacity(512),
            rooms: Vec::with_capacity(64),
            enums: Vec::with_capacity(64),
            enum_names: HashMap::with_capacity(64),
            assocs: Vec::with_capacity(64),
            assoc_names: HashMap::with_capacity(64),
            assocs_pending_parse: Vec::with_capacity(64),
            suppress_preamble: false,
            aside: false,
        };
        for (i, line) in ini.lines().enumerate() {
            let cx = &ParseContext::LineIndex(i);
            let line = line.split_once(';').map_or(line, |(a, _)| a); // Trim comments
            let line = line.trim();
            if line.is_empty() {
                continue;
            }
            let (lhs, rhs) = line.split_once('=').ok_or_else(|| parse_err(cx))?;
            let key = lhs.trim();
            let value = rhs.trim();
            let mut dots = key.split('.');
            match dots.next() {
                Some("enum") => {
                    handle_enum_key(cx, &mut dots, value, &mut result)?;
                }
                Some("assoc") => {
                    handle_assoc_key(&mut dots, value, &mut result, cx)?;
                }
                Some("global") => {
                    let id = it_final(&mut dots, cx)?;
                    let id: usize = id.parse().map_err(|_| parse_err(cx))?;
                    let (name, type_) = parse_var_name_type(value, &result, cx)?;
                    extend(&mut result.global_names, id);
                    result.global_names[id] = Some(name.to_string());
                    extend(&mut result.global_types, id);
                    result.global_types[id] = type_;
                }
                Some("script") => {
                    handle_script_key(cx, &mut dots, value, &mut result, |c| &mut c.scripts)?;
                }
                Some("room") => {
                    let room = it_next(&mut dots, cx)?;
                    let room: usize = room.parse().map_err(|_| parse_err(cx))?;
                    extend(&mut result.rooms, room);
                    match it_next(&mut dots, cx)? {
                        "var" => {
                            let var = it_final(&mut dots, cx)?;
                            let var: usize = var.parse().map_err(|_| parse_err(cx))?;
                            let (name, ty) = parse_var_name_type(value, &result, cx)?;
                            extend(&mut result.rooms[room].vars, var);
                            result.rooms[room].vars[var].name = Some(name.to_string());
                            result.rooms[room].vars[var].ty = ty;
                        }
                        "script" => {
                            handle_script_key(cx, &mut dots, value, &mut result, |c| {
                                &mut c.rooms[room].scripts
                            })?;
                        }
                        _ => {
                            return Err(parse_err(cx));
                        }
                    }
                }
                _ => {
                    return Err(parse_err(cx));
                }
            }
        }

        for comma_sep in mem::take(&mut result.assocs_pending_parse) {
            let cx = &ParseContext::NearString(&comma_sep);
            let types: Result<Vec<_>, _> = comma_sep
                .split(',')
                .map(|s| parse_type_or_empty_any(s.trim(), &result, cx))
                .collect();
            let types = types?;
            result.assocs.push(Assoc { types });
        }

        check_conflicting_names(&result)?;

        Ok(result)
    }
}

fn handle_script_key<'a>(
    cx: &ParseContext,
    dots: &mut impl Iterator<Item = &'a str>,
    mut value: &str,
    config: &mut Config,
    scripts_vec: impl Fn(&mut Config) -> &mut Vec<Script>,
) -> Result<(), Box<dyn Error>> {
    let script = it_next(dots, cx)?;
    let script: usize = script.parse().map_err(|_| parse_err(cx))?;
    // XXX: this wastes a bunch of memory since local scripts start at 2048
    let scripts = scripts_vec(config);
    extend(scripts, script);
    match dots.next() {
        None => {
            // parse param count as in `func(2)`
            if let Some(paren) = value.find('(') {
                if *value.as_bytes().last().unwrap() != b')' {
                    return Err(parse_err(cx));
                }
                let params = &value[paren + 1..value.len() - 1];
                let params: u16 = params.parse().map_err(|_| parse_err(cx))?;
                scripts[script].params = Some(params);
                value = &value[..paren];
            }
            scripts[script].name = Some(value.to_string());
        }
        Some("local") => {
            let local = it_final(dots, cx)?;
            let local: usize = local.parse().map_err(|_| parse_err(cx))?;
            let (name, ty) = parse_var_name_type(value, config, cx)?;
            let scripts = scripts_vec(config);
            extend(&mut scripts[script].locals, local);
            scripts[script].locals[local].name = Some(name.to_string());
            scripts[script].locals[local].ty = ty;
        }
        Some("disable_do_blocks") => {
            it_end(dots, cx)?;
            if value != "all" {
                return Err(parse_err(cx));
            }
            scripts[script].skip_do_blocks = true;
        }
        Some(_) => {
            return Err(parse_err(cx));
        }
    }
    Ok(())
}

fn handle_enum_key<'a>(
    cx: &ParseContext,
    dots: &mut impl Iterator<Item = &'a str>,
    value: &str,
    config: &mut Config,
) -> Result<(), Box<dyn Error>> {
    let enum_name = it_next(dots, cx)?;
    let const_value: i32 = it_final(dots, cx)?.parse().map_err(|_| parse_err(cx))?;
    let const_name = value.to_string();

    let enum_id = config
        .enum_names
        .get(enum_name)
        .copied()
        .unwrap_or_else(|| {
            let id = config.enums.len();
            config.enums.push(Enum {
                name: enum_name.to_string(),
                values: HashMap::new(),
            });
            config.enum_names.insert(enum_name.to_string(), id);
            id
        });
    config.enums[enum_id].values.insert(const_value, const_name);
    Ok(())
}

fn handle_assoc_key<'a>(
    dots: &mut impl Iterator<Item = &'a str>,
    value: &str,
    config: &mut Config,
    cx: &ParseContext,
) -> Result<(), Box<dyn Error>> {
    let name = it_next(dots, cx)?;
    let id = config.assocs_pending_parse.len();
    config.assocs_pending_parse.push(value.to_string());
    config.assoc_names.insert(name.to_string(), id);
    Ok(())
}

fn parse_type(s: &str, config: &Config, cx: &ParseContext) -> Result<Type, Box<dyn Error>> {
    if s == "string" {
        return Ok(Type::Array {
            item: Box::new(Type::Char),
            y: Box::new(Type::Any),
            x: Box::new(Type::Any),
        });
    }
    if s == "char" {
        return Ok(Type::Char);
    }
    if s == "script" {
        return Ok(Type::Script);
    }
    if let Some((item, y, x)) = parse_array(s) {
        let y = Box::new(parse_type_or_empty_any(y.unwrap_or(""), config, cx)?);
        let x = Box::new(parse_type_or_empty_any(x, config, cx)?);

        if let Some(&assoc) = config.assoc_names.get(item) {
            return Ok(Type::AssocArray { assoc, y, x });
        }

        let item = Box::new(parse_type_or_empty_any(item, config, cx)?);
        return Ok(Type::Array { item, y, x });
    }
    if let Some(&enum_id) = config.enum_names.get(s) {
        return Ok(Type::Enum(enum_id));
    }
    return Err(type_err(cx));
}

fn parse_type_or_empty_any(
    s: &str,
    config: &Config,
    cx: &ParseContext,
) -> Result<Type, Box<dyn Error>> {
    if s.is_empty() {
        return Ok(Type::Any);
    }
    parse_type(s, config, cx)
}

fn parse_array(s: &str) -> Option<(&str, Option<&str>, &str)> {
    let (s, x) = parse_array_level(s)?;
    match parse_array_level(s) {
        None => Some((s, None, x)),
        Some((s, y)) => Some((s, Some(y), x)),
    }
}

fn parse_array_level(s: &str) -> Option<(&str, &str)> {
    // This is how we write parsers down south
    if !s.ends_with(']') {
        return None;
    }
    let s = &s[..s.len() - 1];
    let (o, i) = s.rsplit_once('[')?;
    Some((o.trim_end(), i.trim()))
}

fn it_next<T>(it: &mut impl Iterator<Item = T>, cx: &ParseContext) -> Result<T, Box<dyn Error>> {
    it.next().ok_or_else(|| parse_err(cx))
}

fn it_end<T>(it: &mut impl Iterator<Item = T>, cx: &ParseContext) -> Result<(), Box<dyn Error>> {
    match it.next() {
        Some(_) => return Err(parse_err(cx)),
        None => Ok(()),
    }
}

fn it_final<T>(it: &mut impl Iterator<Item = T>, cx: &ParseContext) -> Result<T, Box<dyn Error>> {
    let result = it_next(it, cx);
    it_end(it, cx)?;
    result
}

fn extend<T: Default>(xs: &mut Vec<T>, upto: usize) {
    if xs.len() < upto + 1 {
        xs.resize_with(upto + 1, T::default);
    }
}

enum ParseContext<'a> {
    LineIndex(usize),
    NearString(&'a str),
}

impl fmt::Display for ParseContext<'_> {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::LineIndex(index) => {
                let num = index + 1;
                write!(f, "on line {num}")?;
            }
            Self::NearString(string) => {
                write!(f, "near {string:?}")?;
            }
        }
        Ok(())
    }
}

fn parse_err(cx: &ParseContext) -> Box<dyn Error> {
    format!("bad config {cx}").into()
}

fn type_err(cx: &ParseContext) -> Box<dyn Error> {
    format!("bad type {cx}").into()
}

fn parse_var_name_type<'a>(
    s: &'a str,
    config: &Config,
    cx: &ParseContext,
) -> Result<(&'a str, Option<Type>), Box<dyn Error>> {
    match s.split_once(':') {
        None => Ok((s, None)),
        Some((name, ty)) => {
            let name = name.trim_end();
            let ty = ty.trim_start();
            let ty = parse_type(ty, config, cx)?;
            Ok((name, Some(ty)))
        }
    }
}

fn check_conflicting_names(config: &Config) -> Result<(), Box<dyn Error>> {
    let mut parents = Vec::new();
    let mut global_seen = HashMap::with_capacity(1 << 10);
    let mut room_seen = HashMap::with_capacity(64);
    let mut script_seen = HashMap::with_capacity(16);

    for (i, s) in config.scripts.iter().enumerate() {
        if let Some(name) = &s.name {
            check_dup(
                &parents,
                &mut global_seen,
                name,
                Some(i.try_into().unwrap()),
            )?;
        }
    }

    for name in config.global_names.iter().flatten() {
        check_dup(&parents, &mut global_seen, name, None)?;
    }

    for enum_ in &config.enums {
        for (&value, name) in &enum_.values {
            check_dup(&parents, &mut global_seen, name, Some(value))?;
        }
    }

    for script in &config.scripts {
        script_seen.clear();
        for var in &script.locals {
            if let Some(name) = &var.name {
                check_dup(&parents, &mut script_seen, name, None)?;
            }
        }
    }

    parents.push(&global_seen);

    for room in &config.rooms {
        room_seen.clear();

        for var in &room.vars {
            if let Some(name) = &var.name {
                check_dup(&parents, &mut room_seen, name, None)?;
            }
        }

        // Safety: this is popped at the end of the scope before room_seen is used
        // again.
        parents.push(unsafe { transmute_lifetime(&room_seen) });

        for script in &room.scripts {
            script_seen.clear();
            for var in &script.locals {
                if let Some(name) = &var.name {
                    check_dup(&parents, &mut script_seen, name, None)?;
                }
            }
        }

        parents.pop();
    }

    Ok(())
}

unsafe fn transmute_lifetime<'a, T>(x: &T) -> &'a T {
    mem::transmute::<&T, &T>(x)
}

fn check_dup<'a>(
    parents: &[&HashMap<&str, Option<i32>>],
    seen: &mut HashMap<&'a str, Option<i32>>,
    name: &'a str,
    value: Option<i32>,
) -> Result<(), Box<dyn Error>> {
    for parent in parents {
        if parent.contains_key(name) {
            return Err(format!("conflicting name {name:?}").into());
        }
    }
    match seen.entry(name) {
        Entry::Vacant(e) => {
            e.insert(value);
        }
        Entry::Occupied(e) => {
            let equal = e.get().is_some() && *e.get() == value;
            if !equal {
                return Err(format!("conflicting name {name:?}").into());
            }
        }
    }
    Ok(())
}

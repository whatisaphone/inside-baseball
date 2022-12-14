use crate::{script::misc::AnsiStr, utils::byte_array::ByteArray};
use arrayvec::ArrayVec;
use std::{fmt, fmt::Write, isize};

#[derive(Debug)]
pub enum Ins<'a> {
    Push(Operand<'a>),
    GetArrayItem(Variable),
    GetArrayItem2D(Variable),
    StackDupN(u16),
    StackDup,
    Not,
    Equal,
    NotEqual,
    Greater,
    Less,
    LessOrEqual,
    GreaterOrEqual,
    Add,
    Sub,
    Mul,
    Div,
    LogicalAnd,
    LogicalOr,
    PopDiscard,
    In,
    DimArray2D(ItemSize, Variable),
    RedimArray2D(ItemSize, Variable),
    Set(Variable),
    SetArrayItem(Variable),
    SetArrayItem2D(Variable),
    Inc(Variable),
    Dec(Variable),
    JumpIf(i16),
    JumpUnless(i16),
    Jump(i16),
    AssignString(Variable),
    Sprintf(Variable),
    DimArray1DSimple(ItemSize, Variable),
    DimArray2DSimple(ItemSize, Variable),
    BitwiseAnd,
    BitwiseOr,
    Generic(ByteArray<2>, ArrayVec<Operand<'a>, 2>, &'a GenericIns),
}

#[derive(Debug)]
pub struct GenericIns {
    pub name: Option<&'static str>,
    pub args: &'static [GenericArg],
    pub returns_value: bool,
}

#[derive(Debug)]
pub enum GenericArg {
    Int,
    String,
    List,
    // same as above, but with type hint
    IntScript,
}

#[derive(Copy, Clone, Debug)]
pub enum Operand<'a> {
    Byte(u8),
    I16(i16),
    I32(i32),
    Var(Variable),
    String(&'a [u8]),
}

#[derive(Copy, Clone, Eq, PartialEq, Debug)]
pub struct Variable(pub u16);

#[derive(Copy, Clone, Debug)]
pub enum ItemSize {
    Bit,
    Byte,
    I16,
    I32,
    Char,
}

impl Ins<'_> {
    pub fn jump_target(&self, offset: usize) -> Option<usize> {
        match *self {
            Self::JumpIf(rel) | Self::JumpUnless(rel) | Self::Jump(rel) => {
                Some(
                    (isize::try_from(offset).unwrap() + 3 + isize::try_from(rel).unwrap())
                        .try_into()
                        .unwrap(),
                )
            }
            _ => None,
        }
    }
}

impl fmt::Display for Ins<'_> {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match *self {
            Self::Push(op) => write!(f, "push {op}"),
            Self::GetArrayItem(var) => write!(f, "get-array-item {var}"),
            Self::GetArrayItem2D(var) => write!(f, "get-array-item-2d {var}"),
            Self::StackDupN(count) => write!(f, "stack-dup-n {count}"),
            Self::StackDup => write!(f, "stack-dup"),
            Self::Not => write!(f, "not"),
            Self::Equal => write!(f, "equal"),
            Self::NotEqual => write!(f, "not-equal"),
            Self::Greater => write!(f, "greater"),
            Self::Less => write!(f, "less"),
            Self::LessOrEqual => write!(f, "less-or-equal"),
            Self::GreaterOrEqual => write!(f, "greater-or-equal"),
            Self::Add => write!(f, "add"),
            Self::Sub => write!(f, "sub"),
            Self::Mul => write!(f, "mul"),
            Self::Div => write!(f, "div"),
            Self::LogicalAnd => write!(f, "logical-and"),
            Self::LogicalOr => write!(f, "logical-or"),
            Self::PopDiscard => write!(f, "pop-discard"),
            Self::In => write!(f, "in"),
            Self::DimArray2D(size, var) => write!(f, "dim-array-2d {var}[{size}]"),
            Self::RedimArray2D(size, var) => write!(f, "redim-array-2d {var}[{size}]"),
            Self::Set(var) => write!(f, "set {var}"),
            Self::SetArrayItem(var) => write!(f, "set-array-item {var}"),
            Self::SetArrayItem2D(var) => write!(f, "set-array-item-2d {var}"),
            Self::Inc(var) => write!(f, "inc {var}"),
            Self::Dec(var) => write!(f, "dec {var}"),
            Self::JumpIf(rel) => write!(f, "jump-if {}", RelHex(rel)),
            Self::JumpUnless(rel) => write!(f, "jump-unless {}", RelHex(rel)),
            Self::Jump(rel) => write!(f, "jump {}", RelHex(rel)),
            Self::AssignString(var) => write!(f, "assign-string {var}"),
            Self::Sprintf(var) => write!(f, "sprintf {var}"),
            Self::DimArray1DSimple(size, var) => write!(f, "dim-array-1d-simple {var}[{size}]"),
            Self::DimArray2DSimple(size, var) => write!(f, "dim-array-2d-simple {var}[{size}]"),
            Self::BitwiseAnd => write!(f, "bitwise-and"),
            Self::BitwiseOr => write!(f, "bitwise-or"),
            Self::Generic(ref bytecode, ref operands, ins) => {
                GenericIns::write_name(f, ins, bytecode)?;
                for op in operands {
                    write!(f, " {op}")?;
                }
                Ok(())
            }
        }
    }
}

impl GenericIns {
    pub fn write_name(w: &mut impl Write, ins: &GenericIns, bytecode: &[u8]) -> fmt::Result {
        match &ins.name {
            Some(name) => w.write_str(name),
            None => Self::write_fallback_name(w, bytecode),
        }
    }

    fn write_fallback_name(w: &mut impl Write, bytes: &[u8]) -> fmt::Result {
        for (i, b) in bytes.iter().enumerate() {
            if i != 0 {
                w.write_char('-')?;
            }
            write!(w, "x{b:02x}")?;
        }
        Ok(())
    }
}

impl fmt::Display for Operand<'_> {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::Byte(n) => n.fmt(f),
            Self::I16(n) => n.fmt(f),
            Self::I32(n) => n.fmt(f),
            Self::Var(var) => var.fmt(f),
            Self::String(s) => write!(f, "{:?}", AnsiStr(s)),
        }
    }
}

impl fmt::Display for Variable {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        let (scope, index) = (self.0 & 0xf000, self.0 & 0x0fff);
        let scope = match scope {
            0x0000 => "global",
            0x4000 => "local",
            0x8000 => "room",
            _ => panic!("bad variable scope bits"),
        };
        write!(f, "{}{}", scope, index)
    }
}

impl fmt::Display for ItemSize {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::Bit => write!(f, "bit"),
            Self::Byte => write!(f, "byte"),
            Self::I16 => write!(f, "i16"),
            Self::I32 => write!(f, "i32"),
            Self::Char => write!(f, "char"),
        }
    }
}

struct RelHex(i16);

impl fmt::Display for RelHex {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        if self.0 >= 0 {
            write!(f, "+0x{:04x}", self.0)
        } else {
            write!(f, "-0x{:04x}", -self.0)
        }
    }
}

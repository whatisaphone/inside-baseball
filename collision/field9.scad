$fs = 120;

$vpt = [0,1080,480];
$vpr = [-34,0,0];
$vpf = 45;

foul_line = 6;
plain_color = [1,1,1,0.8];
out_color = [1,0.75,0.75,0.8];
eat_color = [0.5,0.75,1,0.8];

// home, first, second, third, rubber
color([1,1,1]) scale([1,-1,-1]) rotate([90,0,0]) linear_extrude(1) {
    polygon([[-30,30*2+300],[30,30*2+300],[30,30+300],[0,300],[-30,30+300]]);
    polygon([[552-36*2,852],[552-36,852+36],[552,852],[552-36,852-36]]);
    polygon([[0,1404+36],[36,1404],[0,1404-36],[-36,1404]]);
    polygon([[-552+36*2,852],[-552+36,852+36],[-552,852],[-552+36,852-36]]);
    polygon([[-19,852],[19,852],[19,9+852],[-19,9+852]]);
}

// foul lines
color([1,1,1,0.5]) scale([1,-1,-1]) rotate([90,0,0]) linear_extrude(1) {
    polygon([[0,300],[-5000,300+5000],[-5000,300+5000+foul_line],[0,300+foul_line]]);
    polygon([[0,300],[5000,300+5000],[5000,300+5000+foul_line],[0,300+foul_line]]);
}

scale([0.1,0.1,-0.1]) translate([-23200,0,0]) {
    color(out_color) polyhedron([[12210,0,14230],[11910,0,22050],[12210,100,14230],[11910,100,22050]], [[0,1,3,2]]);
    color(out_color) polyhedron([[12210,0,14230],[11000,0,14160],[12210,100,14230],[11000,500,14160]], [[0,1,3,2]]);
    color(out_color) polyhedron([[11910,0,22050],[10890,0,22710],[11910,100,22050],[10890,500,22710]], [[0,1,3,2]]);
    color(out_color) polyhedron([[11000,0,14160],[10890,0,22710],[11000,500,14160],[10890,500,22710]], [[0,1,3,2]]);
    color(out_color) polyhedron([[12210,100,14230],[11000,500,14160],[11910,100,22050],[10890,500,22710]], [[0,1,3,2]]);
    color(out_color) polyhedron([[11170,0,19010],[11120,0,21410],[11170,700,19010],[11120,700,21410]], [[0,1,3,2]]);
    color(out_color) polyhedron([[11170,0,19010],[9360,0,19120],[11170,700,19010],[9360,700,19120]], [[0,1,3,2]]);
    color(out_color) polyhedron([[11120,0,21410],[9510,0,21690],[11120,700,21410],[9510,700,21690]], [[0,1,3,2]]);
    color(out_color) polyhedron([[9360,0,19120],[9510,0,21690],[9360,700,19120],[9510,700,21690]], [[0,1,3,2]]);
    color(out_color) polyhedron([[11170,700,19010],[9360,700,19120],[11120,700,21410],[9510,700,21690]], [[0,1,3,2]]);
    color(out_color) polyhedron([[11120,0,21410],[12230,0,25450],[11120,100,21410],[12230,100,25450]], [[0,1,3,2]]);
    color(out_color) polyhedron([[11120,0,21410],[9510,0,21690],[11120,100,21410],[9510,500,21690]], [[0,1,3,2]]);
    color(out_color) polyhedron([[12230,0,25450],[11590,0,26090],[12230,100,25450],[11590,500,26090]], [[0,1,3,2]]);
    color(out_color) polyhedron([[9510,0,21690],[11590,0,26090],[9510,500,21690],[11590,500,26090]], [[0,1,3,2]]);
    color(out_color) polyhedron([[11120,100,21410],[9510,500,21690],[12230,100,25450],[11590,500,26090]], [[0,1,3,2]]);
    color(eat_color) polyhedron([[9630,0,24090],[18040,0,31780],[9630,5,24090],[18040,5,31780]], [[0,1,3,2]]);
    color(eat_color) polyhedron([[9630,0,24090],[7580,0,25450],[9630,5,24090],[7580,5,25450]], [[0,1,3,2]]);
    color(eat_color) polyhedron([[18040,0,31780],[16620,0,34170],[18040,5,31780],[16620,5,34170]], [[0,1,3,2]]);
    color(eat_color) polyhedron([[7580,0,25450],[16620,0,34170],[7580,5,25450],[16620,5,34170]], [[0,1,3,2]]);
    color(eat_color) polyhedron([[9630,5,24090],[7580,5,25450],[18040,5,31780],[16620,5,34170]], [[0,1,3,2]]);
    color(out_color) polyhedron([[8270,0,33280],[17030,0,42150],[8270,10000,33280],[17030,10000,42150]], [[0,1,3,2]]);
    color(out_color) polyhedron([[8270,0,33280],[300,0,41920],[8270,10000,33280],[300,10000,41920]], [[0,1,3,2]]);
    color(out_color) polyhedron([[17030,0,42150],[17030,0,43000],[17030,10000,42150],[17030,10000,43000]], [[0,1,3,2]]);
    color(out_color) polyhedron([[300,0,41920],[17030,0,43000],[300,10000,41920],[17030,10000,43000]], [[0,1,3,2]]);
    color(out_color) polyhedron([[8270,10000,33280],[300,10000,41920],[17030,10000,42150],[17030,10000,43000]], [[0,1,3,2]]);
    color(eat_color) polyhedron([[33670,0,38400],[39560,0,24210],[33670,5,38400],[39560,5,24210]], [[0,1,3,2]]);
    color(eat_color) polyhedron([[33670,0,38400],[37040,0,42380],[33670,5,38400],[37040,5,42380]], [[0,1,3,2]]);
    color(eat_color) polyhedron([[39560,0,24210],[42580,0,32440],[39560,5,24210],[42580,5,32440]], [[0,1,3,2]]);
    color(eat_color) polyhedron([[37040,0,42380],[42580,0,32440],[37040,5,42380],[42580,5,32440]], [[0,1,3,2]]);
    color(eat_color) polyhedron([[33670,5,38400],[37040,5,42380],[39560,5,24210],[42580,5,32440]], [[0,1,3,2]]);
    color(out_color) polyhedron([[35780,0,24940],[37920,0,19780],[35780,500,24940],[37920,500,19780]], [[0,1,3,2]]);
    color(out_color) polyhedron([[35780,0,24940],[38900,0,27150],[35780,500,24940],[38900,1000,27150]], [[0,1,3,2]]);
    color(out_color) polyhedron([[37920,0,19780],[38450,0,23860],[37920,500,19780],[38450,1000,23860]], [[0,1,3,2]]);
    color(out_color) polyhedron([[38900,0,27150],[38450,0,23860],[38900,1000,27150],[38450,1000,23860]], [[0,1,3,2]]);
    color(out_color) polyhedron([[35780,500,24940],[38900,1000,27150],[37920,500,19780],[38450,1000,23860]], [[0,1,3,2]]);
    color(out_color) polyhedron([[28620,0,3330],[29110,0,2760],[28620,500,3330],[29110,500,2760]], [[0,1,3,2]]);
    color(out_color) polyhedron([[28620,0,3330],[32730,0,8510],[28620,500,3330],[32730,1000,8510]], [[0,1,3,2]]);
    color(out_color) polyhedron([[29110,0,2760],[33290,0,6930],[29110,500,2760],[33290,1000,6930]], [[0,1,3,2]]);
    color(out_color) polyhedron([[32730,0,8510],[33290,0,6930],[32730,1000,8510],[33290,1000,6930]], [[0,1,3,2]]);
    color(out_color) polyhedron([[28620,500,3330],[32730,1000,8510],[29110,500,2760],[33290,1000,6930]], [[0,1,3,2]]);
    color(out_color) polyhedron([[28890,0,1880],[29110,0,2760],[28890,5,1880],[29110,5,2760]], [[0,1,3,2]]);
    color(out_color) polyhedron([[28890,0,1880],[28990,0,1880],[28890,5,1880],[28990,5,1880]], [[0,1,3,2]]);
    color(out_color) polyhedron([[29110,0,2760],[29210,0,2760],[29110,5,2760],[29210,5,2760]], [[0,1,3,2]]);
    color(out_color) polyhedron([[28990,0,1880],[29210,0,2760],[28990,5,1880],[29210,5,2760]], [[0,1,3,2]]);
    color(out_color) polyhedron([[28890,5,1880],[28990,5,1880],[29110,5,2760],[29210,5,2760]], [[0,1,3,2]]);
    color(out_color) polyhedron([[13960,0,4590],[18500,0,4590],[13960,5,4590],[18500,5,4590]], [[0,1,3,2]]);
    color(out_color) polyhedron([[13960,0,4590],[13960,0,4690],[13960,5,4590],[13960,5,4690]], [[0,1,3,2]]);
    color(out_color) polyhedron([[18500,0,4590],[18500,0,4690],[18500,5,4590],[18500,5,4690]], [[0,1,3,2]]);
    color(out_color) polyhedron([[13960,0,4690],[18500,0,4690],[13960,5,4690],[18500,5,4690]], [[0,1,3,2]]);
    color(out_color) polyhedron([[13960,5,4590],[13960,5,4690],[18500,5,4590],[18500,5,4690]], [[0,1,3,2]]);
    color(out_color) polyhedron([[19090,0,1880],[19190,0,1880],[19090,5,1880],[19190,5,1880]], [[0,1,3,2]]);
    color(out_color) polyhedron([[19090,0,1880],[18500,0,4560],[19090,5,1880],[18500,5,4560]], [[0,1,3,2]]);
    color(out_color) polyhedron([[19190,0,1880],[18600,0,4560],[19190,5,1880],[18600,5,4560]], [[0,1,3,2]]);
    color(out_color) polyhedron([[18500,0,4560],[18600,0,4560],[18500,5,4560],[18600,5,4560]], [[0,1,3,2]]);
    color(out_color) polyhedron([[19090,5,1880],[18500,5,4560],[19190,5,1880],[18600,5,4560]], [[0,1,3,2]]);
    color(out_color) polyhedron([[10420,0,14090],[11000,0,14160],[10420,5,14090],[11000,5,14160]], [[0,1,3,2]]);
    color(out_color) polyhedron([[10420,0,14090],[10420,0,14190],[10420,5,14090],[10420,5,14190]], [[0,1,3,2]]);
    color(out_color) polyhedron([[11000,0,14160],[11000,0,14260],[11000,5,14160],[11000,5,14260]], [[0,1,3,2]]);
    color(out_color) polyhedron([[10420,0,14190],[11000,0,14260],[10420,5,14190],[11000,5,14260]], [[0,1,3,2]]);
    color(out_color) polyhedron([[10420,5,14090],[10420,5,14190],[11000,5,14160],[11000,5,14260]], [[0,1,3,2]]);
    color(out_color) polyhedron([[18040,0,31780],[28960,0,42380],[18040,5,31780],[28960,5,42380]], [[0,1,3,2]]);
    color(out_color) polyhedron([[18040,0,31780],[18040,0,31880],[18040,5,31780],[18040,5,31880]], [[0,1,3,2]]);
    color(out_color) polyhedron([[28960,0,42380],[28960,0,42480],[28960,5,42380],[28960,5,42480]], [[0,1,3,2]]);
    color(out_color) polyhedron([[18040,0,31880],[28960,0,42480],[18040,5,31880],[28960,5,42480]], [[0,1,3,2]]);
    color(out_color) polyhedron([[18040,5,31780],[18040,5,31880],[28960,5,42380],[28960,5,42480]], [[0,1,3,2]]);
    color(out_color) polyhedron([[28960,0,42380],[33670,0,38400],[28960,5,42380],[33670,5,38400]], [[0,1,3,2]]);
    color(out_color) polyhedron([[28960,0,42380],[28960,0,42480],[28960,5,42380],[28960,5,42480]], [[0,1,3,2]]);
    color(out_color) polyhedron([[33670,0,38400],[33670,0,38500],[33670,5,38400],[33670,5,38500]], [[0,1,3,2]]);
    color(out_color) polyhedron([[28960,0,42480],[33670,0,38500],[28960,5,42480],[33670,5,38500]], [[0,1,3,2]]);
    color(out_color) polyhedron([[28960,5,42380],[28960,5,42480],[33670,5,38400],[33670,5,38500]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
    color(plain_color) polyhedron([[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[0,1,3,2]]);
}
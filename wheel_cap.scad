outer_cap_dia = 58; // Outer diameter of a cap
base_cap_height = 1.5;
connector_hole_dia = 3; // Dia of the connector hole
connector_hole_offset = 3;
connector_size = 7.5;
lock_holder_width = 13;
cap_height = 15;
cap_top_dia = 48;

union()
{
    difference()
    {
        cylinder(h = base_cap_height, r = outer_cap_dia / 2);
        cylinder(h = base_cap_height, r = (outer_cap_dia / 2) - 4);
    }
    for(i = [0 : 360 / 6 : 360])
    {
        rotate([0, 0, i])
        {
            difference()
            {
                translate([-lock_holder_width / 2, outer_cap_dia / 2 - connector_size - 5, 0])
                {
                    cube([lock_holder_width, connector_size + 1, base_cap_height]);
                }
                translate([0, outer_cap_dia / 2 - connector_size - 5 + connector_hole_offset, 0])
                {
                    cylinder(h = base_cap_height, r = connector_hole_dia / 2);
                }
            }
        }
    }
    translate([0, 0, base_cap_height])
    {
        difference()
        {
            cylinder(h = cap_height - base_cap_height, r1 = outer_cap_dia / 2, r2 = cap_top_dia / 2);
            cylinder(h = cap_height - base_cap_height * 2, r1 = outer_cap_dia / 2 - base_cap_height, r2 = cap_top_dia / 2 - base_cap_height);
        }
    }
}
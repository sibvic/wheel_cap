outer_cap_dia = 58; // Outer diameter of a cap
base_cap_height = 1.5; // Height of the cap base
thickness = 1.5; // Thickness of the wall
connector_height = 9; // Height of the "pin"
connector_hole_dia = 4; // Dia of the connector hole
connector_hole_offset = 3; // Offset from the base edge
connector_size = 8.5;
lock_holder_width = 13; // Width of the pin
lock_pin_size = 2.2; // Additional thikness of the pin

//horizontal body
difference()
{
    translate([-lock_holder_width / 2, outer_cap_dia / 2 - connector_size, 0])
    {
        cube([lock_holder_width, connector_size, base_cap_height]);
    }
    translate([0, outer_cap_dia / 2 - connector_size + connector_hole_offset, 0])
    {
        cylinder(h = base_cap_height, r = connector_hole_dia / 2);
    }
}
//vertical body
intersection()
{   
    translate([-lock_holder_width / 2, 0, 0])
    {
        cube([lock_holder_width, outer_cap_dia, connector_height]);
    }
    union()
    {
        difference()
        {
            cylinder(h = connector_height, r = outer_cap_dia / 2 + thickness);
            cylinder(h = connector_height, r = outer_cap_dia / 2);
        }
        translate([0, 0, connector_height - 2.5])
        {
            difference()
            {
                cylinder(h = 2.5, r = (outer_cap_dia / 2 - 2.5));
                cylinder(h = 2.5, r2 = (outer_cap_dia / 2 - 2.5), r1 = (outer_cap_dia / 2 - 1));
            }
        }
        
        //locking body
        difference()
        {
            union()
            {
                translate([0, 0, connector_height - 1.5 - 1])
                {
                    cylinder(h = 2.5, r2 = (outer_cap_dia / 2 + thickness), r1 = (outer_cap_dia / 2 + thickness + lock_pin_size));
                }
                translate([0, 0, connector_height - 3.5 - 1])
                {
                    cylinder(h = 2, r1 = (outer_cap_dia / 2 + thickness), r2 = (outer_cap_dia / 2 + thickness + lock_pin_size));
                }
            }
            cylinder(h = connector_height, r = outer_cap_dia / 2);
        }
    }
}

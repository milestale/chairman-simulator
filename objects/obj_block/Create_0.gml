// Create Event
dragging = false;
placed = false;

// Set up physics fixture
var fix = physics_fixture_create();
physics_fixture_set_box_shape(fix, sprite_width / 2, sprite_height / 2);
physics_fixture_set_density(fix, 0.5);
physics_fixture_set_restitution(fix, 0.1); // Slight bounce
physics_fixture_set_friction(fix, 0.5);
physics_fixture_bind(fix, id);
physics_fixture_delete(fix);

phy_fixed_rotation = true; // Prevent spinning
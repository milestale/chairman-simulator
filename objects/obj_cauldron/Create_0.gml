// Create Event
// Set up physics fixture as static
var fix = physics_fixture_create();
physics_fixture_set_box_shape(fix, sprite_width / 2, sprite_height / 2);
physics_fixture_set_density(fix, 0); // 0 density = static
physics_fixture_bind(fix, id);
physics_fixture_delete(fix);
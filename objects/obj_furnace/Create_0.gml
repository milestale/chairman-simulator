// Create Event
temperature = 20;           // Starting temperature (room temp)
target_temp = 500;          // Target temperature to maintain
temp_range = 100;            // Allowed range (±20 degrees)
heat_rate = 2;              // How fast temperature increases per frame
cool_rate = 2;              // How fast temperature decreases per frame
timer = 0;                  // Time spent in target range (in frames)
target_time = 600;          // 10 seconds at 60fps (10 * 60 = 600 frames)
game_won = false;
// Step Event
if (video_get_position() >= video_get_duration()) {
    // Check if video has reached its end
    video_close();             // Close the video
    room_goto(mainroom);                     // End the game
}

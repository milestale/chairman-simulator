if (!placed) {
    placed = true;
    phy_active = false; // Disable physics once placed to prevent further movement
    with (obj_controller) {
        blocks_in_cauldron += 1;
    }
}
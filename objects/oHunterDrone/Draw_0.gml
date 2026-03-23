/// @description Draw drone

if (currentState == DroneState.DISABLED)
{
    draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, image_angle, c_gray, 0.8)
}
else
{
    draw_self()
}

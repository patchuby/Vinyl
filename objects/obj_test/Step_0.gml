if (keyboard_check_pressed(vk_space))
{
    instance = vinyl_play(vinyl_lib.loop_test);
}

if (keyboard_check_pressed(ord("L")))
{
    instance = vinyl_play("loop_test");
}

if (keyboard_check_pressed(ord("S")))
{
    vinyl_stop(instance);
}
left = gamepad_button_check(gamepad_id, gp_padl) || keyboard_check(vk_left);
right = gamepad_button_check(gamepad_id, gp_padr) || keyboard_check(vk_right);
jump = gamepad_button_check_pressed(gamepad_id, gp_face1) || keyboard_check_pressed(vk_up);
// jump_cancel = gamepad_button_check_released(gamepad_id, gp_face1) || keyboard_check_released(vk_up);
pause = gamepad_button_check_pressed(gamepad_id, gp_start);

if (pause)
{
    game_restart();
}
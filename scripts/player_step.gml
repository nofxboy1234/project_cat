/// Platform physics

left = obj_game.left;
right = obj_game.right;
jump = obj_game.jump;
// jump_cancel = obj_game.jump_cancel;

// Check for ground
if (place_meeting(x, y+1, obj_solid))
{
    vspd = 0;

    // Jumping
    if (jump)
    {
        vspd = -jspd;
    }
}
else
{
    // Gravity
    vspd += grav;
    // if (vspd < max_grav)
    // {
    //     vspd += grav;
    // }

    // if (jump_cancel) && (vspd < -jump_cancel_spd)
    // {
    //     vspd = -jump_cancel_spd;
    // }
}

// Moving right
if (right)
{
    if (hspd < spd)
    {
        hspd += accel;
    }
    else
    {
        hspd = spd;
    }
}

// Moving left
if (left)
{
    if (hspd > -spd)
    {
        hspd -= accel;
    }
    else
    {
        hspd = -spd;
    }
}

// Check for not moving
if ((!right && !left) || (right && left))
{
    if (hspd != 0)
    {
        if (hspd < 0)
        {
            hspd += accel;
        }
        else
        {
            hspd -= accel;
        }
    }
}

// Horizontal collisions
if (place_meeting(x+hspd, y, obj_solid))
{
    while (!place_meeting(x+sign(hspd), y, obj_solid))
    {
        x += sign(hspd)
    }
    hspd = 0;
}

// Move horizontally
x += hspd;

// Vertical collisions
if (place_meeting(x, y+vspd, obj_solid))
{
    while (!place_meeting(x, y+sign(vspd), obj_solid))
    {
        y += sign(vspd)
    }
    vspd = 0;
}

// Move vertically
y += vspd;

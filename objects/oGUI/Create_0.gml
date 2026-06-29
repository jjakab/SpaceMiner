/// @description Initialize variables

//If this somehow got duplicated, destroy it
if(instance_number(oGUI) > 1) instance_destroy(id,false)

//GUI scaling

//Aspect ratio solution 1
var base_w = 720;
var base_h = 1280;
var aspect = base_w / base_h ; // get the GAME aspect ratio
//show_message_async("display width" + string(display_get_width()))
//show_message_async("display height " + string(display_get_height()))


if (display_get_width() < display_get_height())
    {
    //portrait
    ww = max(base_w, display_get_width());
    hh = ww / aspect;
    }
else
    {
    //landscape
    hh = max(base_h, display_get_height());
    ww = hh * aspect;
    }
//surface_resize(application_surface, ww, hh);

//set_resolution(640,false,true,false,1,960)

cameraWidth = view_wport[0]
cameraHeight = view_hport[0]

enum joystickPermutations
{
	LEFT,
	IDLE,
	RIGHT
}

//How far do we want the joystick to be able to move from the center
maxJoystickDistance = 70

//Variables for joystick one
joystickOneBaseX = cameraWidth/4
joystickOneBaseY = cameraHeight - 96

joystickOneCurrX = joystickOneBaseX
joystickOneCurrY = joystickOneBaseY

joystickOneFactor = 0
joystickOneAngle = 0

//Variables for joystick two
joystickTwoBaseX = 3 * cameraWidth/4
joystickTwoBaseY = joystickOneBaseY

joystickTwoCurrX = joystickTwoBaseX
joystickTwoCurrY = joystickTwoBaseY

joystickTwoFactor = 0
joystickTwoAngle = 0

//Variable for input devices (touches)
devicePerm[0] = joystickPermutations.IDLE
devicePerm[1] = joystickPermutations.IDLE

//Variables for fuelbar
fuelBarXOffset = 16
fuelBarYOffset = 16
fuelBarStartingX = 18 //How many pixels from the left side does the full bar start
fuelBarStartingY = 15 //How many pixels from the top does the full bar start

fullWidth = sprite_get_width(sFuelBarFull) - (fuelBarStartingX * 2)


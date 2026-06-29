/// @description Initialize variables

//If this somehow got duplicated, destroy it
if(instance_number(oCamera) > 1) instance_destroy(id,false)

//Screenshake
shake = false
shakeTime = 0
shakeMagnitude = 0
shakeFade = 0.25

//Variables used when transitioning room
transitionXOffset = 0
transitionYOffset = 0

//Focus on the player appear effect
if(instance_exists(oPlayerAppearEffect)) {
	camera_set_view_pos(view_camera[0],oPlayerAppearEffect.x - camera_get_view_width(view_camera[0]) / 2,oPlayerAppearEffect.y - camera_get_view_height(view_camera[0]) / 2)	
}

/*
//Aspect ratio solution 2
var base_w = 640;
var base_h = 960;
var max_w = display_get_width();
var max_h = display_get_height();
var aspect = base_w / base_h;
if (max_w < max_h)
    {
    // portait
     var VIEW_WIDTH = max(base_w, max_w);
    var VIEW_HEIGHT = VIEW_WIDTH / aspect;
    }
else
    {
    // landscape
    var VIEW_HEIGHT = min(base_h, max_h);
    var VIEW_WIDTH = VIEW_HEIGHT * aspect;
    }
view_wport[0] = max_w;
view_hport[0] = max_h;
surface_resize(application_surface, view_wport[0], view_hport[0]);

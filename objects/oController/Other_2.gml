//Shop
global.shopItemPool = [
    oPowerUp1,
	oPowerUp2,
	oPowerUp3,
	oPowerUp4
];


//Rooms
enum roomTypes {
	NORMAL,
	SHOP,
	EVENT
}

global.playerCurrentRoom = 1

constructRoomList()

//Shaders

	//Create a counter for color we are on and a list of color pairings
	global.colorCounter = 1
	foregroundColors = ds_list_create()
	backgroundColors = ds_list_create()
	
	//Declare different color schemes
	ds_list_add(foregroundColors,make_color_rgb(255,255,255)) //White
	ds_list_add(backgroundColors,make_color_rgb(63,63,116)) //Dark blue
	
	ds_list_add(foregroundColors,make_color_rgb(234,48,255)) //Hot pink
	ds_list_add(backgroundColors,make_color_rgb(100,145,255)) //????
	
	//Get the # of elements in the list
	colorMaxCounter = ds_list_size(foregroundColors)
	
	currentForegroundColor = ds_list_find_value(foregroundColors,colorMaxCounter - 1)
	currentBackgroundColor = ds_list_find_value(backgroundColors,colorMaxCounter - 1)
	
	//We want this post-draw to be used
	application_surface_draw_enable(false)

	//Create the shader
	shaderCreate()
	
	/*
	colorReplace.red = color_get_red(currentForegroundColor)
	colorReplace.green = color_get_green(currentForegroundColor)
	colorReplace.red = color_get_blue(currentForegroundColor)


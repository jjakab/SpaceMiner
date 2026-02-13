//Number of items to display
itemCount = 3;
itemSpacing = 100;
global.shopItemPool = [
    oPowerUp1,
	oPowerUp2,
	oPowerUp3,
	oPowerUp4
];
//Calculate total width of the row
var totalWidth = (itemCount - 1) * itemSpacing;

//Starting position (centered in room)
var startX = (room_width - totalWidth) * 0.5;
var startY = room_height * 0.5;

//Copying the global shop array
var pool = [];
if (!variable_global_exists("shopItemPool"))
{
    show_debug_message("shopItemPool not initialized!");
    exit;
}
array_copy(pool, 0, global.shopItemPool, 0, array_length(global.shopItemPool));

shop_items = [];
//Adding an object from globalList per shop
//Can modify this to add rarities similar to feudal fling (my beloved)
for(var i = 0; i <itemCount; i++)
{
	if (array_length(pool) <= 0) break;
    var index = irandom(array_length(pool) - 1);
    var itemObject = pool[index];
    array_delete(pool, index, 1);
    var spawnX = startX + (i * itemSpacing);
    var spawnY = startY;
    instance_create_layer(spawnX, spawnY, "Instances", itemObject);
}
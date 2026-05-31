// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function constructRoomList(){
	
	//Create an array and immediately declare the 100th index so it doesn't need to be expanded every time
	roomList[100] = roomTypes.NORMAL
	
	//Start off by setting everything to basic rooms
	for (var i = 0; i < 100; i++) {
		roomList[i] = roomTypes.NORMAL	
	}
	
	//Add shops every 5th room starting at room 3
	for (i = 3; i < 100; i += 5) {
		roomList[i] = roomTypes.SHOP
	}
	
	//Add event rooms every 5th room starting at room 5
	for (i = 5; i < 100; i++) {
		roomList[i] = roomTypes.EVENT	
	}
	
}
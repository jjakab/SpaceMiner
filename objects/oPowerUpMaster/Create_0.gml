/// @description Logic relate to display label

//Variables related to item description
beginningString = "Powerup text will go here Powerup text will go here Powerup text will go here"
statString = ""
endingString = ""

if(statString != "") {
	drawString = beginningString + " " + statString + " " + endingString
}
else {
	drawString = beginningString	
}


powerupTitle = "Powerup Title" //Power-up title will be re-defined by child object

bottomSprite = sShopCaptionBottom
middleSprite = sShopCaptionMiddle
topSprite = sShopCaptionTop

//First we inherit relevant code
event_inherited()



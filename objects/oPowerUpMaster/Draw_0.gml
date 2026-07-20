/// @description Draw self, label, and background

//Draw label
draw_set_halign(fa_center)
draw_set_valign(fa_bottom)


var textScale = 4 //What factor do we want to scale font down by to maintain readability

var xLoc = x + (sprite_get_width(sPowerupBackground) / 2) //Starting x location of text
var yOffset = 4 //How far above the powerup icon should
var yLoc = y - yOffset //How far above the icon does text start

var width = 80  * textScale // Width of main text
var sep = 6 * textScale // Separation of main text

var yScaleFactor = max(10,string_height_ext(drawString,sep,width) / textScale) //How many pixels tall should the middle of the caption be

//Draw bottom portion
draw_sprite(bottomSprite,0,xLoc,yLoc)

//Draw middle portion
var middleY = yLoc - sprite_get_height(bottomSprite)
draw_sprite_ext(middleSprite,0,xLoc,middleY,1,yScaleFactor,0,c_white,1)

//Draw top portion
var topY = middleY - yScaleFactor
draw_sprite(topSprite,0,xLoc,topY)

//Draw text
draw_set_valign(fa_top)

draw_set_font(fShopCaption)
draw_text_ext_transformed(xLoc, topY, drawString, sep,width, 1 / textScale, 1 / textScale,0)

draw_set_font(fShopCaptionBold)
draw_text_transformed(xLoc, topY - sprite_get_height(topSprite) + 4,powerupTitle, 1 / textScale, 1 / textScale, 0)

//Draw self and background
draw_sprite(sPowerupBackground,0,x,y)
draw_self()

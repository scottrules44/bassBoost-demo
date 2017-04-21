local bassBoost = require "plugin.bassBoost"
local json = require("json")
local backgroundMusic = audio.loadStream("song1.mp3")
audio.play( backgroundMusic, { channel=1, loops=-1 } )
local bg = display.newRect( display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight )
local logo = display.newText( "Bass Booster Plugin", 0, 0, native.systemFontBold, 20 )
logo.x, logo.y = display.contentCenterX, 50
bg:setFillColor( .8,0,0 )
local widget = require("widget")
local boostButton
local boostSwitch = 0
boostButton = widget.newButton( {
	label = "Boost Bass",
	id = "boost",
	onEvent = function ( e )
		if (e.phase == "began") then
			boostButton.alpha = 1
			boostSwitch = (boostSwitch+1)%2
			print(boostSwitch)
			if (boostSwitch == 1) then
				boostButton:setLabel("Disable Bass")
				bassBoost.setStrength(0)
			elseif boostSwitch == 0 then
				boostButton:setLabel("Boost Bass")
				bassBoost.setStrength(1000)
			end
		end
	end
} )
boostButton.x, boostButton.y = display.contentCenterX, display.contentCenterY-100

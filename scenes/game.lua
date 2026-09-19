-- Cargar composición de la escena
local composer = require("composer")

-- -- Cargar jugador
local Player = require("game.player")
-- -- Crear escena
local scene = composer.newScene()

function scene:create(event)
	 -- Elementos de la vista
	 local sceneGroup = self.view

	 local player = Player.new()
	 sceneGroup:insert(player)

	 -- Habilitar multitouch
	 system.activate( 'multitouch' )

	 
	 local joystickClass=require 'components.joystick'

	 joystick_r=joystickClass:create{eventName='RightJoystick',  x = display.contentWidth * -0.15,y = display.contentHeight * 0.80,bulbStroke={red=1,green=0,blue=0,alpha=1}}
	 joystick_l=joystickClass:create{eventName='LeftJoystick',x = display.contentWidth * 1.15,y = display.contentHeight * 0.80,bulbStroke={red=1,green=0,blue=0,alpha=1}}


	 joystick_r:show()
	 joystick_l:show()

	 joystick_r.bulb:addEventListener(
		joystick_r.eventName, function ( event )
			 local x = math.cos(event.angle) * event.modul
			 local y = math.sin(event.angle) * event.modul
			 player:setInput(x, y)
			 end )

	joystick_l.bulb:addEventListener( joystick_l.eventName, function ( event )
		-- Falta cargar código de rotación de la celula
	end )

end

scene:addEventListener("create")

return scene
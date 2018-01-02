io.stdout:setvbuf('no')
love.graphics.setDefaultFilter("nearest")
--instance des écrans
require('class.Background')
require('class.Sprite')
require('screen.ScreenMenu')
require('screen.ScreenGame')
require('screen.ScreenEnd')
local screenMenu 
local screenGame 
local screenEnd 
local widthScreen, heightScreen
local screenCurrent
local pauseBool
local pauseimg
local timer
local timerBool
local explodeSon
local startSon
local pauseSon

function love.load()
	print("main")

	love.window.setMode(1024,768)
	love.window.setTitle("PatateMan vs bombColor")
	explodeSon = love.audio.newSource("assets/sound/explode.wav", "static")
	startSon = love.audio.newSource("assets/sound/start.wav", "static")
	pauseSon = love.audio.newSource("assets/sound/pause.wav", "static")
	pauseBool = true
	timerBool = true
	screenCurrent = "screenMenu"
	
	screenMenu = ScreenMenu()
	screenGame = ScreenGame()
	screenEnd = ScreenEnd()
	
	screenMenu.load()
	screenGame.load()
	screenEnd.load()

	widthScreen = love.graphics.getWidth()
	heightScreen = love.graphics.getHeight()
	pauseimg = Sprite("pause",widthScreen/2,heightScreen/2,1,1)
	timer = 0
	explode = Background("explode",widthScreen/2-200,heightScreen-588,1,4,1,2,32,24,0.2)
end 

function love.update(dt)
	
print("loveUpdate")
	if screenCurrent == "screenMenu" then
		screenMenu.update(dt)
		elseif screenCurrent == "screenGame" and pauseBool == true then 
			if screenGame.getPartieBool() == true and timerBool == true then
				screenGame.update(dt)

			else
				explode.update(dt)
				love.audio.play(explodeSon)
				timerBool = false
				timer = timer + 1
				if timer >= 100 then
					screenCurrent = "screenEnd"
				end
			end
			elseif screenCurrent == "screenEnd" then
				screenEnd.update(dt)

			end



		end

		function love.draw()	
			love.graphics.setNewFont("assets/font/emulogic.ttf", 10)

			if screenCurrent == "screenMenu" then

				screenMenu.draw()
				elseif screenCurrent == "screenGame" then
					screenGame.draw()
					if screenGame.getPartieBool() == false then
						explode.draw()

					end
				--affiche écran pause
				if pauseBool == false then
					pauseimg.draw()
				end
				elseif screenCurrent == "screenEnd" then
					screenEnd.draw(screenGame.getScore(),screenGame.getScoreBombB(),screenGame.getScoreBombR())


				end


			end


			function love.keypressed(key)
	-- print(key)
	if screenCurrent == "screenMenu" then
		-- screenCurrent = key == "return" and "screenGame" or "screenMenu"
		
		if key == "return" then
			screenCurrent = "screenGame"
			love.audio.play(startSon)

		end

		elseif screenCurrent == "screenGame" then
			--toogle de la pause
			if pauseBool == true and key == "space" then

				love.audio.play(pauseSon)	
				pauseBool = false
				elseif pauseBool == false and key == "space" then


					pauseBool = true
				end 
				elseif screenCurrent == "screenEnd" then

					if key == "return" then
						love.load() 
					end
				end
			end
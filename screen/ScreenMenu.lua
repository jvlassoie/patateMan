function ScreenMenu()
	
	local screenMenu = {}
	local background 
	local patateManB 
	local patateManR 
	local bombB 
	local bombR 
	local ground 
	local press 
	local button
	local pressSx
	local pressSy
	local pressBool
	local widthScreen, heightScreen



	local function init()
			print("menu")

	--init
	pressBool = true
	pressSx = 0.5
	pressSy = 0.5
	--instance
	patateManB = Background("patB",widthScreen/2+200,heightScreen/2+60,1,3,1,2,11,11,0.15)
	patateManR = Background("patR",widthScreen/2-200,heightScreen/2+60,1,3,1,2,11,11,0.15)
	background = Background("background",widthScreen/2,heightScreen/2,1,8,1,8,32,24,0.6)
	bombB = Background("bombB",widthScreen/2+200,heightScreen/2-200,1,2,1,2,10,10,0.1)
	bombR = Background("bombR",widthScreen/2-200,heightScreen/2-200,1,2,1,2,10,10,0.1)
	ground = Background("ground",widthScreen/2,heightScreen-350,1,1,1,1,32,24,0.2)
	press = Sprite("ps",widthScreen/2,heightScreen/2-50,pressSx,pressSy)
	button = Sprite("buttons",widthScreen/2,heightScreen-100,1,1)
end


function screenMenu.load()

	widthScreen = love.graphics.getWidth()
	heightScreen = love.graphics.getHeight()

	init()

end 

function screenMenu.update(dt)
	print("menuUpdate")

	if pressSx >= 1 and pressSy >=1 then
		pressBool = false
		elseif pressSx <= 0.5 and pressSy <= 0.5 then
			pressBool = true
		end
		if pressBool == true then

			pressSx = pressSx + 1.2*dt
			pressSy = pressSy + 1.2*dt


		else
			pressSx = pressSx - 1.2*dt
			pressSy = pressSy - 1.2*dt
		end



		background.update(dt)
		patateManB.update(dt)
		patateManR.update(dt)
		bombB.update(dt)
		bombR.update(dt)

	end

	function screenMenu.draw()	
		background.draw()
		ground.draw()
		patateManB.draw()
		patateManR.draw()
		bombB.draw()
		bombR.draw()
		press.draw(pressSx,pressSy)
		button.draw()

	end




	return screenMenu
end
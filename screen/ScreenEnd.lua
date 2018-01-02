function ScreenEnd()
	
	local screenEnd = {}
	local imgEnd
	local widthScreen, heightScreen


	local function init()
			print("end")

		imgEnd = Sprite("end",widthScreen/2,heightScreen/2,1,1)
	end


	function screenEnd.load()

		widthScreen = love.graphics.getWidth()
		heightScreen = love.graphics.getHeight()

		init()

	end 

	function screenEnd.update(dt)
print("endUpdate")

	end

	function screenEnd.draw(score,scoreBombeB,scoreBombeR)	
		love.graphics.setNewFont("assets/font/emulogic.ttf", 30)
		imgEnd.draw()
		love.graphics.setColor(0,0,0)
		love.graphics.print("score : "..score,widthScreen/2-400,heightScreen/2-200)
		love.graphics.print("Press start to continue",widthScreen/2-200,heightScreen/2-10)
		love.graphics.setNewFont("assets/font/emulogic.ttf", 20)
		love.graphics.print("score bombe blue : "..scoreBombeB,widthScreen/2+20,heightScreen/2+140)
		love.graphics.print("score bombe red : "..scoreBombeR,widthScreen/2+20,heightScreen/2+250)
		love.graphics.setColor(255,255,255)
	end




	return screenEnd
end
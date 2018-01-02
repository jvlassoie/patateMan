function ScreenGame()
	
	local screenGame = {}
	local background 
	local ground 
	local widthScreen, heightScreen
	local patB
	local patR
	local patate
	local patBool
	local listBomb = {}
	local timerBomb
	local partieBool
	local sautBool
	local score
	local scoreBombB
	local scoreBombR
	local explode
	local coinSon
	local function init()
			print("game")


	--instance
	timerBomb = 0
	scoreBombB = 0
	scoreBombR = 0
	score = 0
	partieBool = true
	sautBool = true
	patBool = true
	background = Background("background",widthScreen/2,heightScreen/2,1,8,1,8,32,24,0.4)
	ground = Background("ground",widthScreen/2,heightScreen-350,1,4,1,1,32,24,0.4)
	patB = Background("patBWalk",widthScreen/2-200,heightScreen-300,1,3,1,1,8,6,0.2)
	patR = Background("patRWalk",widthScreen/2-200,heightScreen-300,1,3,1,1,8,6,0.2)
	coinSon = love.audio.newSource("assets/sound/coin.wav", "static")
	

end




local function collide(a1,a2)
	if a1==a2 then return false end
	local dx = a1.x - a2.x
	local dy = a1.y - a2.y
	if math.abs(dx) < a1.image:getWidth()+a2.image:getWidth()then
		if math.abs(dy) < a1.image:getHeight()+a2.image:getHeight()then
			return true
		end
	end
	return false
end


function screenGame.load()

	widthScreen = love.graphics.getWidth()
	heightScreen = love.graphics.getHeight()

	init()

end 


local function game(dt)
	
	timerBomb = timerBomb + 1
	randt = math.random(20,60)
	if timerBomb >=  randt then
		rnd = math.random(1,2)
		if rnd == 1 then
			bomb = Background("bombB",widthScreen/2+600,heightScreen-270,1,2,1,2,8,8,1)
			elseif rnd == 2 then
				bomb = Background("bombR",widthScreen/2+600,heightScreen-270,1,2,1,2,8,8,1)
			end

			table.insert(listBomb,bomb)
			timerBomb = 0
		end


		for i=#listBomb,1,-1 do
			if score <= 10 then
				listBomb[i].x = listBomb[i].x - 8
				elseif score <= 20 then
					listBomb[i].x = listBomb[i].x - 9
					elseif score <= 30 then
						listBomb[i].x = listBomb[i].x - 10
						elseif score <= 40 then
							listBomb[i].x = listBomb[i].x - 11
							elseif score <= 50 then
								listBomb[i].x = listBomb[i].x - 12

							else


								listBomb[i].x = listBomb[i].x - 13

							end






							if collide(listBomb[i],patate)then
								if listBomb[i].name == "bombB" and patate.name == "patBWalk" then
					-- print("collision")
					-- print("bleu")
					score = score + 1
					scoreBombB = scoreBombB + 1
					table.remove(listBomb,i)
					love.audio.play(coinSon)
					elseif listBomb[i].name == "bombR" and patate.name == "patRWalk" then
						print("collision")
						-- print("rouge")
						score = score + 1
						scoreBombR = scoreBombR + 1
						table.remove(listBomb,i)
					love.audio.play(coinSon)
					else
						-- print("perdu")
						partieBool = false
						
					end
				end




			end

--changement de cape

if love.keyboard.isDown("right") then
	patBool = true
	elseif love.keyboard.isDown("left") then
		patBool = false
	end


	background.update(dt)
	ground.update(dt)

	if patBool == true then
		patate = patB
		elseif patBool == false then
			patate = patR
		end
		patate.update(dt)

	end

	function screenGame.update(dt)
		print("gameUpdate")

		game(dt)
	end


	function screenGame.draw()	
		background.draw()
		ground.draw()
		love.graphics.print("score : "..score,0,0)
		for i=#listBomb,1,-1 do

			listBomb[i].draw()

		end

		patate.draw()
	
	end





	function screenGame.getPartieBool()
		return partieBool
	end

	function screenGame.getScore()
		return score
	end	
	function screenGame.getScoreBombB()
		return scoreBombB
	end
	function screenGame.getScoreBombR()
		return scoreBombR
	end

	return screenGame
end
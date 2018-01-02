function Background(Name,X,Y,rRows,rColumn,cRows,cColumn,scalex,scaley, vitesseAnime)



	local background = {}
	--construction obj
	background = {}
	background.name = Name
	background.quad = nil
	background.x = X
	background.y = Y
	background.image = love.graphics.newImage("assets/graphics/"..background.name..".png")
	background.quad = {}
	background.quadW = 32 
	background.quadH = 32 
	background.frame = 1
	background.w = background.image:getWidth()
	background.h = background.image:getHeight()

	local r,c
	local id = 1
	for r=rRows, rColumn do
		for c=cRows, cColumn do
			
			background.quad[id] = love.graphics.newQuad((c-1)*32, (r-1)*32 , background.quadW, background.quadH, background.w,background.h)
			id = id+ 1
		end
	end


	background.update = function(dt)
	if 	background.frame <= #background.quad then
		background.frame = background.frame + vitesseAnime
		

	else
		background.frame = 1
	end

end

background.draw = function()

love.graphics.draw(background.image,background.quad[math.floor(math.abs(background.frame))], background.x, background.y, 0,scalex,scaley,background.quadW/2,background.quadH/2)

end


return background
end
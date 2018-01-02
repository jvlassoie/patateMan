function Sprite (Name,X,Y,scalex,scaley)
	--construction obj

	local sprite = {}
	sprite.name = Name
	sprite.x = X
	sprite.y = Y
	sprite.image = love.graphics.newImage("assets/graphics/"..Name..".png")
	sprite.w = sprite.image:getWidth()
	sprite.h = sprite.image:getHeight()




	sprite.update = function()
	
end 
sprite.draw = function(scalex,scaley)
love.graphics.draw(sprite.image,sprite.x,sprite.y,0,scalex,scaley,sprite.w/2,sprite.h/2)
end 



return sprite
end

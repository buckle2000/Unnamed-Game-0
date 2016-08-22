graphic={}
function graphic.load()
	--love.graphics.setBackgroundColor(0,0,255,255)
	love.graphics.setLineJoin("bevel")
	love.graphics.setFont(love.graphics.newFont(FONT_SIZE))
	love.graphics.setBlendMode("alpha")
	-- TODO
end


trans_x=0
trans_y=0
function love.draw()
	graphic.draw()
end

function graphic.update(dt)

	-- local player_x=player.x+love.graphics.getWidth()/2 -trans_x
	-- local player_y=player.y+love.graphics.getHeight()/2 -trans_y
	-- trans_x=player_x
	-- trans_y=player_y
	-- love.graphics.translate(player_x,player_y)
-- love.graphics.translate(trans_x,trans_y)
-- trans_x=trans_x+1
-- trans_y=trans_y+1
end

function graphic.draw() -- do every (other or more) frame
	love.window.setTitle(trans_x..","..trans_y..","..player.x..","..player.y..","..weapon.tx..","..weapon.ty)
	love.graphics.translate(trans_x,trans_y)
	player.draw()
	weapon.draw()
	-- always draw
	pause.draw()
	--when condition draw
end

function drawSquare(x,y,length)
	love.graphics.rectangle("line", x-length/2, y-length/2, length, length)
end
player={}
function player.load()
	--player={x=love.graphics.getWidth()/2,y=love.graphics.getHeight()/2,sx=0,sy=0,speed=PLAYER_SPEED*(SKIP_FRAME+1)}
	player.x=0
	player.y=0
	player.r=0 -- rotation unused
	player.sx=0
	player.sy=0
	player.ex=0
	player.ey=0
	player.speed=PLAYER_SPEED
	player.appring=false
end

function player.update(dt)
end

function player.step()
	if player.appring then
		if player.dist(player.ex,player.ey)<=PLAYER_SPEED then
			player.x=player.ex
			player.y=player.ey
			player.sx=0
			player.sy=0
			player.appring=false
		else
			player.headto(player.ex,player.ey)
		end
	end
	player.x=player.x+player.sx
	player.y=player.y+player.sy
	trans_x=-player.x+love.graphics.getWidth()/2
	trans_y=-player.y+love.graphics.getHeight()/2
end

function player.draw()
	love.graphics.setColor(255, 255, 255)
	love.graphics.setLineStyle("smooth")
	love.graphics.setLineWidth(2)
	drawSquare(player.x,player.y,30)
	-- TODO
end

function player.apprto(x,y)
	player.appring=true
	player.ex=x
	player.ey=y
end

function player.headto(x,y) -- just head to once
	local _ratio = PLAYER_SPEED / player.dist(x,y)
	player.sx = _ratio * (x-player.x)
	player.sy = _ratio * (y-player.y)
end

function player.rotateto(r)

end

function player.dist(x,y)
	local _dd=math.sqrt((player.x-x)*(player.x-x)+(player.y-y)*(player.y-y))
	if _dd<1 then return 0 else return _dd end
end
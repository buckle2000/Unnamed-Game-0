input={}
function input.load()
	love.keyboard.setTextInput(false)
	--love.mouse.setGrabbed(true)
	love.mouse.setVisible(false)
end

function input.update(dt)
	if weapon.followmouse then
		weapon.tx = love.mouse.getX()-trans_x
		weapon.ty = love.mouse.getY()-trans_y
	end
	if love.keyboard.isDown("r") then
		if not player.appring then player.appring=true end
		player.ex = love.mouse.getX()
		player.ey = love.mouse.getY()
	end
end

function love.keypressed(key)
	if player.appring then
		player.appring=false
		player.sx=0
		player.sy=0
	end
	if key == "escape" then love.event.quit() end
	if key == "p" then
		pause.pause(true) end
	if key == "up" or key == "w" then player.sy=player.sy+-player.speed; return end
	if key == "down" or key == "s" then player.sy=player.sy+player.speed; return end
	if key == "left" or key == "a" then player.sx=player.sx+-player.speed; return end
	if key == "right" or key == "d" then player.sx=player.sx+player.speed; return end
	if key == "q" then weapon.swap(weapon.type-1) end
	if key == "e" then weapon.swap(weapon.type+1) end
	if key == "0" then weapon.swap(0) end
	if key == "1" then weapon.swap(1) end
	if key == "2" then weapon.swap(2) end
	if key == "o" then
		player.load()
		return
	end
	if key == "r" then
		player.apprto(love.mouse.getX(),love.mouse.getY())
		return
	end
	if key == "t" then -- this is the lowercase letter L, not a one (1)
		player.x=love.mouse.getX()
		player.y=love.mouse.getY()
		return
	end
end

function love.keyreleased(key)
	if key == "up" or key == "w" then player.sy=player.sy+player.speed; return end
	if key == "down" or key == "s" then player.sy=player.sy+-player.speed; return end
	if key == "left" or key == "a" then player.sx=player.sx+player.speed; return end
	if key == "right" or key == "d" then player.sx=player.sx+-player.speed; return end
end

function love.mousepressed(x, y, button)
	if button == 1 then -- this is the lowercase letter L, not a one (1)
		weapon.popupttl=0
		weapon.firing=true
		return
	end
	if button == 2 then
		weapon.aiming=true
		return
	end
end

function love.wheelmoved(x, y)
    if y > 0 then
        weapon.swap(weapon.type-1)
    elseif y < 0 then
        weapon.swap(weapon.type+1)
    end
end

function love.mousereleased(x, y, button)
	if button == 1 then -- this is the lowercase letter L, not a one (1)
		weapon.firing=false
		return
	end
	if button == 2 then
		weapon.aiming=false
		return
	end
end
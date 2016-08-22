require("const")
require("graphic")
require("input")
require("pause")
require("player")
require("util")
require("weapon")

function love.load(arg)
	love.window.setTitle("Loading now ...")
	LOAD_CONST()
	paused=false
	input.load()
	player.load()
	weapon.load()
	graphic.load()
	last_step=0
	love.window.setTitle(TITLE)
end

function love.update(dt)
	input.update(dt)
	if paused then
		pause.update(dt)
		return
	else
		--not paused
		weapon.update(dt)
		player.update(dt)
	end
	last_step=last_step+dt
	if last_step < UPDATE_INTERVAL then return else
		last_step = 0
		-- ######stepping here$$$$$$$
		player.step()
		weapon.step()
	end
	graphic.update(dt)
end

function love.focus(onfocus)
	if not onfocus then
		pause.pause()
	end
end

function love.quit()

end

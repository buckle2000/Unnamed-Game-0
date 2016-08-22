pause={}

function pause.pause()
		if paused then
			paused=false
			pause.continue()
		else
			paused=true
		end
	-- TODO pause
end

function pause.continue()
	if not pbykey then
	paused=false
	--TODO unpause
end
end

function pause.update(dt)
--TODO when pausing
end

function pause.draw() --draw pause menu
	if paused then
			love.graphics.origin()
			love.graphics.print("Paused... Focus to continue",10,10)
	end
end
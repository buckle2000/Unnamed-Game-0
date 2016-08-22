-- 0 default
function WDdefault()
	if weapon.firing then
		love.graphics.setColor(love.math.random(255),love.math.random(255),love.math.random(255))
		love.graphics.print("No Weapon", weapon.tx+love.math.random(FONT_NOISE_R)+20, weapon.ty+love.math.random(FONT_NOISE_R)-12)
	end
end

-- 1 pulse
function WDpulse()
	local curve
	local x1,y1,x2,y2,x3,y3,x4,y4
	if weapon.firing then
		love.graphics.setLineStyle("smooth")
		love.graphics.setLineWidth(2)
		love.graphics.setColor(pulsecolor())
		love.graphics.circle("fill", player.x, player.y, PULSE_SOURCE_R, 10)
		curve=love.math.random(math.ceil(player.dist(weapon.tx,weapon.ty)/PULSE_CURVE_L)+PULSE_CURVE_E)
		for b=1,PULSE_BEAMS do
			love.graphics.setColor(pulsecolor())
			x1=player.x
			y1=player.y
			x3=x1
			y3=y1
			for i=1,curve do
					x2=x1+(weapon.tx-player.x)*(1/curve)
					y2=y1+(weapon.ty-player.y)*(1/curve)
					x4=x2
					y4=y2
				if i==curve then
					if weapon.aiming then
						x4=x4+love.math.random(-PULSE_NOISE_RE,PULSE_NOISE_RE)/3
						y4=y4+love.math.random(-PULSE_NOISE_RE,PULSE_NOISE_RE)/3
					else
						x4=x4+love.math.random(-PULSE_NOISE_RE,PULSE_NOISE_RE)
						y4=y4+love.math.random(-PULSE_NOISE_RE,PULSE_NOISE_RE)
					end
					love.graphics.circle("fill", x4, y4, 10, 10)
				else
					x4=x4+love.math.random(-PULSE_NOISE_R,PULSE_NOISE_R)
					y4=y4+love.math.random(-PULSE_NOISE_R,PULSE_NOISE_R)
				end
				love.graphics.line(x3, y3, x4, y4)
				x1=x2
				y1=y2
				x3=x4
				y3=y4
			end
		end

	end
end

-- 2 gun
function WUgun(dt)

end
function WDgun(dt)
end


--[[
function WU(dt)

end
function WD()

end
end]]
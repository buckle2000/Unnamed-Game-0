require("weaponlist")
weapon={}
function weapon.load()
	weapon.x0=0
	weapon.y0=0
	weapon.tx=0 -- target position
	weapon.ty=0
	weapon.onplayer=false
	weapon.followmouse=true
	weapon.aiming=false
	weapon.firing=false
	weapon.type = 1
	weapon.speed=0
	weapon.range=-1
	weapon.listu={
		-- [0] = WUdefault,
		-- [1] = WUpulse,
		-- [2] = WUgun,
	}
	weapon.listd={
		[0] = WDdefault,
		[1] = WDpulse,
		[2] = WDgun,
	}
	weapon.lists={
		-- Step
		[0] = WSdefault,
		[1] = WSpulse,
		[2] = WSgun,
	}
	weapon.name={
		[0] = "Empty!",
		[1] = "Pulse",
		[2] = "Gun",
	}
	weapon.popupttl=0
end

function weapon.update(dt)
	if weapon.listu[weapon.type]~=nil then weapon.listu[weapon.type](dt) end
	if weapon.popupttl<0 then weapon.popupttl=0 elseif weapon.popupttl>0 then weapon.popupttl=weapon.popupttl-dt end
end
function weapon.draw()
	if weapon.popupttl~=0 then
		love.graphics.setColor(255,255,255, 255*(weapon.popupttl/WEAPON_POPUP_TTL))
		if weapon.name[weapon.type]==nil then
			love.graphics.print("N/A type " .. weapon.type, weapon.tx+25, weapon.ty)
		else
			love.graphics.print(weapon.name[weapon.type], weapon.tx+25, weapon.ty)
		end
	end
	if weapon.listd[weapon.type]~=nil then weapon.listd[weapon.type]() end
	local mx,my
	local l1,l2,l3,lw
	mx=love.mouse.getX()-trans_x
	my=love.mouse.getY()-trans_y
	if weapon.aiming then
		l1=10 -- circle radius
		l2=7  -- short line's length
		l3=6  -- space from circle's center to the start of the line
		lw=1.5
		love.graphics.setColor(255, 0, 0)
	else
		l1=15
		l2=8
		l3=10
		lw=2
		love.graphics.setColor(255, 255, 255)
	end
	love.graphics.setLineStyle("rough")
	love.graphics.setLineWidth(lw)
	love.graphics.line(mx+l3, my, mx+l2+l3, my)
	love.graphics.line(mx-l3, my, mx-l2-l3, my)
	love.graphics.line(mx, my+l3, mx, my+l2+l3)
	love.graphics.line(mx, my-l3, mx, my-l2-l3)
	love.graphics.circle("line", mx, my, l1, 10)
end
function weapon.step() if weapon.lists[weapon.type]~=nil then weapon.lists[weapon.type]() end end

function weapon.toplayer()
	weapon.x0=player.x
	weapon.y0=player.y
end

function weapon.swap(type)
	if weapon.listd[type]~=nil then weapon.type=type end
	weapon.popupttl=WEAPON_POPUP_TTL
end
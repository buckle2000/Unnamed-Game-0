function LOAD_CONST()
	TITLE = "test love file"
	FONT_SIZE = 20
	FONT_NOISE_R = 3

	UPDATE_INTERVAL = 1/30 -- in SECOND
	WEAPON_POPUP_TTL = 1 -- 换武器时的标签

	PLAYER_SPEED = 5

	PULSE_SOURCE_R = 7 --像能量源一样的东西
	PULSE_NOISE_R = 30 --随机抖动的距离
	PULSE_NOISE_RE = PULSE_NOISE_R --击中目标后抖动的距离，瞄准则=0
	PULSE_CURVE_L = 30 --pulse每条线段长度
	PULSE_CURVE_E = 3 --实际长度在 PULSE_CURVE_L 和 PULSE_CURVE_L+PULSE_CURVE_E 之间
	PULSE_BEAMS = 3
end

function pulsecolor()
	return 200+love.math.random(50),200+love.math.random(50),love.math.random(150)
end
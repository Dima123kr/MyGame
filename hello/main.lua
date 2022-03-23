local hc = require "lib/hc"
local timer = require "lib/timer"
math.randomseed(os.time())
x = 1000
y = 1000
r = math.pi / 2
z = 0.15
z2 = 0.035
z3 = 0.05
x40 = 1000
x41 = 1000
x42 = 1000
x43 = 1000
x44 = 1000
x45 = 1000
x46 = 1000
x47 = 1000
x48 = 1000
x49 = 1000
x410 = 1000
x420 = 1000
x421 = 1000
x422 = 1000
x423 = 1000
x424 = 1000
x425 = 1000
x426 = 1000
x427 = 1000
x428 = 1000
x429 = 1000
x4210 = 1000
y4 = 10
r4 = 0
z4 = 0.6
x5 = 1000
y5 = 1000
x6 = 1000
y6 = 1000
p4 = 0
p5 = 0
p6 = 0
p7 = 0
p8 = 0
p9 = 0
p10 = 0
p11 = 0
p12 = 0
p13 = 0
p14 = 10
p15 = 10
p16 = 0
p17 = 0
p18 = 0
p19 = 0
p20 = 0
p21 = 0
v4 = 0
file = io.open("file.txt", "r")
coins = file:read("*a")
if coins == "" then
	coins = 0
end
file:close()
pulak = {}
pula1 = {}
pula = {}
tx2 = {}
ty2 = {}
tr2 = {}
erx = {}
ery = {}
ix2 = {}
iy2 = {}
tx3 = {}
ty3 = {}
tr3 = {}
loserk = {}
loser1 = {}
loser = {}
function pula_load(r2, name)
	tx2[p4] = 1000
	ty2[p4] = 1000
	tr2[p4] = r2
	pulak[p4] = love.graphics.newImage(name)
	pula1[p4] = hc.rectangle(tx2[p4], ty2[p4], 1280 * z2, 270 * z2)
	pula[p4] = hc.register(pula1[p4])
	pula[p4]:setRotation(r2)
	if r2 == 0 then
		erx[p4] = -23
		ery[p4] = -5
	elseif r2 == math.pi then
		erx[p4] = 23
		ery[p4] = 5
	elseif r2 == math.pi / 2 then
		erx[p4] = 5
		ery[p4] = -23
	elseif r2 == -math.pi / 2 then
		erx[p4] = -5
		ery[p4] = 23
	end
	p4 = p4 + 1
end
function loser_load(r3, v3)
	tx3[p11] = -1000
	ty3[p11] = -1000
	tr3[p7] = r3
	loserk[p7] = love.graphics.newImage("res/loser1.jpg")
	loser1[p7] = hc.polygon(330*z3,0, 870*z3,0, 870*z3,200*z3, 1200*z3,200*z3, 1200*z3,700*z3, 1000*z3,700*z3, 1000*z3,800*z3, 200*z3,800*z3, 200*z3,700*z3, 0,700*z3, 0,200*z3, 330*z3,200*z3)
	loser[p7] = hc.register(loser1[p7])
	loser[p7]:setRotation(r3)
end
function pula_update(vx, vy, x2, y2, ox2, oy2, v2)
	ix2[p5] = x2 + ox2
	iy2[p5] = y2 + oy2
	if v2 == 1 then
		p1, p2, p3 = ship:collidesWith(pula[p5])
	elseif v2 == 2 then
		p1, p2, p3 = loser[0]:collidesWith(pula[p5])
	end
	if p1 == true then
		tx2[p5] = 1000
		ty2[p5] = 1000
		pula[p5]:moveTo(1000, 1000)
		if v2 == 1 and p16 == 1 then
			p14 = p14 - 1
		elseif v2 == 2 and p16 == 1 then
			p15 = p15 - 1
		end
	end
	tx2[p5] = tx2[p5] + vx * love.timer.getDelta()
	ty2[p5] = ty2[p5] + vy * love.timer.getDelta()
	pula[p5]:move(vx * love.timer.getDelta(), vy * love.timer.getDelta())
	p5 = p5 + 1
	if p5 == 48 then
		p5 = 0
	end
end
function loser_update(v3)
	if p10 == 1 and p16 == 1 then
		tx2[p8] = ix2[p8] + erx[p8]
		ty2[p8] = iy2[p8] + ery[p8]
		pula[p8]:moveTo(ix2[p8], iy2[p8])
		p8 = p8 + 1
		tx2[p8] = ix2[p8] + erx[p8]
		ty2[p8] = iy2[p8] + ery[p8]
		pula[p8]:moveTo(ix2[p8], iy2[p8])
		p8 = p8 + 1
		tx2[p8] = ix2[p8] + erx[p8]
		ty2[p8] = iy2[p8] + ery[p8]
		pula[p8]:moveTo(ix2[p8], iy2[p8])
		p8 = p8 + 1
		tx2[p8] = ix2[p8] + erx[p8]
		ty2[p8] = iy2[p8] + ery[p8]
		pula[p8]:moveTo(ix2[p8], iy2[p8])
		p8 = p8 + 1
	end
	if p17 == 1 and p16 == 1 then
		tx3[p11] = math.random(10, 790)
		ty3[p11] = math.random(10, 590)
	end
	loser[p11]:moveTo(tx3[p11],ty3[p11] + 15)
	p11 = p11 + 1
	if p11 == 1 then
		p11 = 0
	end
	if p8 == 24 then
		p8 = 0
	end
	p10 = 0
	p17 = 0
end
function pula_draw()
	love.graphics.draw(pulak[p6], tx2[p6], ty2[p6], tr2[p6], z2, z2)
	--pula[p6]:draw("fill")
	p6 = p6 + 1
	if p6 == 48 then
		p6 = 0
	end
end
function loser_draw()
	love.graphics.draw(loserk[p9], tx3[p9], ty3[p9], tr3[p9], z3, z3, 640, 135)
	--loser[p9]:draw("fill")
	p9 = p9 + 1
	if p9 == 1 then
		p9 = 0
	end
end
function love.load()
	timer.every(2, function() p10 = 1 end)
	timer.every(2, function() p13 = 1 end)
	timer.every(3, function() p17 = 1 end)
	player = love.graphics.newImage("res/ship.png")
	kosmos = love.graphics.newImage("res/kosmos.png")
	win = love.graphics.newImage("res/win.png")
	lose = love.graphics.newImage("res/lose.png")
	coin = love.graphics.newImage("res/coin.png")
	s1 = love.graphics.newFont("res/s1.ttf", 90)
	s2 = love.graphics.newFont("res/s1.ttf", 30)
	s3 = love.graphics.newFont("res/s1.ttf", 40)
	ship1 = hc.polygon(0,65*z, 35*z,65*z, 35*z,225*z, 140*z,225*z, 140*z,0, 215*z,0, 215*z,225*z, 320*z,225*z, 320*z,65*z, 355*z,65*z, 355*z,355*z, 0,355*z)
	ship = hc.register(ship1)
	ship:setRotation(r)
	ship:moveTo(x, y)
	function loadhp()
		hp1 = love.graphics.newImage("res/hp1.png")
		hp2 = love.graphics.newImage("res/hp2.png")
		hp3 = love.graphics.newImage("res/hp3.png")
		hp4 = love.graphics.newImage("res/hp4.png")
		hp5 = love.graphics.newImage("res/hp5.png")
		hp6 = love.graphics.newImage("res/hp6.png")
		hp7 = love.graphics.newImage("res/hp7.png")
		hp8 = love.graphics.newImage("res/hp8.png")
		hp9 = love.graphics.newImage("res/hp9.png")
		hp10 = love.graphics.newImage("res/hp10.png")
		----------------------------------------------------
		hpv1 = love.graphics.newImage("res/hpv1.png")
		hpv2 = love.graphics.newImage("res/hpv2.png")
		hpv3 = love.graphics.newImage("res/hpv3.png")
		hpv4 = love.graphics.newImage("res/hpv4.png")
		hpv5 = love.graphics.newImage("res/hpv5.png")
		hpv6 = love.graphics.newImage("res/hpv6.png")
		hpv7 = love.graphics.newImage("res/hpv7.png")
		hpv8 = love.graphics.newImage("res/hpv8.png")
		hpv9 = love.graphics.newImage("res/hpv9.png")
		hpv10 = love.graphics.newImage("res/hpv10.png")
	end
	loadhp()
	function loadf()
		---------------------------------
		loser_load(0)
		---------------------------------
		pula_load(math.pi,"res/pula.png")
		pula_load(0,"res/pula.png")
		pula_load(math.pi / 2,"res/pula.png")
		pula_load(-math.pi / 2,"res/pula.png")
		---------------------------------
		pula_load(math.pi,"res/pula.png")
		pula_load(0,"res/pula.png")
		pula_load(math.pi / 2,"res/pula.png")
		pula_load(-math.pi / 2,"res/pula.png")
		---------------------------------
		pula_load(math.pi,"res/pula.png")
		pula_load(0,"res/pula.png")
		pula_load(math.pi / 2,"res/pula.png")
		pula_load(-math.pi / 2,"res/pula.png")
		---------------------------------
		pula_load(math.pi,"res/pula.png")
		pula_load(0,"res/pula.png")
		pula_load(math.pi / 2,"res/pula.png")
		pula_load(-math.pi / 2,"res/pula.png")
		---------------------------------
		pula_load(math.pi,"res/pula.png")
		pula_load(0,"res/pula.png")
		pula_load(math.pi / 2,"res/pula.png")
		pula_load(-math.pi / 2,"res/pula.png")
		---------------------------------
		pula_load(math.pi,"res/pula.png")
		pula_load(0,"res/pula.png")
		pula_load(math.pi / 2,"res/pula.png")
		pula_load(-math.pi / 2,"res/pula.png")
		---------------------------------
		pula_load(math.pi,"res/pula2.png")
		pula_load(math.pi,"res/pula2.png")
		pula_load(math.pi,"res/pula2.png")
		pula_load(math.pi,"res/pula2.png")
		pula_load(math.pi,"res/pula2.png")
		pula_load(math.pi,"res/pula2.png")
		---------------------------------
		pula_load(0,"res/pula2.png")
		pula_load(0,"res/pula2.png")
		pula_load(0,"res/pula2.png")
		pula_load(0,"res/pula2.png")
		pula_load(0,"res/pula2.png")
		pula_load(0,"res/pula2.png")
		---------------------------------
		pula_load(math.pi / 2,"res/pula2.png")
		pula_load(math.pi / 2,"res/pula2.png")
		pula_load(math.pi / 2,"res/pula2.png")
		pula_load(math.pi / 2,"res/pula2.png")
		pula_load(math.pi / 2,"res/pula2.png")
		pula_load(math.pi / 2,"res/pula2.png")
		---------------------------------
		pula_load(-math.pi / 2,"res/pula2.png")
		pula_load(-math.pi / 2,"res/pula2.png")
		pula_load(-math.pi / 2,"res/pula2.png")
		pula_load(-math.pi / 2,"res/pula2.png")
		pula_load(-math.pi / 2,"res/pula2.png")
		pula_load(-math.pi / 2,"res/pula2.png")
		---------------------------------
	end
	loadf()
end
function love.update(dt)
	timer.update(dt)
	if love.keyboard.isDown("rshift") and p16 == 0 then
		p16 = 1
		p19 = 1
		p14 = 10
		p15 = 10
	elseif love.keyboard.isDown("lshift") and p16 == 2 then
		p16 = 0
		x5 = 1000
		y5 = 1000
		x6 = 1000
		y6 = 1000
	end
	function ship_update()
		if p16 == 1 and p19 == 1 then
			x = 150
			y = 300
			ship:moveTo(x,y)
			p19 = 0
		end
		if love.keyboard.isDown("w") and y >= 0 and p16 == 1 then
			y = y - 100 * dt
			r = 0
			ship:moveTo(x,y)
			ship:setRotation(r)
			ship:move(0, -100 * dt)
		end
		if love.keyboard.isDown("s") and y <= 600 and p16 == 1 then
			y = y + 100 * dt
			r = math.pi
			ship:moveTo(x,y)
			ship:setRotation(r)
			ship:move(0, 100 * dt)
		end
		if love.keyboard.isDown("a") and x >= 0 and p16 == 1 then
			x = x - 100 * dt
			r = -math.pi / 2
			ship:moveTo(x,y)
			ship:setRotation(r)
			ship:move(-100 * dt, 0)
		end
		if love.keyboard.isDown("d") and x <= 800 and p16 == 1 then
			x = x + 100 * dt
			r = math.pi / 2
			ship:moveTo(x,y)
			ship:setRotation(r)
			ship:move(100 * dt, 0)
		end
		if love.keyboard.isDown("space") and r == 0 and p13 == 1 and p16 == 1 then
			tx2[p12 + 42] = x - 24 + erx[p12 + 42]
			ty2[p12 + 42] = y - 45 + ery[p12 + 42]
			pula[p12 + 42]:moveTo(x - 24, y - 45)
			p12 = p12 + 1
			tx2[p12 + 42] = x + 24 + erx[p12 + 42]
			ty2[p12 + 42] = y - 45 + ery[p12 + 42]
			pula[p12 + 42]:moveTo(x + 24, y - 45)
			p12 = p12 + 1
			if p12 == 6 then
				p12 = 0
			end
			p13 = 0
		end
		if love.keyboard.isDown("space") and r == math.pi and p13 == 1 and p16 == 1 then
			tx2[p12 + 36] = x + 24 + erx[p12 + 36]
			ty2[p12 + 36] = y + 45 + ery[p12 + 36]
			pula[p12 + 36]:moveTo(x + 24, y + 45)
			p12 = p12 + 1
			tx2[p12 + 36] = x - 24 + erx[p12 + 36]
			ty2[p12 + 36] = y + 45 + ery[p12 + 36]
			pula[p12 + 36]:moveTo(x - 24, y + 45)
			p12 = p12 + 1
			if p12 == 6 then
				p12 = 0
			end
			p13 = 0
		end
		if love.keyboard.isDown("space") and r == math.pi / 2 and p13 == 1 and p16 == 1 then
			tx2[p12 + 30] = x + 45 + erx[p12 + 30]
			ty2[p12 + 30] = y - 24 + ery[p12 + 30]
			pula[p12 + 30]:moveTo(x + 45, y - 24)
			p12 = p12 + 1
			tx2[p12 + 30] = x + 45 + erx[p12 + 30]
			ty2[p12 + 30] = y + 24 + ery[p12 + 30]
			pula[p12 + 30]:moveTo(x + 45, y + 24)
			p12 = p12 + 1
			if p12 == 6 then
				p12 = 0
			end
			p13 = 0
		end
		if love.keyboard.isDown("space") and r == -math.pi / 2 and p13 == 1 and p16 == 1 then
			tx2[p12 + 24] = x - 45 + erx[p12 + 24]
			ty2[p12 + 24] = y + 24 + ery[p12 + 24]
			pula[p12 + 24]:moveTo(x - 45, y + 24)
			p12 = p12 + 1
			tx2[p12 + 24] = x - 45 + erx[p12 + 24]
			ty2[p12 + 24] = y - 24 + ery[p12 + 24]
			pula[p12 + 24]:moveTo(x - 45, y - 24)
			p12 = p12 + 1
			if p12 == 6 then
				p12 = 0
			end
			p13 = 0
		end
	end
	ship_update()
	function hp()
		if p14 == 1 and p16 == 1 then
			x40 = 1000
			x41 = 1000
			x42 = 1000
			x43 = 1000
			x44 = 1000
			x45 = 1000
			x46 = 1000
			x47 = 1000
			x48 = 1000
			x49 = 1000
			x410 = 10
		elseif p14 == 2 and p16 == 1 then
			x40 = 1000
			x41 = 1000
			x42 = 1000
			x43 = 1000
			x44 = 1000
			x45 = 1000
			x46 = 1000
			x47 = 1000
			x48 = 1000
			x49 = 10
			x410 = 1000
		elseif p14 == 3 and p16 == 1 then
			x40 = 1000
			x41 = 1000
			x42 = 1000
			x43 = 1000
			x44 = 1000
			x45 = 1000
			x46 = 1000
			x47 = 1000
			x48 = 10
			x49 = 1000
			x410 = 1000
		elseif p14 == 4 and p16 == 1 then
			x40 = 1000
			x41 = 1000
			x42 = 1000
			x43 = 1000
			x44 = 1000
			x45 = 1000
			x46 = 1000
			x47 = 10
			x48 = 1000
			x49 = 1000
			x410 = 1000
		elseif p14 == 5 and p16 == 1 then
			x40 = 1000
			x41 = 1000
			x42 = 1000
			x43 = 1000
			x44 = 1000
			x45 = 1000
			x46 = 10
			x47 = 1000
			x48 = 1000
			x49 = 1000
			x410 = 1000
		elseif p14 == 6 and p16 == 1 then
			x40 = 1000
			x41 = 1000
			x42 = 1000
			x43 = 1000
			x44 = 1000
			x45 = 10
			x46 = 1000
			x47 = 1000
			x48 = 1000
			x49 = 1000
			x410 = 1000
		elseif p14 == 7 and p16 == 1 then
			x40 = 1000
			x41 = 1000
			x42 = 1000
			x43 = 1000
			x44 = 10
			x45 = 1000
			x46 = 1000
			x47 = 1000
			x48 = 1000
			x49 = 1000
			x410 = 1000
		elseif p14 == 8 and p16 == 1 then
			x40 = 1000
			x41 = 1000
			x42 = 1000
			x43 = 10
			x44 = 1000
			x45 = 1000
			x46 = 1000
			x47 = 1000
			x48 = 1000
			x49 = 1000
			x410 = 1000
		elseif p14 == 9 and p16 == 1 then
			x40 = 1000
			x41 = 1000
			x42 = 10
			x43 = 1000
			x44 = 1000
			x45 = 1000
			x46 = 1000
			x47 = 1000
			x48 = 1000
			x49 = 1000
			x410 = 1000
		elseif p14 == 10 and p16 == 1 then
			x40 = 1000
			x41 = 10
			x42 = 1000
			x43 = 1000
			x44 = 1000
			x45 = 1000
			x46 = 1000
			x47 = 1000
			x48 = 1000
			x49 = 1000
			x410 = 1000
		elseif p14 <= 0 and p16 == 1 then
			p16 = 2
			x6 = 150
			y6 = 150
			x = 1000
			y = 1000
			tx3[0] = -1000
			ty3[0] = -1000
			x420 = 1000
			x421 = 1000
			x422 = 1000
			x423 = 1000
			x424 = 1000
			x425 = 1000
			x426 = 1000
			x427 = 1000
			x428 = 1000
			x429 = 1000
			x4210 = 1000
			x40 = 1000
			x41 = 1000
			x42 = 1000
			x43 = 1000
			x44 = 1000
			x45 = 1000
			x46 = 1000
			x47 = 1000
			x48 = 1000
			x49 = 1000
			x410 = 1000
		end
		if p15 == 1 and p16 == 1 then
			x420 = 1000
			x421 = 1000
			x422 = 1000
			x423 = 1000
			x424 = 1000
			x425 = 1000
			x426 = 1000
			x427 = 1000
			x428 = 1000
			x429 = 1000
			x4210 = 500
		elseif p15 == 2 and p16 == 1 then
			x420 = 1000
			x421 = 1000
			x422 = 1000
			x423 = 1000
			x424 = 1000
			x425 = 1000
			x426 = 1000
			x427 = 1000
			x428 = 1000
			x429 = 500
			x4210 = 1000
		elseif p15 == 3 and p16 == 1 then
			x420 = 1000
			x421 = 1000
			x422 = 1000
			x423 = 1000
			x424 = 1000
			x425 = 1000
			x426 = 1000
			x427 = 1000
			x428 = 500
			x429 = 1000
			x4210 = 1000
		elseif p15 == 4 and p16 == 1 then
			x420 = 1000
			x421 = 1000
			x422 = 1000
			x423 = 1000
			x424 = 1000
			x425 = 1000
			x426 = 1000
			x427 = 500
			x428 = 1000
			x429 = 1000
			x4210 = 1000
		elseif p15 == 5 and p16 == 1 then
			x420 = 1000
			x421 = 1000
			x422 = 1000
			x423 = 1000
			x424 = 1000
			x425 = 1000
			x426 = 500
			x427 = 1000
			x428 = 1000
			x429 = 1000
			x4210 = 1000
		elseif p15 == 6 and p16 == 1 then
			x420 = 1000
			x421 = 1000
			x422 = 1000
			x423 = 1000
			x424 = 1000
			x425 = 500
			x426 = 1000
			x427 = 1000
			x428 = 1000
			x429 = 1000
			x4210 = 1000
		elseif p15 == 7 and p16 == 1 then
			x420 = 1000
			x421 = 1000
			x422 = 1000
			x423 = 1000
			x424 = 500
			x425 = 1000
			x426 = 1000
			x427 = 1000
			x428 = 1000
			x429 = 1000
			x4210 = 1000
		elseif p15 == 8 and p16 == 1 then
			x420 = 1000
			x421 = 1000
			x422 = 1000
			x423 = 500
			x424 = 1000
			x425 = 1000
			x426 = 1000
			x427 = 1000
			x428 = 1000
			x429 = 1000
			x4210 = 1000
		elseif p15 == 9 and p16 == 1 then
			x420 = 1000
			x421 = 1000
			x422 = 500
			x423 = 1000
			x424 = 1000
			x425 = 1000
			x426 = 1000
			x427 = 1000
			x428 = 1000
			x429 = 1000
			x4210 = 1000
		elseif p15 == 10 and p16 == 1 then
			x420 = 1000
			x421 = 500
			x422 = 1000
			x423 = 1000
			x424 = 1000
			x425 = 1000
			x426 = 1000
			x427 = 1000
			x428 = 1000
			x429 = 1000
			x4210 = 1000
		elseif p15 <= 0 and p16 == 1 then
			p16 = 2
			x5 = 150
			y5 = 150
			x = 1000
			y = 1000
			tx3[0] = -1000
			ty3[0] = -1000
			x420 = 1000
			x421 = 1000
			x422 = 1000
			x423 = 1000
			x424 = 1000
			x425 = 1000
			x426 = 1000
			x427 = 1000
			x428 = 1000
			x429 = 1000
			x4210 = 1000
			x40 = 1000
			x41 = 1000
			x42 = 1000
			x43 = 1000
			x44 = 1000
			x45 = 1000
			x46 = 1000
			x47 = 1000
			x48 = 1000
			x49 = 1000
			x410 = 1000
			file = io.open("file.txt", "w")
			coins = coins + 1000
			file:write(coins)
			file:flush()
			file:close()
		end
	end
	hp()
	function update()
		-------------------------------------
		loser_update(1)
		-------------------------------------
		pula_update(-200, 0, tx3[0], ty3[0], -50, 20,1)
		pula_update(200, 0, tx3[0], ty3[0], 50, 20,1)
		pula_update(0, 200, tx3[0], ty3[0], 0, 50,1)
		pula_update(0, -200, tx3[0], ty3[0], 0, -25,1)
		-------------------------------------
		pula_update(-200, 0, tx3[0], ty3[0], -50, 20,1)
		pula_update(200, 0, tx3[0], ty3[0], 50, 20,1)
		pula_update(0, 200, tx3[0], ty3[0], 0, 50,1)
		pula_update(0, -200, tx3[0], ty3[0], 0, -25,1)
		-------------------------------------
		pula_update(-200, 0, tx3[0], ty3[0], -50, 20,1)
		pula_update(200, 0, tx3[0], ty3[0], 50, 20,1)
		pula_update(0, 200, tx3[0], ty3[0], 0, 50,1)
		pula_update(0, -200, tx3[0], ty3[0], 0, -25,1)
		-------------------------------------
		pula_update(-200, 0, tx3[0], ty3[0], -50, 20,1)
		pula_update(200, 0, tx3[0], ty3[0], 50, 20,1)
		pula_update(0, 200, tx3[0], ty3[0], 0, 50,1)
		pula_update(0, -200, tx3[0], ty3[0], 0, -25,1)
		-------------------------------------
		pula_update(-200, 0, tx3[0], ty3[0], -50, 20,1)
		pula_update(200, 0, tx3[0], ty3[0], 50, 20,1)
		pula_update(0, 200, tx3[0], ty3[0], 0, 50,1)
		pula_update(0, -200, tx3[0], ty3[0], 0, -25,1)
		-------------------------------------
		pula_update(-200, 0, tx3[0], ty3[0], -50, 20,1)
		pula_update(200, 0, tx3[0], ty3[0], 50, 20,1)
		pula_update(0, 200, tx3[0], ty3[0], 0, 50,1)
		pula_update(0, -200, tx3[0], ty3[0], 0, -25,1)
		-------------------------------------
		pula_update(-200, 0, x, y, -50, 20,2)
		pula_update(-200, 0, x, y, -50, 20,2)
		pula_update(-200, 0, x, y, -50, 20,2)
		pula_update(-200, 0, x, y, -50, 20,2)
		pula_update(-200, 0, x, y, -50, 20,2)
		pula_update(-200, 0, x, y, -50, 20,2)
		-------------------------------------
		pula_update(200, 0, x, y, 50, 20,2)
		pula_update(200, 0, x, y, 50, 20,2)
		pula_update(200, 0, x, y, 50, 20,2)
		pula_update(200, 0, x, y, 50, 20,2)
		pula_update(200, 0, x, y, 50, 20,2)
		pula_update(200, 0, x, y, 50, 20,2)
		-------------------------------------
		pula_update(0, 200, x, y, 0, 50,2)
		pula_update(0, 200, x, y, 0, 50,2)
		pula_update(0, 200, x, y, 0, 50,2)
		pula_update(0, 200, x, y, 0, 50,2)
		pula_update(0, 200, x, y, 0, 50,2)
		pula_update(0, 200, x, y, 0, 50,2)
		-------------------------------------
		pula_update(0, -200, x, y, 0, -25,2)
		pula_update(0, -200, x, y, 0, -25,2)
		pula_update(0, -200, x, y, 0, -25,2)
		pula_update(0, -200, x, y, 0, -25,2)
		pula_update(0, -200, x, y, 0, -25,2)
		pula_update(0, -200, x, y, 0, -25,2)
		-------------------------------------
	end
	update()
end

function love.draw()
	love.graphics.setColor(255, 255, 255)
	if p16 ~= 2 then
		love.graphics.draw(kosmos)
	end
	love.graphics.draw(win, x5, y5)
	love.graphics.draw(lose, x6, y6)
	love.graphics.draw(player, x, y, r, z, z, 180, 180)
	--ship:draw("fill")
	love.graphics.draw(coin, 5, 560, 0, 0.25, 0.25)
	love.graphics.setFont(s3)
	love.graphics.print(coins,50,565)
	if p16 == 0 then
		love.graphics.setFont(s1)
		love.graphics.print("КОСМИЧЕСКИЕ БОИ", 5)
		love.graphics.setFont(s2)
		love.graphics.print("Чтобы пойти в бой нажми левый 'shift'", 100, 400)
	elseif p16 == 2 then
		love.graphics.setFont(s2)
		love.graphics.print("Чтобы выйти в меню нажми правый 'shift'", 100, 400)
	end
	function drawhp()
		love.graphics.draw(hp1, x41, y4, r4, z4, z4)
		love.graphics.draw(hp2, x42, y4, r4, z4, z4)
		love.graphics.draw(hp3, x43, y4, r4, z4, z4)
		love.graphics.draw(hp4, x44, y4, r4, z4, z4)
		love.graphics.draw(hp5, x45, y4, r4, z4, z4)
		love.graphics.draw(hp6, x46, y4, r4, z4, z4)
		love.graphics.draw(hp7, x47, y4, r4, z4, z4)
		love.graphics.draw(hp8, x48, y4, r4, z4, z4)
		love.graphics.draw(hp9, x49, y4, r4, z4, z4)
		love.graphics.draw(hp10, x410, y4, r4, z4, z4)
		---------------------------------------------------
		love.graphics.draw(hpv1, x421, y4, r4, z4, z4)
		love.graphics.draw(hpv2, x422, y4, r4, z4, z4)
		love.graphics.draw(hpv3, x423, y4, r4, z4, z4)
		love.graphics.draw(hpv4, x424, y4, r4, z4, z4)
		love.graphics.draw(hpv5, x425, y4, r4, z4, z4)
		love.graphics.draw(hpv6, x426, y4, r4, z4, z4)
		love.graphics.draw(hpv7, x427, y4, r4, z4, z4)
		love.graphics.draw(hpv8, x428, y4, r4, z4, z4)
		love.graphics.draw(hpv9, x429, y4, r4, z4, z4)
		love.graphics.draw(hpv10, x4210, y4, r4, z4, z4)
	end
	drawhp()
	function draw()
		loser_draw()
		-----------------------------------
		pula_draw()
		pula_draw()
		pula_draw()
		pula_draw()
		pula_draw()
		pula_draw()
		pula_draw()
		pula_draw()
		pula_draw()
		pula_draw()
		pula_draw()
		pula_draw()
		pula_draw()
		pula_draw()
		pula_draw()
		pula_draw()
		pula_draw()
		pula_draw()
		pula_draw()
		pula_draw()
		pula_draw()
		pula_draw()
		pula_draw()
		pula_draw()
		pula_draw()
		pula_draw()
		pula_draw()
		pula_draw()
		pula_draw()
		pula_draw()
		pula_draw()
		pula_draw()
		pula_draw()
		pula_draw()
		pula_draw()
		pula_draw()
		pula_draw()
		pula_draw()
		pula_draw()
		pula_draw()
		pula_draw()
		pula_draw()
		pula_draw()
		pula_draw()
		pula_draw()
		pula_draw()
		pula_draw()
		pula_draw()
	end
	draw()
end
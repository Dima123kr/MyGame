local hc = require "lib/hc"
local timer = require "lib/timer"
math.randomseed(os.time())
x = 1000
y = 1000
r = math.pi / 2
z = 0.15
z2 = 0.035
z3 = 0.05
phpp = 0
phpv = 0
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
p22 = 0
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
			phpp = phpp - 100
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
	timer.every(0.125, function() if p13 < 75 then p13 = p13 + 1.5625 end end)
	timer.every(3, function() p17 = 1 end)
	timer.every(0.5, function() p22 = 1 end)
	player = love.graphics.newImage("res/ship.png")
	kosmos = love.graphics.newImage("res/kosmos.png")
	win = love.graphics.newImage("res/win.png")
	lose = love.graphics.newImage("res/lose.png")
	coin = love.graphics.newImage("res/coin.png")
	puli = love.graphics.newImage("res/puli.png")
	hpp = love.graphics.newImage("res/hp.png")
	hpv = love.graphics.newImage("res/hp.png")
	s1 = love.graphics.newFont("res/s1.ttf", 90)
	s2 = love.graphics.newFont("res/s1.ttf", 30)
	s3 = love.graphics.newFont("res/s1.ttf", 40)
	ship1 = hc.polygon(0,65*z, 35*z,65*z, 35*z,225*z, 140*z,225*z, 140*z,0, 215*z,0, 215*z,225*z, 320*z,225*z, 320*z,65*z, 355*z,65*z, 355*z,355*z, 0,355*z)
	ship = hc.register(ship1)
	ship:setRotation(r)
	ship:moveTo(x, y)
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
	print(love.mouse.getPosition())
	timer.update(dt)
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
		if love.keyboard.isDown("space") and r == 0 and p13 >= 25 and p16 == 1 and p22 == 1 then
			tx2[p12 + 42] = x - 24 + erx[p12 + 42]
			ty2[p12 + 42] = y - 45 + ery[p12 + 42]
			pula[p12 + 42]:moveTo(x - 24, y - 45)
			p12 = p12 + 1
			tx2[p12 + 42] = x + 24 + erx[p12 + 42]
			ty2[p12 + 42] = y - 45 + ery[p12 + 42]
			pula[p12 + 42]:moveTo(x + 24, y - 45)
			p12 = p12 + 1
			p13 = p13 - 25
			if p12 == 6 then
				p12 = 0
			end
			p22 = 0
		end
		if love.keyboard.isDown("space") and r == math.pi and p13 >= 25 and p16 == 1 and p22 == 1 then
			tx2[p12 + 36] = x + 24 + erx[p12 + 36]
			ty2[p12 + 36] = y + 45 + ery[p12 + 36]
			pula[p12 + 36]:moveTo(x + 24, y + 45)
			p12 = p12 + 1
			tx2[p12 + 36] = x - 24 + erx[p12 + 36]
			ty2[p12 + 36] = y + 45 + ery[p12 + 36]
			pula[p12 + 36]:moveTo(x - 24, y + 45)
			p12 = p12 + 1
			p13 = p13 - 25
			if p12 == 6 then
				p12 = 0
			end
			p22 = 0
		end
		if love.keyboard.isDown("space") and r == math.pi / 2 and p13 >= 25 and p16 == 1 and p22 == 1 then
			tx2[p12 + 30] = x + 45 + erx[p12 + 30]
			ty2[p12 + 30] = y - 24 + ery[p12 + 30]
			pula[p12 + 30]:moveTo(x + 45, y - 24)
			p12 = p12 + 1
			tx2[p12 + 30] = x + 45 + erx[p12 + 30]
			ty2[p12 + 30] = y + 24 + ery[p12 + 30]
			pula[p12 + 30]:moveTo(x + 45, y + 24)
			p12 = p12 + 1
			p13 = p13 - 25
			if p12 == 6 then
				p12 = 0
			end
			p22 = 0
		end
		if love.keyboard.isDown("space") and r == -math.pi / 2 and p13 >= 25 and p16 == 1 and p22 == 1 then
			tx2[p12 + 24] = x - 45 + erx[p12 + 24]
			ty2[p12 + 24] = y + 24 + ery[p12 + 24]
			pula[p12 + 24]:moveTo(x - 45, y + 24)
			p12 = p12 + 1
			tx2[p12 + 24] = x - 45 + erx[p12 + 24]
			ty2[p12 + 24] = y - 24 + ery[p12 + 24]
			pula[p12 + 24]:moveTo(x - 45, y - 24)
			p12 = p12 + 1
			p13 = p13 - 25
			if p12 == 6 then
				p12 = 0
			end
			p22 = 0
		end
	end
	ship_update()
	function hp()
		if phpp <= 0 and p16 == 1 then
			p16 = 2
			x6 = 150
			y6 = 150
			x = 1000
			y = 1000
			tx3[0] = -1000
			ty3[0] = -1000
		end
		if p15 <= 0 and p16 == 1 then
			p16 = 2
			x5 = 150
			y5 = 150
			x = 1000
			y = 1000
			tx3[0] = -1000
			ty3[0] = -1000
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
	love.graphics.setColor(1, 1, 1)
	if p16 ~= 2 then
		love.graphics.draw(kosmos)
	end
	love.graphics.draw(win, x5, y5)
	love.graphics.draw(lose, x6, y6)
	love.graphics.draw(player, x, y, r, z, z, 180, 180)
	--ship:draw("fill")
	love.graphics.draw(coin, 5, 560, 0, 0.25, 0.25)
	love.graphics.setColor(0.8, 0.8, 0.8)
	love.graphics.rectangle("fill", x - 37, y - 50, p13, 20 * 0.75)
	love.graphics.setColor(0.8, 0.8, 0.8)
	love.graphics.rectangle("fill", x - 37, y - 70, phpp / 13.5, 20 * 0.75)
	love.graphics.rectangle("fill", tx3[0] - 37, ty3[0] - 30, phpv / 13.5, 20 * 0.75)
	love.graphics.setColor(1, 1, 1)
	love.graphics.draw(puli, x - 37, y - 50, 0, 0.75, 0.75)
	love.graphics.draw(hpp, x - 37, y - 70, 0, 0.75, 0.75)
	love.graphics.draw(hpv, tx3[0] - 37, ty3[0] - 30, 0, 0.75, 0.75)
	love.graphics.setFont(s3)
	love.graphics.print(coins,50,565)
	if p16 == 0 then
		love.graphics.setFont(s1)
		love.graphics.print("КОСМИЧЕСКИЕ БОИ", 5)
		love.graphics.print("В БОЙ", 250, 350)
	elseif p16 == 2 then
		love.graphics.print("В МЕНЮ", 250, 350)
	end
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

function love.mousepressed(x4, y4, button, istouch, presses)
	if button == 1 and x4 < 510 and x4 > 250 and y4 < 415 and y4 > 350 and p16 == 0 then
		p16 = 1
		p19 = 1
		phpp = 1000
		phpv = 1000
	elseif button == 1 and x4 < 510 and x4 > 250 and y4 < 415 and y4 > 350 and p16 == 0 then
		p16 = 0
		x5 = 1000
		y5 = 1000
		x6 = 1000
		y6 = 1000
	end
end
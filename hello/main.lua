local hc = require "lib/hc"
x = 50
y = 50
r = 0
z = 0.15
x3 = 500
y3 = 300
r3 = 0
z3 = 0.05
z2 = 0.035
p4 = 0
p5 = 0
p6 = 0
pulak = {}
pula1 = {}
pula = {}
tx2 = {}
ty2 = {}
tr2 = {}
function pula_load(r2,name,x2,y2)
	tx2[p4] = 1000
	ty2[p4] = 1000
	tr2[p4] = r2
	pulak[p4] = love.graphics.newImage(name)
	pula1[p4] = hc.rectangle(tx2[p4], ty2[p4], 1280 * z2, 270 * z2)
	pula[p4] = hc.register(pula1[p4])
	pula[p4]:setRotation(r2)
	if tr2[p4] == math.pi then
		ty2[p4] = y2
	elseif tr2[p4] == 0 then
		ty2[p4] = y2
	elseif tr2[p4] == math.pi / 2 then
		ty2[p4] = y2
	end
	p4 = p4 + 1
end
function loser_load()
	
end
function pula_update(vx, vy,x2,y2)
	p1, p2, p3 = ship:collidesWith(pula[p5])
	print(p1)
	if p1 == true or tx2[p5] < -100 or tx2[p5] > 900 or ty2[p5] < -100 or ty2[p5] > 700 then
		if tr2[p5] == math.pi then
			tx2[p5] = x2
		elseif tr2[p5] == 0 then
			tx2[p5] = x2
		elseif tx2[p5] == math.pi / 2 then
			tx2[p5] = x2
		end
		pula[p5]:moveTo(x3, y3)
	end
	tx2[p5] = tx2[p5] + vx * love.timer.getDelta()
	ty2[p5] = ty2[p5] + vy * love.timer.getDelta()
	pula[p5]:move(vx * love.timer.getDelta(), vy * love.timer.getDelta())
	p5 = p5 + 1
	if p5 == 3 then
		p5 = 0
	end
end
function loser_update()
	
end
function pula_draw()
	love.graphics.draw(pulak[p6], tx2[p6], ty2[p6], tr2[p6], z2, z2)
	pula[p6]:draw("fill")
	p6 = p6 + 1
	if p6 == 3 then
		p6 = 0
	end
end
function loser_draw()
	
end
function love.load()
	player = love.graphics.newImage("res/ship.png")
	loser11 = love.graphics.newImage("res/loser1.jpg")
	ship1 = hc.polygon(x + 0,x + 65 * z, x + 35 * z,x + 65 * z, x + 35 * z,x + 225 * z, x + 140 * z,x + 225 * z, x + 140 * z,x + 0, x + 215 * z,x + 0, x + 215 * z,x + 225 * z, x + 320 * z,x + 225 * z, x + 320 * z,x + 65 * z, x + 355 * z,x + 65 * z, x + 355 * z,x + 355 * z, x + 0,x + 355 * z)
	ship = hc.register(ship1)
	ship:move(-186 * z, -186 * z)
	pula_load(math.pi,"res/pula.png",x3 + 23,y3 + 5)
	pula_load(0,"res/pula.png",x3 - 23,y3 - 5)
	pula_load(math.pi / 2,"res/pula.png",x3,y3)
end
function love.update(dt)
	if love.keyboard.isDown("w") and y >= 0 then
		y = y - 100 * dt
		r = 0
		ship:moveTo(x,y)
		ship:setRotation(r)
		ship:move(0, -100 * dt)
	elseif love.keyboard.isDown("s") and y <= 600 then
		y = y + 100 * dt
		r = math.pi
		ship:moveTo(x,y)
		ship:setRotation(r)
		ship:move(0, 100 * dt)
	elseif love.keyboard.isDown("a") and x >= 0 then
		x = x - 100 * dt
		r = -math.pi / 2
		ship:moveTo(x,y)
		ship:setRotation(r)
		ship:move(-100 * dt, 0)
	elseif love.keyboard.isDown("d") and x <= 800 then
		x = x + 100 * dt
		r = math.pi / 2
		ship:moveTo(x,y)
		ship:setRotation(r)
		ship:move(100 * dt, 0)
	end
	pula_update(-100, 0,x3 + 23,y3 + 5)
	pula_update(100, 0,x3 - 23,y3 - 5)
	pula_update(0, -100,x3,y3)
end

function love.draw()
	love.graphics.setColor(255, 255, 255)
	love.graphics.draw(player, x, y, r, z, z, 180, 180)
	love.graphics.draw(loser11, x3, y3, r3, z3, z3, 640, 135)
	ship:draw("fill")
	pula_draw()
	pula_draw()
	pula_draw()
end

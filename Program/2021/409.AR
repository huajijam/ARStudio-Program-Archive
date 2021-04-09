local hpos
local flash =0
local put = 0
local bput = 0
local GoP = {1,2,3,4,5,6,7,8}
local GiP = {8,7,6,5,4,3,2,1}
local cut = 0--64
local check = 0--66
local metal = 0 --65
local color = 0 --67
local hr = p1
local hl = p2
local tr = p3
local ta = p4
local tb = p5
local tc = p6
local cr = p7
local ca = p8
local cc = p9
local br = p10
local b1 = p11
local b2 = p12
local b3 = p13
local b4 = p14
local b5 = p15
local b6 = p16
local r2 = p17
local v2 = p18
local r3 = p19
local v3 = p20
local r4 = p21
local v4 = p22
local r5 = p23 
local v5 = p24
local r6 = p25
local v6 = p26
local r7 = p27
local v7 = p28 
local r8 = p29
local v8 = p30
local qr = p31
local qa = p32
local qb = p33
--37 38 39 41 42 49
--44 45 46 48
function main()
	rst()
	gt(ta)
	repeat
		r2l()
		ev1()
		ev2()
		l2r()
		ev3()
		put = put+1
	until put == 6
	repeat
		ev4()
		colorid()
		if color == 67 then
			ev5()
			ev6(OFF,50)
			pt(ta)
			gt(tc)
			cutid()
			if cut == 64 then
				gc(ca)
				ev7(OFF,52)
				Delay(100)
				ev7(ON,55)
				pc(ca)
			else
				gc(cc)
				ev7(OFF,61)
				Delay(100)
				ev7(ON,55)
				pc(cc)
			end
			pt(tc)
			gt(tb)
			clean()
			pt(tb)
			gt(ta)
			ev6(ON,58)
			ev3()
			ev4()
			r2l()
			checkid()
			if check == 66 then
				ev8()
			end
		else
			r2l()
			metalid()
			if metal == 65 then
				ev8()
			end
		end
		evput()
		l2r()
		bput = bput+1
	until bput == 6
	pt(ta)
	MovP(hr)
	gos(4)
	Exit()
end

function rst()
	DO(GoP,OFF)
	DO(17,OFF)
	WDI(9,1)
	MotOn()
	hpos = getcart()
	if hpos.h == 0 then
		l2r()
	else
		gos(2)
		MovP(hr)
	end
end

function l2r()
	gos(1)
	MovP(hl)
	MovP(hr)
end

function r2l()
	gos(1)
	MovP(hr)
	MovP(hl)
end

function send(v)
	DO(GoP,v)
	print("Send ",v)
end

function wait(v)
	repeat
		print("wait ",v,"DI ",DI(GiP))
		Delay(300)
	until DI(GiP) == v
	print("Get ",DI(GiP))
end

function waitGT(v)
	repeat
		print("waitGT ",v,"DI ",DI(GiP))
		Delay(300)
	until DI(GiP) > v
	print("Get ",DI(GiP))
end

function gos(v)
	Delay(300)
	send(v)
	wait(v)
	Delay(300)
end

function path1(s,r,l,t,v,xo,yo,zo)
	gos(s)
	MovP(r)
	MovL(l+XYZC(xo,yo,zo,0))
	MovL(l+Z(zo))
	MovL(l)
	ts(t,v)
	MovL(l+Z(zo))
	MovL(l+XYZC(xo,yo,zo,0))
	MovP(r)
end

function path2(v,id)
	gos(3)
	MovP(r7)
	MovL(v7+Z(-85))
	MovL(v7)
	if v == OFF then
		ts("c",OFF)
		gos(id+1)
	elseif v == ON then
		gos(id+1)
		ts("c",ON)
	else
		Error()
	end
	MovL(v7+Z(-85))
	MovP(r7)
end

function ts(t,v)
	if t == "vac" then
		DO(0,v)
		WDI(0,v)
	elseif t == "qc" then
		Delay(800)
		DO(16,v)
	elseif t == "c" then
		Delay(800)
		DO(17,v)
	else
		Error()
	end
end

function pt(t)
	path1(3,tr,t,"qc",ON,0,0,80)
end

function gt(t)
	ts("qc",ON)
	path1(3,tr,t,"qc",OFF,0,0,80)
end

function pc(c)
	gos(3)
	MovP(cr)
	MovL(c+XYZC(-30,30,70,0))
	MovL(c+Z(70))
	ts("c",OFF)
	MovL(c)
	MovL(c+XYZC(-30,30,0,0))
	MovP(cr)
end

function gc(c)
	gos(3)
	MovP(cr)
	MovL(c+XYZC(-30,30,0,0))
	MovL(c)
	MovL(c+Z(70))
	ts("c",ON)
	MovL(c+XYZC(-30,30,70,0))
	MovP(cr)
end

function cutid()
	send(64)
	Delay(200)
	cut = DI(GiP)
	print ("cut ",cut)
end

function checkid()
	send(66)
	Delay(200)
	check = DI(GiP)
	print ("check ",check)
end

function colorid()
	send(67)
	Delay(200)
	color = DI(GiP)
	print ("color ",color)
end

function metalid()
	send(65)
	Delay(200)
	color = DI(GiP)
	print ("color ",color)
end

function ev1()
	gos(43)
	waitGT(43)
	flash = DI(GiP)
	if flash == 44 then
		path1(3,r8,v8,"vac",ON,0,0,40)
	elseif flash == 45 then
		path1(1,br,b1,"vac",ON,90,-60,28)
	elseif flash == 46 then
		path1(1,br,b2,"vac",ON,90,-60,28)
	elseif flash == 48 then
		path1(1,br,b3,"vac",ON,90,-60,28)
	else
		Error()
	end
	gos(47)
end	

function evput()
	gos(36)
	waitGT(36)
	flash = DI(GiP)
	if flash == 37 then
		path1(1,br,b1,"vac",OFF,90,-60,28)
	elseif flash == 38 then
		path1(1,br,b2,"vac",OFF,90,-60,28)
	elseif flash == 39 then
		path1(1,br,b3,"vac",OFF,90,-60,28)
	elseif flash == 41 then
		path1(1,br,b4,"vac",OFF,90,-60,28)
	elseif flash == 42 then
		path1(1,br,b5,"vac",OFF,90,-60,28)
	elseif flash == 49 then
		path1(1,br,b6,"vac",OFF,90,-60,28)
	else
		Error()
	end
	gos(40)
end	

function ev2()
	gos(19)
	path1(1,r2,v2,"vac",OFF,0,0,40)
	gos(20)
	gos(21)
	path1(1,r2,v2,"vac",ON,0,0,40)
	gos(22)
end

function ev3()
	gos(23)
	gos(2)
	MovP(hr)
	MovJ(J4,-245)
	MovJ(J2,130)
	MovJ(J1,30)
	path1(2,r3,v3,"vac",OFF,0,0,45)
	MovJ(J4,-300)
	MovJ(J2,130)
	MovJ(J1,-100)
	MovP(hr)
	gos(24)
end

function ev4()
	gos(25)
	path1(2,r4,v4,"vac",ON,0,0,45)
	gos(26)
end

function ev5()
	gos(27)
	path1(2,r5,v5,"vac",OFF,0,0,45)
	gos(28)
	gos(30)
	path1(2,r5,v5,"vac",ON,0,0,45)
	gos(31)
end

function ev6(v,id)
	gos(id)
	path1(3,r6,v6,"vac",v,0,0,45)
	gos(id+1)
end

function ev7(v,id)
	gos(id)
	path2(v,id)
	gos(id+2)
end

function ev8()
	gos(32)
	path1(3,r8,v8,"vac",OFF,0,0,40)
	gos(33)
	gos(34)
	path1(3,r8,v8,"vac",ON,0,0,40)
	gos(35)
end

function clean()
	gos(60)
	MovP(qr)
	MovL(qa+Z(50))
	MovL(qa)
	MovL(qb)
	MovL(qa)
	MovL(qb)
	MovL(qa)
	MovL(qa+Z(50))
	MovP(qr)
end
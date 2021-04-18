--this file is to check smart storage
local hpos
local flash = 0
local put = 0
local aput = 0
local bput = 0
local double = 0
local rf = 0
local fail = 0
local GoP = {1,2,3,4,5,6,7,8}
local GiP = {8,7,6,5,4,3,2,1}
local hr = p1
local hl = p2
local tr = p3
local ta = p4
local tb = p5
local tc = p6
local cr = p7
local ca = p8
local cb = p9
local cc = p10
local br = p11
local b1 = p12
local b2 = p13
local b3 = p14
local b4 = p15
local b5 = p16
local b6 = p17
local r2 = p18
local v2 = p19
local r3 = p20
local v3 = p21
local r4 = p22
local v4 = p23
local r5 = p24
local f5 = p25
local v5 = p26
local rc = p27
local v6 = p28
local v7 = p29
local r8 = p30
local v8 = p31
local qa = p32
local qb = p33
local sf = p34
--44 45 46 48 68 69
--37 38 39 41 42 49
function main()
	rst()
	gt(ta)
	r2l()
	sort()
	repeat
		r2l()
		ev1()
		l2r()
		ev3()
		put = put+1
	until put == 2
end

function rst()
	DO(GoP,OFF)
	WDI(9,1)
	DO(17,OFF)
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

function gos(v)
	DO(GoP,0)
	Delay(200)
	send(v)
	wait(v)
	Delay(200)
end

function send(v)
	DO(GoP,v)
	print("Send ",v)
end

function wait(v)
	repeat
		Delay(250)
		print("Wait ",v,"DI", DI(GiP))
	until DI(GiP) == v
	print("Get ",DI(GiP))
end

function waitGT(v)
	repeat
		Delay(250)
		print("WaitGT ",v,"DI", DI(GiP))
	until DI(GiP) > v
	print("Get ",DI(GiP))
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
	MovP(rc)
	MovL(v7+Z(-90))
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
	MovL(v7+Z(-90))
	MovP(rc)
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

function gt(t)
	ts("qc",ON)
	path1(3,tr,t,"qc",OFF,0,0,100)
end

function pt(t)
	path1(3,tr,t,"qc",ON,0,0,100)
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

function ev1()
	gos(43)
	waitGT(43)
	flash = DI(GiP)
	if flash == 44 then
		path1(1,br,b1,"vac",ON,90,-60,28)
	elseif flash == 45 then
		path1(1,br,b2,"vac",ON,90,-60,28)
	elseif flash == 46 then
		path1(1,br,b3,"vac",ON,90,-60,28)
	elseif flash == 48 then
		path1(1,br,b4,"vac",ON,90,-60,40)
	elseif flash == 68 then
		path1(1,br,b5,"vac",ON,90,-60,40)
	elseif flash == 69 then
		path1(1,br,b6,"vac",ON,90,-60,40)
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
		path1(1,br,b4,"vac",OFF,90,-60,40)
	elseif flash == 42 then
		path1(1,br,b5,"vac",OFF,90,-60,40)
	elseif flash == 49 then
		path1(1,br,b6,"vac",OFF,90,-60,40)
	else
		Error()
	end
	gos(40)
end

function ev2()
	gos(19)
	path1(1,r2,v2,"vac",OFF,0,0,40)
	gos(20)
end

function ev2g()
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
	path1(2,r3,v3,"vac",OFF,0,0,40)
	MovJ(J4,-300)
	MovJ(J2,130)
	MovJ(J1,-100)
	MovP(hr)
	gos(24)
end

function ev4()
	gos(25)
	path1(2,r4,v4,"vac",ON,0,0,40)
	gos(26)
end

function ev5()
	gos(27)
	path1(2,r5,f5,"vac",OFF,0,0,45)
	gos(28)
	gos(30)
	path1(2,r5,v5,"vac",ON,0,0,45)
	gos(31)
end

function ev6(v,id)
	gos(id)
	path1(3,rc,v6,"vac",v,0,0,60)
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
	MovP(rc)
	MovL(qa+Z(50))
	MovL(qa)
	MovL(qb)
	MovL(qa)
	MovL(qb)
	MovL(qa)
	MovL(qb)
	MovL(qa)
	MovL(qa+Z(50))
	MovP(rc)
end

function sput()--put block from rfid
	if rf == 10 then
		path1(1,br,b1,"vac",OFF,90,-60,28)
	elseif rf == 11 then
		path1(1,br,b2,"vac",OFF,90,-60,28)
	elseif rf == 12 then
		path1(1,br,b3,"vac",OFF,90,-60,28)
	elseif rf == 13 then
		path1(1,br,b4,"vac",OFF,90,-60,40)
	elseif rf == 14 then
		path1(1,br,b5,"vac",OFF,90,-60,40)
	elseif rf == 15 then
		path1(1,br,b6,"vac",OFF,90,-60,40)
	end
end

function scheck()--safety check
	gos(9)--get rf first
	waitGT(9)
	rf = DI(GiP)--check if rf and base is clear
	if DI(10)==0 and rf == 10 or DI(11)==0 and rf == 11 or DI(12)==0 and rf == 12 or DI(13)==0 and rf == 13 or DI(14)==0 and rf == 14 or DI(15)==0 and rf == 15 then
		fail = 2
	else
		fail = 1
	end
end

function unsput()--get block from base that should been moved
	if DI(10)==0 and rf ~= 10 then
		path1(1,br,b1,"vac",OFF,90,-60,28)
	elseif DI(11)==0 and rf ~= 11 then
		path1(1,br,b2,"vac",OFF,90,-60,28)
	elseif DI(12)==0 and rf ~= 12 then
		path1(1,br,b3,"vac",OFF,90,-60,28)
	elseif DI(13)==0 and rf ~= 13 then
		path1(1,br,b4,"vac",OFF,90,-60,40)
	elseif DI(14)==0 and rf ~= 14 then
		path1(1,br,b5,"vac",OFF,90,-60,40)
	elseif DI(15)==0 and rf ~= 15 then
		path1(1,br,b6,"vac",OFF,90,-60,40)
	else
		Error()
	end
	fail = 2
end

function sort()
	repeat
		ev1()
		ev2()
		scheck()
		if fail == 1 then
			ev1()
			unsput()
		end
		if fail == 2 then
			ev2g()
			sput()
			aput = aput+1
			fail = 0
		end
	until aput == 5
end

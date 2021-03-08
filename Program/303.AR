--2021/3/08
local herepos
local put
local bput
local cput
local dput
local eput
local flash
local check 
local cut
local GoP={1,2,3,4,5,6,7,8}
local GiP={8,7,6,5,4,3,2,1}
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

function main()
	rst()
	gtool(ta)
	repeat --collect
		r2l()
		ev1()
		l2r()
		ev3()
		put = put+1
	until put == 6
	repeat --sort
		ev4()
		ev5()
		r2l()
		evput()
		l2r()
		bput = bput+1
	until bput == 6
	repeat --metalcollect
		r2l()
		ev1()
		ev2()
		l2r()
		ev3()
		cput = cput +1
	until cput == 3
	repeat --metal cnc
		ev4()
		MovP(hr)
		ev6(OFF,50)
		ptool(ta)
		gtool(tc)
		cutid()
		if cut == 64 then
			gcut(ca)
			ev7(OFF,52)
			Delay(100)
			ev7(ON,55)
			pcut(ca)
		else
			gcut(cc)
			ev7(OFF,61)
			Delay(100)
			ev7(ON,55)
			pcut(cc)
		end
		ptool(tc)
		gtool(tb)
		clean()
		ptool(tb)
		gtool(ta)
		ev6(ON,58)
		ev3()
		ev4()
		checkid()
		r2l()
		if check == 65 then
			ev8()
		end
		evput()
		dput = dput+1
	until dput == 3
	l2r()
	ptool(ta)
	gos(4)
	Exit()
end

function rst()
	put = 0 
	bput = 0
	cput = 0
	dput = 0	
	check = 0 
	cut = 0
	flash = 0
	WDI(9,1)
	DO(17,OFF)
	MotOn()
	herepos = getcart()
	if herepos.h == 0 then
		l2r()
	else
		gos(2)
		MovP(hr)
	end
end
		
function send(v)
	DO(GoP,v)
	print("Send ",v)
end

function wait(v)
	repeat
		print("Wait = ",v,",GI=",DI(GiP))
		Delay(150)
	until DI(GiP) == v
end

function waitGT(v)
	repeat
		print("Wait > ",v,",GI=",DI(GiP))
		Delay(150)
	until DI(GiP) > v
end

function gos(v)
	Delay(200)
	send(v)
	wait(v)
	Delay(200)
	DO(GoP,OFF)
end

function ts(t,v)
	if t == "vac" then
		DO(0,v)
		WDI(0,v)
	elseif t == "QC" then
		DO(16,v)
		Delay(500)
	elseif t == "C" then
		DO(17,v)
		Delay(500)
	else
		Error("Wrong tool =",t)
	end
end

function path1(spos,rp,loc,t,v,xo,yo,zo)
	gos(spos)
	MovP(rp)
	MovL(loc+XYZC(xo,yo,zo,0))
	MovL(loc+Z(zo))
	MovL(loc)
	ts(t,v)
	MovL(loc+Z(zo))
	MovL(loc+XYZC(xo,yo,zo,0))
	MovP(rp)
end
function path2(v,id)
	gos(3)
	MovP(r7)
	MovL(v7+Z(-90))
	MovL(v7)
	if v == OFF then
		ts("C",v)
		gos(id+1)
	elseif v == ON then
		gos(id+1)
		ts("C",v)
	else
		Error("Wrong valu v=",v)
	end
	MovL(v7+Z(-90))
	MovP(r7)
end

function gtool(t)
	ts("QC",ON)
	path1(3,tr,t,"QC",OFF,0,0,100)
end

function ptool(t)
	path1(3,tr,t,"QC",ON,0,0,100)
end

function gcut(t)
	gos(3)
	MovP(cr)
	MovL(t+XYZC(-30,30,0,0))
	MovL(t)
	MovL(t+Z(70))
	ts("C",ON)
	MovL(t+XYZC(-30,30,70,0))
	MovP(cr)
end

function pcut(t)
	gos(3)
	MovP(cr)
	MovL(t+XYZC(-30,30,70,0))
	MovL(t+Z(70))
	ts("C",OFF)
	MovL(t)
	MovL(t+XYZC(-30,30,0,0))
	MovP(cr)
end

function r2l()
	gos(1)
	MovP(hr)
	MovP(hl)
end

function l2r()
	gos(1)
	MovP(hl)
	MovP(hr)
end

function cutid()
	Delay(200)
	send(64)
	cut = DI(GiP)
	print("cut =",cut)
end

function checkid()
	Delay(200)
	send(65)
	check = DI(GiP)
	print("check =",check)
end

function ev1()
	gos(43)
	waitGT(43)
	flash = DI(GiP)
	if flash == 44 then
		path1(3,r8,v8,"vac",ON,0,0,45)
	elseif flash == 45 then
		path1(1,br,b4,"vac",ON,90,-60,28)
	elseif flash == 46 then
		path1(1,br,b5,"vac",ON,90,-60,28)
	elseif flash == 48 then
		path1(1,br,b6,"vac",ON,90,-60,28)
	else
		Error("Wrong flash,flash =",flash)
	end
	gos(47)
end

function evput()
	gos(36)
	waitGT(36)
	flash = DI(GiP)
	if flash == 37 then
		path1(3,r8,v8,"vac",OFF,0,0,45)
	elseif flash == 38 then
		path1(1,br,b4,"vac",OFF,90,-60,28)
	elseif flash == 39 then
		path1(1,br,b5,"vac",OFF,90,-60,28)
	elseif flash == 41 then
		path1(1,br,b6,"vac",OFF,90,-60,28)
	elseif flash == 42 then
		path1(1,br,b1,"vac",OFF,90,-60,35)
	elseif flash == 66 then
		path1(1,br,b2,"vac",OFF,90,-60,35)
	elseif flash == 68 then
		path1(1,br,b3,"vac",OFF,90,-60,35)
	else
		Error("Wrong flash,flash =",flash)
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
	path1(2,r3,v3,"vac",OFF,0,0,35)
	MovJ(J4,-300)
	MovJ(J2,130)
	MovJ(J1,-100)
	gos(24)
end

function ev4()
	gos(25)
	path1(2,r4,v4,"vac",ON,0,0,40)
	gos(26)
end

function ev5()
	gos(27)
	path1(2,r5,v5,"vac",OFF,0,0,40)
	gos(28)
	gos(30)
	path1(2,r5,v5,"vac",ON,0,0,40)
	gos(31)
end

function ev6(v,id)
	gos(id)
	path1(3,r6,v6,"vac",v,0,0,40)
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
	MovL(qa+Z(50))
	MovP(qr)
end
	
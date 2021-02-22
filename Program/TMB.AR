local block = 6 --DO NOT USE ON MATCH
local put
local bput
local tool
local check
local flash
local herepos
local GiP = {8,7,6,5,4,3,2,1}
local GoP = {1,2,3,4,5,6,7,8}
local hr = p1
local hl = p2
local b1r = p3
local b2r = p4
local b1 = p5
local b2 = p6
local b3 = p7
local b4 = p8
local b5 = p9
local b6 = p10
local tr = p11
local ta = p12
local tb = p13
local tc = p14
local cr = p15
local ca = p16
local cc = p17
local v2r= p18
local v2 = p19
local v3r = p20
local v3 = p21
local v4r = p22
local v4 = p23
local v5r = p24
local v5 = p25 
local v6r = p26
local v6 = p27
local v7r = p28
local v7 = p29
local v8r = p30
local v8 = p31
local qr = p32
local qa = p33
local qb = p34

function main()
	reset()
	gettool(ta)
	repeat
	    r2l()
		ev1()
		ev2()
		l2r()
		ev6(OFF,50)
		puttool(ta)
		gettool(tc)
		toolid()
		if tool == 61 then
  			getcut(ca)
  			ev7(OFF,62)
			Delay(200)
			ev7(ON,55)
			putcut(ca)
		else
 	    	getcut(cc)
 	   		ev7(OFF,52)
			Delay(200)
   			ev7(ON,55)
			putcut(cc)
		end
		puttool(tc)
		gettool(tb)	
		clear()
		puttool(tb)
		gettool(ta)
		ev6(ON,58)
		ev3()
--Debug print("putin ",put,"block")
		until put == block
		repeat
			ev4()
			ev5()
			r2l()
			if check == 65 then
				ev8()
			end
			evput()
--Debug 	print("putback ",bput,"block")
			MovP(hl)
	 		l2r()
		until bput == block
	puttool(ta)
end

function reset()
    put = 0
	bput = 0
	flash = 0
	tool = 0 
	check = 0
    WDI(9,ON)
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

function gos(valu)
    Delay(300)
	Send(valu)
	Wait(valu)
	Delay(300)
end

function Send(valu)
    Delay(50)
    DO(GoP,valu)
    print("Send ",valu)
end

function Wait(valu)
    repeat
	    print("WaitGI = ",valu,"GI=",DI(GiP))
        Delay(200)
	until DI(GiP) == valu
	    print("Get = ",DI(GiP))
end

function WaitGT(valu)
    repeat
	    print("WaitGI > ",valu,"GI=",DI(GiP))
        Delay(200)
	until DI(GiP) > valu
	    print("Get = ",DI(GiP))
end

function path1(Spos,Rpos,loc,tool,valu,xo,yo,zo)
    gos(Spos)
	MovP(Rpos)
	MovL(loc+XYZC(xo,yo,zo,0))
	MovL(loc+Z(zo))
	MovL(loc)
	ts(tool,valu)
    MovL(loc+Z(zo))
    MovL(loc+XYZC(xo,yo,zo,0))
	MovP(Rpos)
end

function path2(valu)
    gos(3)
	MovP(v7r)
	MovL(v7+Z(-85))
	MovL(v7)
	if valu == OFF then
	    ts("cp",valu)
		gos(53)
    elseif valu == ON then
		gos(56)
		ts("cp",valu)
	else
	    Error("Wrong value,valu=",valu)
	end
    MovL(v7+Z(-85))
	MovP(v7r)
end

function ts(tool,valu)
    if tool == "vac" then
	    DO(0,valu)
		WDI(0,valu)
	elseif tool == "sw" then
		Delay(250)
		DO(16,valu)
	elseif tool == "cp" then
	    Delay(250)
		DO(17,valu)
	else 
	    Error("Wrong value,tool=",tool)
    end	
end

function puttool(loc)
	path1(3,tr,loc,"sw",ON,0,0,100)
end

function gettool(loc)
    ts("sw",ON)
	path1(3,tr,loc,"sw",OFF,0,0,100)
end

function toolid()
    Send(61)
	Delay(100)
	tool = DI(GiP)
	print("Toolid = ",tool)
end

function checkid()
    Send(65)
	Delay(100)
	check = DI(GiP)
	print("Checkid=",check)
end

function getcut(loc)
   	gos(3)
	MovP(cr)
	MovL(loc+XYZC(-30,30,0,0))
	MovL(loc)
	MovL(loc+Z(71))
	ts("cp",ON)
	MovL(loc+XYZC(-37,37,71,0))
	MovP(cr)
end

function putcut(loc)
   	gos(3)
	MovP(cr)
	MovL(loc+XYZC(-30,30,71,0))
	MovL(loc+Z(71))
	ts("cp",OFF)
	MovL(loc)
	MovL(loc+XYZC(-30,30,0,0))
	MovP(cr)
end

function ev1()
    gos(43)
	WaitGT(43)
	flash = DI(GiP)
	if flash == 44 then
		path1(2,v8r,v8,"vac",ON,0,0,50) 
	elseif flash == 45 then
		path1(1,b1r,b1,"vac",ON,0,0,28)
	elseif flash == 46 then
		path1(1,b1r,b2,"vac",ON,0,0,28)
	elseif flash == 48 then
		path1(1,b1r,b3,"vac",ON,0,0,28)
    else
		Error("Wrong value,Flash=",flash)
	end
	gos(47)
end

function evput()
    gos(36)
	WaitGT(36)
	flash = DI(GiP)
		if flash == 37 then
			path1(1,b2r,b4,"vac",OFF,0,0,28)
		elseif flash == 38 then
			path1(1,b2r,b5,"vac",OFF,0,0,28)
		elseif flash == 39 then
			path1(1,b2r,b6,"vac",OFF,0,0,28)
		elseif flash == 41 then
			path1(1,b1r,b3,"vac",OFF,0,0,28)
		elseif flash == 66 then
			path1(1,b1r,b2,"vac",OFF,0,0,28)
		elseif flash == 67 then
			path1(1,b1r,b1,"vac",OFF,0,0,28)
		else
			Error("Wrong value,Flash=",flash)
		end
	gos(40)
	bput = bput+1
end

function ev2()
    gos(19)
	path1(1,v2r,v2,"vac",OFF,0,0,30)
	gos(20)
	gos(21)
	path1(1,v2r,v2,"vac",ON,0,0,30)
end

function ev3()
    gos(23)
	gos(2)
	MovP(hr)
	MovJ(J4,-245)
	MovJ(J2,130)
	MovJ(J1,30)
	path1(2,v3r,v3,"vac",OFF,0,0,30)
	put = put+1
	gos(24)
	MovJ(J4,-300)
	MovJ(J2,130)
	MovJ(J1,-100)
end

function ev4()
    gos(25)
	path1(2,v4r,v4,"vac",ON,0,0,30)
	gos(26)
end

function ev5()
    gos(27)
	path1(2,v5r,v5,"vac",OFF,0,0,30)
	gos(28)
	gos(30)
	path1(2,v5r,v5,"vac",ON,0,0,30)
	gos(31)
	checkid()
end

function ev6(valu,id)
    gos(id)
    path1(3,v6r,v6,"vac",valu,0,0,30)
	gos(id+1)
end

function ev7(valu,id)
    gos(id)
	path2(valu)
	gos(id+2)
end

function ev8()
    gos(32)
	path1(2,v8r,v8,"vac",OFF,0,0,30)
	gos(33)
	gos(34)
	path1(2,v8r,v8,"vac",ON,0,0,30)
	gos(35)
end

function clear()
    gos(60)
	MovP(qr)
	MovL(qa+Z(40))
	MovL(qa)
	MovL(qb)
	MovL(qa)
	MovL(qb)
	MovL(qa)
	MovL(qa+Z(40))
	MovP(qr)
end
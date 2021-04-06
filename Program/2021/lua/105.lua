local flash
local put 
local herepos
local GoP={1,2,3,4,5,6,7,8}
local GiP={8,7,6,5,4,3,2,1} 
local hr = P1
local hl = P2
local b1r = P3
local b2r = P4
local b1 = P5
local b2 = P6
local b3 = P7
local b4 = P8
local b5 = P9
local b6 = P10
local tr = P11
local ta = P12
local tb = P13
local tc = P14
local ctr = P15
local ct1 = P16
local ct2 = P17
local ct3 = P18
local v2r= P19
local v2 = P20
local v3r = P21
local v3 = P22
local v4r = P23
local v4 = P24
local v5r = P25
local v5 = P26
local v6r = P27
local v6 = P28
local v7r = P29
local v7 = P30
local v8r = P31
local v8 = P32

function main ()
    reset()
	gettool(tr,ta)
	r2l()
	repeat
    	event1()
    	event2()
    	l2r()
	    event3()
    	event4()
	    event5()
	    r2l()
        event8()
	    eventput()
	until put == 3
	l2r()
	puttool(tr,ta)
	Exit("已完成")
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

function Send(valu)
    DO(GoP,valu)
    print("Send=",valu)
end

function Wait(need)
    repeat
	    Delay(50)
		print("Wait=",DI(GiP))
	until DI(GiP) == need
end

function WaitGT(port,need)
    repeat
	    Delay(50)
		print("Wait >",DI(valu))
	until DI(valu) > need
end

function gos(valu)
    Delay(250)
	Send(valu)
	Wait(valu)
    Delay(250)
end

function ts(tool,valu)
    if tool == "vac" then
	    DO(0,valu)
        WDI(0,valu)
	elseif tool == "CP" then
	    DO(17,valu)
		Delay(1000)
	elseif tool == "SW" then
	    DO(16,valu)
		Delay(1000)
	else
	    Error("Wrong Tool,Tool=",tool)
	end
end

function gettool(Rpos,loc)
    ts("QC",ON)
	path1(3,Rpos,loc,"SW",OFF,0,0,100)
end

function puttool(Rpos,loc)
    ts("QC",OFF)
	path1(3,Rpos,loc,"SW",ON,0,0,100)
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

function reset()
    put = 0
    flash = 0
	Send(0)
	DO(17,OFF)
	WDI(9,1)
	MotOn()
	herepos = getcart()
	if herepos.h == 0 then
	    l2r()
	else
	    gos(2)
		MovP(hr)
	end
end

function event1()
    gos(43)
	WaitGT(GiP,43)
	flash = DO(GiP)
	if flash == 44 then
	    path1(1,b1r,b1,"vac",ON,0,0,28)
	elseif flash == 45 then
	    path1(1,b1r,b2,"vac",ON,0,0,28)
	elseif flash == 46 then
	    path1(1,b1r,b3,"vac",ON,0,0,28)
	else 
	    Error("Wrong Flash,Flash=",flash)
	end
	gos(47)
	Delay(300)
end

function event2()
    gos(19)
	path1(1,v2r,v2,"vac",OFF,0,0,30)
	gos(20)
	gos(21)
	path1(1,v2r,v2,"vac",ON,0,0,30)
	gos(22)
end

function event3()
    gos(23)
	Delay(100)
	gos(2)
	MovJ(J4,-245)
	MovJ(J2,130)
	MovJ(J1,30)
	Delay(100)
	path1(2,v3r,v3,"vac",OFF,0,0,20)
	MovJ(J4,-300)
	MovJ(J2,130)
	MovJ(J1,-100)
	gos(24)
end

function event4()
    gos(25)
	path1(2,v4r,v4,"vac",ON,0,0,30)
	gos(26)
end

function event5()
    gos(27)
	path1(2,v5r,v5,"vac",OFF,0,0,35)
	gos(28)
	gos(30)
    path1(2,v5r,v5,"vac",ON,0,0,35)
	gos(31)
end

function event8()
    gos(32)
	path1(2,v8r,v8,"vac",OFF,0,0,30)
	gos(33)
	gos(34)
	path1(2,v8r,v8,"vac",ON,0,0,30)
	gos(35)
end

function event9()
    gos(36)
	WaitGT(GiP,36)
	flash = DO(GiP)
	if flash == 37 then
	    path1(1,b2r,b4,"vac",OFF,0,0,28)
	elseif flash == 38 then
	    path1(1,b2r,b5,"vac",OFF,0,0,28)
	elseif flash == 39 then
	    path1(1,b2r,b6,"vac",OFF,0,0,28)
	else 
	    Error("Wrong Flash,Flash=",flash)
	end
	gos(40)
	put = put+1
	Delay(300)
	MovP(hl)
end

local flash
local herepos
local put
local Gip = {8,7,6,5,4,3,2,1}
local Gop = {1,2,3,4,5,6,7,8}
local hr = p1
local hl = p2
local tr = p3
local ta = p4
local tb = p5
local tc = p6
local r2 = p7
local ep2 = p8
local r3 = p9
local ep3 = p10
local r4 = p11
local ep4 = p12
local r5 = p13
local ep5 = p14
local r6 = p15
local ep6 = p16
local r8 = p17
local ep8 = p18
local br1 = p19
local br2 = p20
local b1 = p21
local b2 = p22
local b3 = p23
local b4 = p24
local b5 = p25
local b6 = p26

function main()
    reset()
	gettp(tr,ta)
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
end

function reset()
    flash = 0
	put = 0
	sg(Gop,0)
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
	sg(Gop,valu)
	wg(Gip,valu)
	Delay(300)
end

function sg(valu1,valu2)
    Delay(300)
	DO(valu1,valu2)
	print("Setgo=",valu2)
end

function wg(valu1,valu2)
    repeat
        Delay(300)
     	print("waitgi=", DI(valu1))
	until
	     DI(valu1) == valu2
end

function wggt(valu1,valu2)
    repeat
        Delay(300)
     	print("waitgo>", DI(valu1))
	until
	     DI(valu1) > valu2
end

function gettp(Rpos,loc)
    ts("QC",ON)
	path1(3,Rpos,loc,"QC",OFF,0,0,130)
end

function puttp(Rpos,loc)
    ts("QC",OFF)
	path1(3,Rpos,loc,"QC",ON,0,0,130)
end

function ts (tool,valu)
    if tool == "vac" then
	    DO(0,valu)
		WDI(0,valu)
	elseif tool == "QC" then
	    DO(16,valu)
		Delay(1000)
	elseif tool == "CP" then
	    DO(17,valu)
		Delay(1000)
	else
	    Error("Wrong Tool,Tool=",tool)
	end
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

function event1()
    gos(43)
	wggt(Gip,43)
	flash = DI(Gip)
	if flash == 44 then
	    path1(1,br1,b1,"vac",ON,0,0,28)
	elseif flash == 45 then
	    path1(1,br1,b2,"vac",ON,0,0,28)
    elseif flash == 46 then
	    path1(1,br1,b3,"vac",ON,0,0,28)
	else
	    Error("Wrong get Flash,Flash=",flash)
	end
	gos(47)
	Delay(300)
end
	
function event2()
    gos(19)
	path1(1,r2,ep2,"vac",OFF,0,0,30)
	gos(20)
	gos(21)
	path1(1,r2,ep2,"vac",ON,0,0,30)
	gos(22)
end

function event3()
    gos(23)
	gos(2)
	MovJ(J4,-245)
	MovJ(J2,130)
	MovJ(J1,30)
	path1(2,r3,ep3,"vac",OFF,0,0,30)
	gos(24)
	MovJ(J4,-300)
	MovJ(J2,130)
	MovJ(J1,-100)
end

function event4()
    gos(25)
	path1(2,r4,ep4,"vac",ON,0,0,50)
	gos(26)
end

function event5()
    gos(27)
	path1(2,r5,ep5,"vac",OFF,0,0,50)
	gos(28)
	gos(30)
    path1(2,r5,ep5,"vac",ON,0,0,50)
	gos(31)
end

function event8()
    gos(32)
	path1(2,r8,ep8,"vac",OFF,0,0,50)
	gos(33)
	gos(34)
	path1(2,r8,ep8,"vac",ON,0,0,50)
	gos(35)
end

function eventput()
    gos(36)
	wggt(Gip,36)
	flash = Ginp(Gip)
	if flash == 37 then
	    path1(1,br2,b4,"vac",OFF,0,0,28)
	elseif flash == 38 then
	    path1(1,br2,b5,"vac",OFF,0,0,28)
    elseif flash == 39 then
	    path1(1,br2,b6,"vac",OFF,0,0,28)
	else
	    Error("Wrong put Flash,Flash=",flash)
	end
	gos(40)
	Delay(300)
	put = put+1
	MovP(hl)
end
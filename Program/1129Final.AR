local flash
local herepos
--local h
--local a
--local b
--local lab
local GoP = {1,2,3,4,5,6,7,8}
local Gip = {8,7,6,5,4,3,2,1}
local hr = p1
local hl = p2
local tpr = p3
local tpa = p4
local tpb = p5
local tpc = p6
local ev2R = p7
local ev2 = p8
local ev3R = p9
local ev3 = p10
local ev4R = p11
local ev4 = p12
local ev5R = p13
local ev5 = p14
local ev6R = p15
local ev6 = p16
local ev8R = p17
local ev8 = p18


function reset()
    flash = 0
    sg(GoP,0)
	DO(17,OFF)
	MotOn()
   	herepos = getcart()
	if herepos.h == 0 then
	    l2r()
	else
	    gs(2)
	    MovP(hr)
    end
end

function r2l()--right to left
    gs(1)
    MovP(hr)
	MovP(hl)
end

function l2r()--left to right
    gs(1)
    MovP(hl)
	MovP(hr)
end

function gs(valu)--go_setting
    Delay(300)
	sg(GoP,valu)
	wg(Gip,valu)
	Delay(300)
end

function sg(valu1,valu2)--setgo
    Delay(300)
	DO(valu1,valu2)
	print("setgo=",valu2)
end

function wg(valu1,valu2)--waitgi
    repeat
        Delay(300)
	    print("waitgi=",DI(valu1))
	until
	    DI(valu1) == valu2
end

function wgg(valu1,valu2)--waitgi_gt
    repeat
        Delay(300)
	    print("waitgi>",DI(valu1))
	until
	    DI(valu1) > valu2
end

function ts(tool,valu) --toolsetting
    if tool == "vac" then
	    DO(0,valu)
		WDI(0,valu)
	elseif tool == "CP" then
	    DO(17,valu)
		Delay(1000)
    elseif tool == "QC" then
	    DO(16,valu)
		Delay(1000)
	else 
	    Error("Wrong ToolSetting")
	end
end

function gettp(Rpos,loc) --gettoolpath
    ts("QC",ON)
	Apath1(3,Rpos,loc,"QC",OFF,0,0,130)
end

function puttp(Rpos,loc) --puttoolpath
   ts("QC",OFF)
   Apath1(3,Rpos,loc,"QC",ON,0,0,130)
end

function getcp(Rpos,loc) --getcutterpath
    gs(3)
	MovP(Rpos)
	MovL(loc+XZYC(-30,30,0,0))
	MovL(loc)
	MovL(loc+Z(71))
	ts("CP",ON)
	MovL(loc+XZYC(-37,37,71,0))
	MovL(Rpos)
end

function putcp(Rpos,loc)--putcutterpath
   gs(3)
   MovP(Rpos)
   MovL(loc+XYZC(-30,30,71,0))
   MovL(loc)
   MovL(loc+Z(71))
   ts("CP",OFF)
   MovL(loc)
   MovL(loc+XYZC(-30,30,0,0))
   MovP(Rpos)
end

function Apath1(Spos,Rpos,loc,tool,valu,xo,yo,zo) --p_area_path_1
    gs(Spos)
	MovP(Rpos)
	MovL(loc+XYZC(xo,yo,zo,0))
	MovL(loc+Z(zo))
	MovL(loc)
	ts(tool,valu)
	MovL(loc+Z(zo))
	MovL(loc+XYZC(xo,yo,zo,0))
	MovP(Rpos)
end

function Apath2 (Spos,Rpos,loc,valu,id) --p_area_path_2
    gs(Spos)
	MovP(Rpos)
	MovL(loc+Z(-90))
	MovL(loc)
	if valu == "ON" then
	    gs(id)
	    ts("CP",valu)
    elseif valu == "OFF" then
		ts("CP",valu)
		gs(id)
	else
	    Error("Wrong Path Value")
	end
    MovL(loc+Z(-90))
	MovP(Rpos)
end

function main()
    reset()
	gettp(tpr,tpa)
	r2l()
	event2()
	l2r()
	event3()
    event4()
    event5()
--	event5_1()
	
--	if h == 65 then
 	    r2l()
	    event8()
--	else
--	    goto lab
--end
end

function event2()
    --gs(19)
	Apath1(1,ev2R,ev2,"vac",OFF,0,0,50)
	--gs(20)
	--gs(21)
	Apath1(1,ev2R,ev2,"vac",ON,0,0,50)
	--gs(22)
end

function event3 ()
    gs(23)
	gs(2)
	MovJ (J4,-245)
    MovJ (J2,130)
    MovJ (J1,30)
	Apath1(2,ev3R,ev3,"vac",OFF,0,0,25)
	gs(24)
	MovJ (J4,-300)
	MovJ (J2,130)
	MovJ (J1,-100)
	
end

function event4()
    gs(25)
	Apath1(2,ev4R,ev4,"vac",ON,0,0,50)
	gs(26)
end

function event5()
    gs(27)
	Apath1(2,ev5R,ev5,"vac",OFF,0,0,50)
	gs(28)
	gs(30)
	Apath1(2,ev5R,ev5,"vac",ON,0,0,50)
	gs(31)
end

--[[
function event5_1()
    sg(GoP,65)
	Delay(2000)
	h = (Gip)
	print("h=",h)
end
--]]

function event6(valu,id)
    gs(id)
	Apath1(3,ev6R,ev6,"vac",valu,0,0,80)
	gs(id+1)
end

function event8()
    gs(32)
	Apath1(2,ev8R,ev8,"vac",OFF,0,0,50)
	gs(33)
	gs(34)
	Apath1(2,ev8R,ev8,"vac",ON,0,0,50)
	gs(35)
end

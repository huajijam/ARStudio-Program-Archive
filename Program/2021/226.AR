local herepos
local flash
local put
local bput
local mput
local check
local tool
local Metal
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
    reset()
    gettool(ta)
    repeat
        r2l()
        ev1()
        ev2()
        l2r()
        ev3()
        put=put+1
    until put==6
    repeat--pss2
        ev4()
        Metalid()
        if Metal == 68 then--metal
            r2l()
            evput()
            mput=mput+1
            bput=bput+1
        else
            ev5()
            ev6(OFF,50)
            puttool(ta)
            gettool(tc)
            toolid()
            if tool == 64 then
                getcut(ca)
                ev7(OFF,61)
                Delay(100)
                ev7(ON,55)
                putcut(ca)
            else
                getcut(cc)
                ev7(OFF,52)
                Delay(100)
                ev7(ON,55)
                putcut(cc)
            end
            puttool(tc)
            gettool(tb)
            clean()
            puttool(tb)
            gettool(ta)
            ev6(ON,58)
            ev3()
            ev4()
            r2l()
            checkid()
            if check == 65 then
                ev8()
            end
            evput()
            bput=bput+1
        end
        l2r()
    until bput == 6
	r2l()
    repeat
        ev1()--get Metal
		l2r()
        ev6(OFF,50)
        puttool(ta)
        gettool(tc)
        toolid()
        if tool == 64 then
            getcut(ca)
            ev7(OFF,61)
            Delay(100)
            ev7(ON,55)
            putcut(ca)
        else
            getcut(cc)
            ev7(OFF,52)
            Delay(100)
            ev7(ON,55)
            putcut(cc)
        end
        puttool(tc)
        gettool(tb)
        clean()
        puttool(tb)
        gettool(ta)
        ev6(ON,58)
        ev3()
        ev4()
        ev5()
        r2l()
        checkid()
        if check == 65 then
            ev8()
        end
        evput()
        mput=mput-1
    until mput==0
	l2r()
    puttool(ta)
    gos(4)
end

function reset()
    put = 0
    bput = 0
	mput = 0
    check = 0
    flash = 0
    tool = 0
    Metal = 0
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

function Send(valu)
    DO(GoP,valu)
    Delay(250)
    print("Send = ",valu)
end

function wait(valu)
    repeat
        Delay(200)
        print("Wait = ",valu,"GI=",DI(GiP))
    until DI(GiP)== valu
end

function waitGT(valu)
    repeat
        Delay(200)
        print("Wait > ",valu,"GI=",DI(GiP))
    until DI(GiP)>valu
end

function gos(valu)
    Delay(200)
    Send(valu)
    wait(valu)
    Delay(200)
end

function puttool(tool)
    path1(3,tr,tool,"QC",ON,0,0,100)
end

function gettool(tool)
	ts("QC",ON)
    path1(3,tr,tool,"QC",OFF,0,0,100)
end

function getcut(tool)
    gos(3)
    MovP(cr)
    MovL(tool+XYZC(-30,30,0,0))
    MovL(tool)
    MovL(tool+Z(70))
    ts("CP",ON)
    MovL(tool+XYZC(-30,30,70,0))
    MovP(cr)
end

function putcut(tool)
    gos(3)
    MovP(cr)
    MovL(tool+XYZC(-30,30,70,0))
    MovL(tool+Z(70))
    ts("CP",OFF)
    MovL(tool)
    MovL(tool+XYZC(-30,30,0,0))
    MovP(cr)
end

function ts(tool,valu)
    if tool == "vac" then
        DO(0,valu)
        WDI(0,valu)
    elseif tool == "QC" then
        DO(16,valu)
		Delay(500)
    elseif tool == "CP" then
        DO(17,valu)
		Delay(500)
    else
        Error("Wrong value,tool=",tool)
    end
end

function path1(spos,rpos,loc,tool,valu,xo,yo,zo)
    gos(spos)
    MovP(rpos)
    MovL(loc+XYZC(xo,yo,zo,0))
    MovL(loc+Z(zo))
    MovL(loc)
    ts(tool,valu)
    MovL(loc+Z(zo))
    MovL(loc+XYZC(xo,yo,zo,0))
    MovP(rpos)
end

function path2(valu,id)
    gos(3)
    MovP(r7)
    MovL(v7+Z(-90))
    MovL(v7)
    if valu == OFF then
        ts("CP",valu)
        gos(id+1)
    elseif valu == ON then
        gos(id+1)
        ts("CP",valu)
    else
        Error("Wrong value,valu=",valu)
    end
    MovL(v7+Z(-90))
    MovP(r7)
end

function checkid()
    Delay(200)
    Send(65)
    check = DI(GiP)
    print("check=",DI(GiP))
end

function toolid()
    Delay(200)
    Send(64)
    tool = DI(GiP)
    print("tool=",DI(GiP))
end

function Metalid()
    Delay(200)
    Send(68)
    Metal = DI(GiP)
    print("Metal=",DI(GiP))
end

function ev1()
    gos(43)
    waitGT(43)
    flash = DI(GiP)
    if flash == 44 then
        path1(2,r8,v8,"vac",ON,0,0,30)
    elseif flash == 45 then
        path1(1,br,b4,"vac",ON,90,-60,28)
    elseif flash == 46 then
        path1(1,br,b5,"vac",ON,90,-60,28)
    elseif flash == 48 then
        path1(1,br,b1,"vac",ON,90,-60,35)
    elseif flash == 49 then
        path1(1,br,b2,"vac",ON,90,-60,35)
	elseif flash == 66 then
        path1(1,br,b6,"vac",ON,90,-60,28)
    else
        Error("Wrong value,flash =",flash)
    end
    gos(47)
end

function evput()
    gos(36)
    waitGT(36)
    flash = DI(GiP)
    if flash == 37 then
        path1(1,br,b1,"vac",OFF,90,-60,35)
    elseif flash == 38 then
        path1(1,br,b2,"vac",OFF,90,-60,35)
    elseif flash == 39 then
        path1(1,br,b3,"vac",OFF,90,-60,35)
    elseif flash == 41 then
        path1(1,br,b4,"vac",OFF,90,-60,28)
    elseif flash == 42 then
        path1(1,br,b5,"vac",OFF,90,-60,28)
    elseif flash == 67 then
        path1(1,br,b6,"vac",OFF,90,-60,28)
    else
        Error("Wrong value,flash =",flash)
    end
    gos(40)
end

function ev2()
    gos(19)
    path1(1,r2,v2,"vac",OFF,0,0,30)
    gos(20)
    gos(21)
    path1(1,r2,v2,"vac",ON,0,0,30)
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
    gos(24)
    MovJ(J4,-300)
    MovJ(J2,130)
    MovJ(J1,-100)
end

function ev4()
    gos(25)
    path1(2,r4,v4,"vac",ON,0,0,30)
    gos(26)
end

function ev5()
    gos(27)
    path1(2,r5,v5,"vac",OFF,0,0,30)
    gos(28)
    gos(30)
    path1(2,r5,v5,"vac",ON,0,0,30)
    gos(31)
end

function ev6(valu,id)
    gos(id)
    path1(3,r6,v6,"vac",valu,0,0,30)
    gos(id+1)
end

function ev7(valu,id)
    gos(id)
    path2(valu,id)
    gos(id+2)
end

function ev8()
    gos(32)
    path1(2,r8,v8,"vac",OFF,0,0,30)
    gos(33)
    gos(34)
    path1(2,r8,v8,"vac",ON,0,0,30)
    gos(35)
end

function clean()
    gos(60)
    MovP(qr)
    MovL(qa+Z(40))
    MovL(qa)
    MovL(qb)
    MovL(qa)
    MovL(qa+Z(40))
    MovP(qr)
end

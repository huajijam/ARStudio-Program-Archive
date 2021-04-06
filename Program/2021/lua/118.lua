local herepos
local flash
local put
local bput
local checkid
local toolid
local GoP={1,2,3,4,5,6,7,8}
local GiP={8,7,6,5,4,3,2,1}

function reset()
    put = 0
    bput = 0
    checkid = 0
    flash = 0
    toolid = 0
    WDI(9,1)
    DO(17,OFF)
    MotOn()
    herepos = getcart()
    if herepos.h == 0 then
        gos(2)
        MovP(hr)
    else
        r2l()
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
    MovP(hl) 
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
    until DI(GiP)==valu
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
    path1(3,tr,tool,"QC",OFF,0,0,100)
end

function getcut(tool)
    gos(3)
    MovP(cr)
    MovL(tool+XYZC(30,-30,80,0))
    MovL(tool)
    MovL(tool+Z(80))
    ts("CP",ON)
    MovL(tool+XYZC(30,-30,0,0))
    MovP(rpos)
end

function putcut(tool)
    gos(3)
    MovP(cr)
    MovL(tool+XYZC(30,-30,80,0))
    MovL(tool+Z(80))
    ts("CP",ON)
    MovL(tool)    
    MovL(tool+XYZC(30,-30,0,0))
    MovP(rpos)
end

function ts(tool,valu)
    if tool == "vac" then
        DO(0,valu)
        WDI(0,valu)
    elseif tool == "QC" then
        Delay(1000)
        DO(16,vlau)
    elseif tool == "CP" then
        Delay(1000)
        DO(17,vlau)
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
    MovL(ev7+Z(-90))
    MovL(ev7)
    if valu == "OFF" then
        ts("CP",valu)
        gos(id+1)    
    elseif valu == "ON" then
        gos(id+1)
        ts("CP",valu)
    else 
        Error("Wrong value,id=",id)
    end
    MovL(ev7+Z(-90))
    MovP(r7)
end

function checkid()
    Delay(200)
    gos(32)
    checkid = DI(GiP)
    print("checkid=",DI(GiP))
end

function toolid()
    Delay(200)
    gos(56)
    toolid = DI(GiP)
    print("toolid=",DI(GiP))
end

function ev1()
    gos(46)
    waitGT(46)
    flash = DI(GiP)
    if flash == 47 then
        path1(2,r8,ev8,"vac",ON,0,0,30)
    elseif flash == 48 then
        path1(1,br1,b1,"vac",ON,0,0,28)
    elseif flash == 49 then
        path1(1,br1,b2,"vac",ON,0,0,28)
    elseif flash == 50 then
        path1(1,br1,b2,"vac",ON,0,0,28)
    else 
        Error("Wrong value,flash =",flash)
    end
    gos(51)
end    
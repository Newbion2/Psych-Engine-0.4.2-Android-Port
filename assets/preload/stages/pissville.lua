local gfspeed = 0;
local xx = 0;
local yy = 0;
local ofs = 80;
local fx = 0;
local fy = 0;
local camSpeed = 1;
local directory = 'pissville'
local songstarted = false;
local u = 2
local e = ''
local tx = 0
local ty = 0
function onCreate()


    
    if songName == 'cooked' then
        directory = 'hellbeats'
    elseif songName == 'Neobattle' then
        directory = 'neo'
    elseif songName == 'Flightless' then
        directory = 'corruption'
    elseif songName == 'Celebrations' then
        directory = 'bnb'
    elseif songName == 'Ascend' then
        e = 'Extended'
        tx = 900
        ty = 600
	elseif songName == 'Flock-Betadciu' then
        e = 'Extended'
        tx = 900
        ty = 600
    end


	-- background shit
	makeLuaSprite('stageback', directory .. '/PissvilleBack' .. e, -200-tx, -185-ty);
	
	makeLuaSprite('stagefront', directory .. '/PissvillePath', -200, -190);

    makeLuaSprite('bop', directory .. '/PissvilleBop', -200, -190);


    makeAnimatedLuaSprite('secondDad', 'bnb/bosip_assets', -140, 0);
    addAnimationByPrefix('secondDad','idle','Bosip idle dance',24,false)
    addAnimationByPrefix('secondDad','singDOWN','Bosip Sing Note DOWN',24,false)
    addAnimationByPrefix('secondDad','singLEFT','Bosip Sing Note LEFT',24,false)
    addAnimationByPrefix('secondDad','singRIGHT','Bosip Sing Note RIGHT',24,false)
    addAnimationByPrefix('secondDad','singUP','Bosip Sing Note UP',24,false)

	addLuaSprite('stageback', false);
	addLuaSprite('bop', false);
	addLuaSprite('stagefront', false);

    
    if songName == 'Celebrations' then
        addLuaSprite('secondDad', true);


        for i = 0, getProperty('unspawnNotes.length')-1 do
             setPropertyFromGroup('unspawnNotes', i, 'texture', 'bnb/bob'); --Change texture
            if  getPropertyFromGroup('unspawnNotes', i, 'mustPress') then 
                    setPropertyFromGroup('unspawnNotes', i, 'texture', ''); --Change texture
            end
            if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Second Dad Sing' then
                setPropertyFromGroup('unspawnNotes', i, 'texture', 'bnb/bosip'); --Change texture
            end
        end


    end
	makeGraphic('blacks',1280,720,'000000')
    objectPlayAnimation('secondDad','idle',true)
	addLuaSprite('blacks')

	

end


function onUpdate()






    if getProperty('dad.curCharacter') == 'mason-fly' then
    	fx= fx+0.02;
    	fy= fy+0.08;
    	xx = getProperty('dad.x')
    	yy = getProperty('dad.y')

    	setProperty('dad.y',yy+math.sin(fy)*2)
    	setProperty('dad.x',xx+math.cos(fx)*2)

    end
	if mustHitSection == false and getProperty('dad.curCharacter') == 'mason-fly' then
        if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
            triggerEvent('Camera Follow Pos',200+xx-ofs,100+yy)
        end
        if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
            triggerEvent('Camera Follow Pos',200+xx+ofs,100+yy)
        end
        if getProperty('dad.animation.curAnim.name') == 'singUP' then
            triggerEvent('Camera Follow Pos',200+xx,100+yy-ofs)
        end
        if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
            triggerEvent('Camera Follow Pos',200+xx,100+yy+ofs)
        end
        if getProperty('dad.animation.curAnim.name') == 'idle' then
            triggerEvent('Camera Follow Pos',200+xx,100+yy)
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end

end

function onBeatHit()



	gfspeed = getProperty('gfSpeed')
	setProperty('bop.y',-170)
	
	if curBeat % gfspeed == 0 and songstarted then
        triggerEvent('Add Camera Zoom',0.04*gfspeed,0.03*gfspeed)
		doTweenY('bounce','bop',-190,crochet/1000,'circOut')

        if mustHitSection then
            objectPlayAnimation('secondDad','idle',false)
        else
            if getProperty('secondDad.animation.curAnim.name') == 'idle' then
                objectPlayAnimation('secondDad','idle',false)
            end
        end


	end

end


function opponentNoteHit(id,noteData, noteType, isSustainNote)
songstarted = true

    if noteType == 'Both Dads Sing' or noteType == 'Second Dad Sing' then
        triggerEvent('dad2sing',noteData,'')

    end
end


function onEvent( name, value1,value2)
    if name == "dad2sing" then

        if value1 == '0' then
            objectPlayAnimation('secondDad','singLEFT',true)
                setProperty('secondDad.offset.x',11)
                setProperty('secondDad.offset.y',10)
                triggerEvent('Camera Follow Pos',xx3-ofs,yy3)
        end
        if value1 == '1' then
            objectPlayAnimation('secondDad','singDOWN',true)
                setProperty('secondDad.offset.x',-10)
                setProperty('secondDad.offset.y',-10)
                triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
        end
        if value1 == '2' then
            objectPlayAnimation('secondDad','singUP',true)
                setProperty('secondDad.offset.x',-16)
                setProperty('secondDad.offset.y',22)
                triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
        end
        if value1 == '3' then
            objectPlayAnimation('secondDad','singRIGHT',true)
                setProperty('secondDad.offset.x',-20)
                setProperty('secondDad.offset.y',-20)
                triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
        end
    end
end
           

function goodNoteHit(id,noteData, noteType, isSustainNote)
songstarted = true

end
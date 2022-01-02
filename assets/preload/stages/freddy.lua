local camSpeed = 4;
local camInt = 1;
function onCreate()
	-- background shit
	makeLuaSprite('stageback', 'freddy/MinusBack', -340, -200);
	makeLuaSprite('flash', '', 0, 0);
	makeLuaSprite('mm', 'freddy/MinusGeese-Phase2', 0, 0);--cache the other sprites so no lag
	addLuaSprite('mm', false);
	setLuaSpriteScrollFactor('stageback', 0.9, 0.9);

	makeGraphic('flash',1280,720,'ffffff')
	addLuaSprite('stageback', false);
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash',0,0)
	setProperty('flash.scale.x',1.2)
	setProperty('flash.scale.y',1.2)
	setProperty('flash.alpha',0)

	makeAnimatedLuaSprite('bop', 'freddy/GuardsBoppin', 200, 0);
	addAnimationByPrefix('bop','bopp','Guards-Boppin',24,false)
	setLuaSpriteScrollFactor('bop',0.9,0.9)
	objectPlayAnimation('bop','bopp',true)
	addLuaSprite('bop', false);


	
	--close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end


function  onUpdate()
	if mustHitSection then
		setProperty('defaultCamZoom',1.2)
	else
		setProperty('defaultCamZoom',0.9)

	end
end

function  onBeatHit()
	-- body
	objectPlayAnimation('bop','bopp',true)
end

function onStepHit()

	if curStep % camSpeed == 0 then
		triggerEvent('Add Camera Zoom',0.015*camInt,0.03*camInt)
	end

end

function onEvent(n,v1,v2)


	if n == 'Camera Zoom Speed' then
		camSpeed = v1
		camInt = v2
	end
	if n == 'Flashes Camera' then

		setProperty('flash.alpha',1)
		doTweenAlpha('flTw','flash',0,v1,'linear')
	end

end
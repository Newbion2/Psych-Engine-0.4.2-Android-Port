local camSpeed = 4;
local camInt = 1;
function onCreate()
	-- background shit
	makeAnimatedLuaSprite('bop', 'iamdead/iamdeadbop', -200, 150);
	addAnimationByPrefix('bop','bopp','DeadBop',24,false)
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
end

function onEvent(n,v1,v2)
end
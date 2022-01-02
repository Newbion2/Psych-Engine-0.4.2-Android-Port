function onCreate()
	-- background shit
	makeLuaSprite('stageback', 'geese1/stageback', -600, -300);
	setLuaSpriteScrollFactor('stageback', 0.9, 0.9);
	
	makeLuaSprite('stagefront', 'geese1/stagefront', -650, 500);
	setLuaSpriteScrollFactor('stagefront', 0.9, 0.9);
	scaleObject('stagefront', 1.1, 1.1);

    makeLuaSprite('stagecurtains', 'geese1/stagecurtains', -500, -300);
    setLuaSpriteScrollFactor('stagecurtains', 0.3, 0.3);
    scaleObject('stagecurtains', 0.9, 0.9);

	addLuaSprite('stageback', false);
	addLuaSprite('stagefront', false);
	addLuaSprite('stagecurtains', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end
local allowCountdown = false
function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
		setProperty('camGame.alpha',0)
		setProperty('camHUD.alpha',0)
		runTimer('wait',1,1);

		allowCountdown = true;
		return Function_Stop;
	end



		setProperty('camGame.alpha',1)
		setProperty('camHUD.alpha',1)

	return Function_Continue;

end


function onTimerCompleted(tag, loops, loopsLeft)

		startVideo('Cutscene2');


end
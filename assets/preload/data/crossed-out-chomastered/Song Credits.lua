function onCreate()
makeLuaSprite('CupheadCredits', 'cassette/cup/Crossed Outremix', -300, 430);
setObjectCamera('CupheadCredits', 'hud')
scaleObject('CupheadCredits',0.7,0.7)
addLuaSprite('CupheadCredits',false)
end
function onStepHit()
if curStep == 254 then
doTweenX('MoveInTwo', 'CupheadCredits', 0, 1, 'CircInOut')
runTimer('CupheadCreditsWait', 4)
end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'CupheadCreditsWait' then
		doTweenX('MoveOutTwo', 'CupheadCredits', -550, 1.5, 'CircInOut')
	end
end


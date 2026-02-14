local BattleMode = false
local BlasterTwo = false
local endingCheck = false
function onCreate()
makeLuaSprite('CupheadCredits', 'cassette/cup/Crossed Out', -300, 430);
setObjectCamera('CupheadCredits', 'hud')
scaleObject('CupheadCredits',0.7,0.7)
addLuaSprite('CupheadCredits',false)
makeAnimatedLuaSprite('GasterBlaster1','sans/Gaster_blasterss',-2500,400);
scaleObject('GasterBlaster1', 4.0, 4.0);
addAnimationByPrefix('GasterBlaster1','Blank','BlasterBlank',24,false)
addAnimationByPrefix('GasterBlaster1','Ready','BlasterCharge',24,false)
addAnimationByPrefix('GasterBlaster1','Fire','BlasterFire',24,false)
playAnim('GasterBlaster1','Blank',false)
makeAnimatedLuaSprite('GasterBlaster2','sans/Gaster_blasterss',-2500,400);
scaleObject('GasterBlaster2', 4.0, 4.0);
addAnimationByPrefix('GasterBlaster2','Blank','BlasterBlank',24,false)
addAnimationByPrefix('GasterBlaster2','Ready','BlasterCharge',24,false)
addAnimationByPrefix('GasterBlaster2','Fire','BlasterFire',24,false)
playAnim('GasterBlaster2','Blank',false)
setProperty('GasterBlaster2.flipX',true)
makeLuaSprite('HeartSans','sans/heart',990,850)
addLuaSprite('HeartSans',true)
setProperty('HeartSans.alpha', 0)
setProperty('HeartSans.velocity.x', 0)
setProperty('HeartSans.active', true)
addLuaSprite('GasterBlaster1',true)
addLuaSprite('GasterBlaster2',true)
end
function onKeyPress(key)
if BattleMode == true then
if key == 0 and getProperty('HeartSans.x') >220 then
setProperty('HeartSans.velocity.x', -500)
cancelTimer('leftreset')
end
if key == 1 and getProperty('HeartSans.y') <1110 then
setProperty('HeartSans.velocity.y', 500)
cancelTimer('downreset')
end
if key == 2 and getProperty('HeartSans.y') >440 then
setProperty('HeartSans.velocity.y', -500)
cancelTimer('upreset')
end
if key == 3 and getProperty('HeartSans.x') <1660 then
setProperty('HeartSans.velocity.x', 500)
cancelTimer('rightreset')
end
end
end
function onUpdate(elapsed)
if BattleMode == true and endingCheck == true then
BattleMode = false
end
if getProperty('HeartSans.x') <220 then
setProperty('HeartSans.x', 221)
setProperty('HeartSans.velocity.x', 0)
end
if getProperty('HeartSans.y') >1110 then
setProperty('HeartSans.y', 1109)
setProperty('HeartSans.velocity.y', 0)
end
if getProperty('HeartSans.y') <440 then
setProperty('HeartSans.y', 441)
setProperty('HeartSans.velocity.y', 0) 
end
if getProperty('HeartSans.x') >1660 then
setProperty('HeartSans.x', 1659)
setProperty('HeartSans.velocity.x', 0)
end
end
function onKeyRelease(key)
if BattleMode == true then
if key == 0 then
runTimer('leftreset',0.1)
end
if key == 1 then
runTimer('downreset',0.1)
end
if key == 2 then
runTimer('upreset',0.1)
end
if key == 3 then
runTimer('rightreset',0.1)
end
end
end
function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'CupheadCreditsWait' then
doTweenX('MoveOutTwo', 'CupheadCredits', -550, 1.5, 'CircInOut')
end
if tag == 'PreBlaster' then
if BattleMode == true then
playSound('sans/readygas')
runTimer('BlasterAttack',1.1)
if BlasterTwo == false then
playAnim('GasterBlaster1','Ready')
setProperty('GasterBlaster1.y',getProperty('HeartSans.y')- 170)
elseif BlasterTwo == true then
playAnim('GasterBlaster2','Ready')
setProperty('GasterBlaster2.y',getProperty('HeartSans.y')- 170)
end
end
elseif tag == 'BlasterAttack' then
cameraShake('camHud', 0.007, 0.6);
cameraShake('camGame', 0.004, 0.6);
playSound('sans/shootgas')
if BlasterTwo == false then
playAnim('GasterBlaster1','Fire')
if BattleMode == true then
if getProperty('HeartSans.y') > (getProperty('GasterBlaster1.y') + 10) and getProperty('HeartSans.y') < (getProperty('GasterBlaster1.y') - 10) + getProperty('GasterBlaster1.height')/2 then
if not botPlay then
runTimer('BlasterOwie',0.1)
characterPlayAnim('bf','singLEFTmiss',true)
setProperty('bf.specialAnim',true)
end
else
characterPlayAnim('bf','dodge',true)
setProperty('bf.specialAnim',true)
end
end
elseif BlasterTwo == true then
playAnim('GasterBlaster2','Fire')
if BattleMode == true then
if getProperty('HeartSans.y') > (getProperty('GasterBlaster2.y') + 10) and getProperty('HeartSans.y') < (getProperty('GasterBlaster2.y') - 10) + getProperty('GasterBlaster2.height')/2 then
if not botPlay then
runTimer('BlasterOwie',0.1)
characterPlayAnim('bf','singLEFTmiss',true)
setProperty('bf.specialAnim',true)
end
else
characterPlayAnim('bf','dodge',true)
setProperty('bf.specialAnim',true)
end
end
end
if BlasterTwo == true then
BlasterTwo = false
elseif BlasterTwo == false then
BlasterTwo = true
end
runTimer('PreBlaster',0.5)
end
if tag == 'leftreset' and getProperty('HeartSans.velocity.x') < 400 then
setProperty('HeartSans.velocity.x', 0)
elseif tag == 'rightreset' and getProperty('HeartSans.velocity.x') >400 then
setProperty('HeartSans.velocity.x', 0)
elseif tag == 'upreset' and getProperty('HeartSans.velocity.y') <400 then
setProperty('HeartSans.velocity.y', 0)
elseif tag == 'downreset' and getProperty('HeartSans.velocity.y') >400 then
setProperty('HeartSans.velocity.y', 0)
end
if tag == 'BlasterOwie' then
setProperty('health',getProperty('health') - 1)
end
end
function onStepHit()
if curStep == 254 then
doTweenX('MoveInTwo', 'CupheadCredits', 0, 1, 'CircInOut')
runTimer('CupheadCreditsWait', 4)
elseif curStep == 1282 or curStep == 1410 then
BattleMode = true
runTimer('PreBlaster',1.1)
doTweenAlpha("soulfadein","HeartSans",1,0.4)
doTweenAlpha("boyfriendsoulfadeout","boyfriendGroup",0.5,0.4)
triggerEvent('Camera Follow Pos',getProperty('boyfriend.x') - 340,getProperty('boyfriend.y'))
elseif curStep == 1342 or curStep == 1471 then
BattleMode = false
doTweenAlpha("soulfadeout","HeartSans",0,0.4)
doTweenAlpha("boyfriendsoulfadein","boyfriendGroup",1,0.4)
triggerEvent('Camera Follow Pos','','')
setProperty('HeartSans.velocity.x', 0)
setProperty('HeartSans.velocity.y', 0)
elseif curStep == 1490 then
endingCheck = true
elseif curStep == 1497 then
removeLuaSprite('HeartSans', true)
removeLuaSprite('GasterBlaster1', true)
removeLuaSprite('GasterBlaster2', true)
close()
end
end
function onGameOver()
BattleMode = false
endingCheck = true
end
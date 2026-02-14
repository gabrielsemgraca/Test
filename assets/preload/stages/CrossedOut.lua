--opt by vgph mods twin
local running = false
local songFinishedCheck = false
function onCreate()
for _, LoadChairs in ipairs({ 'pissed','BFrain','bfsans', 'sans','bfBattle','sansBattle','bfcrosfly','bfall','cupfall','sansfall','bfguitar','CrossedOutbf','bendy','bendyrun','bfrun','bendyrunDark','bfbend'}) do
addCharacterToList(LoadChairs)
end
for _, LoadImages in ipairs({ 'cup/Mugman Fucking dies','cup/rain/Cup-NewRAINLayer01','sans/halllight', 'sans/hallshading','sans/start','crossedout/bones1','crossedout/bones2','crossedout/WaterfallCross','crossedout/Guitar'}) do
addCharacterToList(LoadImages)
end
makeLuaSprite('Final', 'crossedout/ParticlesCrossOut', 340, 640)
addLuaSprite('Final', false)
setScrollFactor('Final', 0.7, 0.7)
scaleObject('Final', 1.2, 1.2)
makeLuaSprite('bendyRunner1', 'crossedout/hallway', 0, 400)
scaleObject('bendyRunner1', 8, 8)
setProperty('bendyRunner1.alpha', 0)
setProperty('bendyRunner1.velocity.x', -2500)
setProperty('bendyRunner1.active', false)
addLuaSprite('bendyRunner1')
makeLuaSprite('bendyRunner2', 'crossedout/hallway', 12200, 400)
scaleObject('bendyRunner2', 8, 8)
setProperty('bendyRunner2.alpha', 0)
setProperty('bendyRunner2.active', false)
setProperty('bendyRunner2.velocity.x', -2500)
addLuaSprite('bendyRunner2')
makeAnimatedLuaSprite('BendyLegs', 'characters/bendy/BendyLegs', 315, 625)
addAnimationByPrefix('BendyLegs', 'DarkHEHEHEImGonnaGetU', 'DarkHEHEHEImGonnaGetU', 20, true)
addAnimationByPrefix('BendyLegs', 'HEHEHEImGonnaGetU', 'HEHEHEImGonnaGetU', 20, true)
addLuaSprite('BendyLegs', false)
setProperty('BendyLegs.alpha', 0)
scaleLuaSprite('BendyLegs',3.4,3.4)
makeAnimatedLuaSprite('BFLegs', 'characters/bendy/BFLegs', 1840, 1230)
addAnimationByPrefix('BFLegs', 'DarkRunBitch', 'DarkRunBitch', 22, true)
addAnimationByPrefix('BFLegs', 'RunBitch', 'RunBitch', 22, true)
scaleLuaSprite('BFLegs',2,2)
addLuaSprite('BFLegs', false)
setProperty('BFLegs.alpha', 0)
makeLuaSprite('BendyGround', 'bendy/images/MidGrounUTScross', -600, -150)
scaleObject('BendyGround', 2, 2)
addLuaSprite('BendyGround', false)
if not lowQuality then
makeAnimatedLuaSprite('Light','bendy/images/first/Light(Add-Blend)',100,-80)
addAnimationByPrefix('Light','Light','fezt instance 1',24,true)
playAnim('Light','Light',true)
scaleObject('Light',4,4)
addLuaSprite('Light', true)
setProperty('Light.blend', 0)
setProperty('Light.alpha',0)
end
makeLuaSprite('voidstrt2', 'sans/start', -1000, -200)
scaleObject('voidstrt2', 20, 20)
addLuaSprite('voidstrt2', false)
setProperty('voidstrt2.alpha', 0)
makeLuaSprite('Guitar', 'crossedout/Guitar', 1460, 1200)
scaleObject('Guitar', 2, 2)
makeAnimatedLuaSprite('wf', 'crossedout/WaterfallCross', 680, 1050)
addAnimationByPrefix('wf', 'dance', 'Waterfall', 24, true)
playAnim('wf', 'Waterfall', false)
scaleObject('wf', 5.0, 5.0)
makeLuaSprite('bonesco2', 'crossedout/bones2', 1670, 670)
addLuaSprite('bonesco2', false)
setProperty('bonesco2.alpha', 0)
makeLuaSprite('battle', 'sans/battle', 0,-800)
scaleObject('battle', 4.0, 4.0)
addLuaSprite('battle', false)
makeLuaSprite('SansBG', 'sans/hall', 500, 770)
scaleObject('SansBG', 3.1, 3.0)
addLuaSprite('SansBG', false)
makeLuaSprite('halllight', 'sans/halllight', 500, 770)
scaleObject('halllight', 6.2, 6.0)
setProperty('halllight.blend', 0)
makeLuaSprite('hallshading', 'sans/hallshading', 500, 770)
scaleObject('hallshading', 6.2, 6.0)
makeLuaSprite('bonesco', 'crossedout/bones1', 1300, 700)
makeAnimatedLuaSprite('MugMan', 'cup/Mugman Fucking dies', 2000, 1300)
scaleObject('MugMan', 2.0, 2.0)
addAnimationByPrefix('MugMan', 'Walking', 'Mugman instance 1', 24, false)
addAnimationByPrefix('MugMan', 'Dead', 'MUGMANDEAD YES instance 1', 24, false)
makeLuaSprite('Cup-CH-RN-00', 'cup/rain/Cup-CH-RN-00', -600, -150)
setScrollFactor('Cup-CH-RN-00', 0.1, 0.1)
scaleObject('Cup-CH-RN-00', 3, 3)
makeLuaSprite('Cup-CH-RN-01', 'cup/rain/Cup-CH-RN-01', -750, -300)
setScrollFactor('Cup-CH-RN-01', 0.3, 0.3)
scaleObject('Cup-CH-RN-01', 3, 3)
makeLuaSprite('Cup-CH-RN-02', 'cup/rain/Cup-CH-RN-02', -600, -100)
scaleObject('Cup-CH-RN-02', 4, 4)
makeLuaSprite('Cup-BG-00', 'cup/Cup-BG-00', -600, -150)
setScrollFactor('Cup-BG-00', 0.1, 0.1);
scaleObject('Cup-BG-00', 3, 3)
makeLuaSprite('Cup-BG-01', 'cup/Cup-BG-01', -750, -300)
setScrollFactor('Cup-BG-01', 0.3, 0.3)
scaleObject('Cup-BG-01', 3, 3)
makeLuaSprite('Cup-BG-Ground', 'cup/Cup-BG-Ground', -600, -100);
scaleObject('Cup-BG-Ground', 4, 4)
makeAnimatedLuaSprite('Cup-NewRAINLayer01', 'cup/rain/Cup-NewRAINLayer01', -350, -210);
addAnimationByPrefix('Cup-NewRAINLayer01', 'dance', 'RainFirstlayer instance 1', 24, true);
playAnim('Cup-NewRAINLayer01', 'RainFirstlayer instance 1', false)
setScrollFactor('Cup-NewRAINLayer01', 0, 0);
scaleObject('Cup-NewRAINLayer01', 4.8,4.8)
addLuaSprite('Cup-CH-RN-00', false);
addLuaSprite('Cup-BG-00', false);
addLuaSprite('Cup-CH-RN-01', false);
addLuaSprite('Cup-BG-01', false);
addLuaSprite('Cup-CH-RN-02', false);
addLuaSprite('Cup-BG-Ground', false)


makeLuaSprite('voidstrt', 'sans/start', 0, 0)
scaleObject('voidstrt', 10, 10)
setObjectCamera('voidstrt', 'other')
if not lowQuality then
makeAnimatedLuaSprite('CupheqdShid', 'crossedout/CupFilt1', -350, -193);
addAnimationByPrefix('CupheqdShid', 'dance', 'OldTimey', 24, true);
playAnim('CupheqdShid', 'OldTimey', false)
scaleObject('CupheqdShid', 5.5, 5.5)
setObjectCamera('CupheqdShid', 'other')
makeAnimatedLuaSprite('Grain', 'crossedout/GrainCross', -350, -193);
addAnimationByPrefix('Grain', 'dance', 'Grain', 24, true);
playAnim('Grain', 'Grain', false)
scaleObject('Grain', 6.6, 6.6)
setObjectCamera('Grain', 'other')
addLuaSprite('CupheqdShid', true);
addLuaSprite('Grain', true)
end
end
function onStepHit()
if curStep == 576 then
for _, cupAlTween in ipairs({ 'Cup-BG-Ground','Cup-BG-01','Cup-BG-00'}) do
doTweenAlpha(cupAlTween, cupAlTween, 0.4, 8, 'linear')
end
elseif curStep == 640 then
for _, crossSpriteRemove in ipairs({ 'Cup-BG-Ground','Cup-BG-01','Cup-BG-00'}) do
removeLuaSprite(crossSpriteRemove, true);
end
addLuaSprite('Cup-NewRAINLayer01', true)
elseif curStep == 741 then
addLuaSprite('MugMan', true)
playAnim('MugMan','Walking',true)
setObjectOrder('MugMan', getObjectOrder('Cup-NewRAINLayer01'))
elseif curStep == 768 then
playAnim('MugMan', 'Dead', false)
if songFinishedCheck == false then
playSound('Cup/CupHurt')
playSound('Cup/knockout')
end
elseif curStep == 1024 then
setProperty('cardemp.alpha', 0)
setProperty('car.alpha', 0)
setProperty('Grain.alpha', 0)
setProperty('CupheqdShid.alpha', 0)
setProperty('Cup-NewRAINLayer01.alpha', 0)
for _, crossSpriteRemove in ipairs({ 'Cup-CH-RN-00','Cup-CH-RN-01','Cup-CH-RN-02','MugMan'}) do
removeLuaSprite(crossSpriteRemove, true)
end
addLuaSprite('halllight', true)
addLuaSprite('hallshading', true)
elseif curStep == 1272 then
removeLuaSprite('hallshading', true)
removeLuaSprite('halllight', true)
addLuaSprite('voidstrt', true)
setProperty('voidstrt2.alpha', 1)
if songFinishedCheck == false then
playSound('sans/countdown')
end
elseif curStep == 1273 then
removeLuaSprite('SansBG', true);
setProperty('Final.alpha', 0)
if songFinishedCheck == false then
playSound('sans/countdown')
end
elseif curStep == 1276 then
setProperty('voidstrt.alpha', 0)
if songFinishedCheck == false then
playSound('sans/countdown')
end
elseif curStep == 1534 then
setProperty('voidstrt.alpha', 1)
if songFinishedCheck == false then
playSound('sans/countdown')
end
setProperty('bonesco2.alpha', 1)
elseif curStep == 1537 then
if songFinishedCheck == false then
playSound('sans/countdown')
end
setProperty('voidstrt.alpha', 0)
removeLuaSprite('battle', true);
addLuaSprite('bonesco', true)
elseif curStep == 1785 then
setProperty('cardemp.alpha', 1)
setProperty('car.alpha', 1)
setProperty('Cup-NewRAINLayer01.alpha', 1)
removeLuaSprite('bonesco', true)
removeLuaSprite('bonesco2', true)
addLuaSprite('wf', false)
elseif curStep == 2040 then
setProperty('showComboNum', false)
setProperty('showRating', false)
setProperty('cardemp.alpha', 0)
setProperty('car.alpha', 0)
setProperty('voidstrt.alpha', 1)
removeLuaSprite('wf', true)
removeLuaSprite('Cup-NewRAINLayer01', true)
for _, uigroupstuff in ipairs({'healthBar','scoreTxt','iconP1', 'iconP2','timeBar','timeBarBG','timeTxt'}) do
setProperty(uigroupstuff..'.visible', false)
end
addLuaSprite('Guitar', false)
elseif curStep == 2048 then
setProperty('voidstrt.alpha', 0)
elseif curStep == 2304 then
setProperty('showComboNum', true)
setProperty('showRating', true)
setProperty('Light.alpha', 0.8)
removeLuaSprite('Guitar', true)
removeLuaSprite('voidstrt2', true)
for _, uigroupstuff in ipairs({'healthBar','scoreTxt','iconP1', 'iconP2','timeBar','timeBarBG','timeTxt'}) do
setProperty(uigroupstuff..'.visible', true)
end
elseif curStep == 2560 then
setProperty('BFLegs.alpha', 1)
setProperty('BendyLegs.alpha', 1)
setProperty('Light.alpha', 0)
for _, crossSpriteRemove in ipairs({ 'BendyGround'}) do
removeLuaSprite(crossSpriteRemove, true);
end
for _, v in ipairs({ 'bendyRunner1', 'bendyRunner2' }) do
setProperty(v .. '.alpha', 1)
setProperty(v .. '.active', true)
end
running = true
elseif curStep == 2816 then
for _, v in ipairs({ 'bendyRunner1', 'bendyRunner2' }) do
loadGraphic(v, 'crossedout/Tunnel')
end
removeLuaSprite('Light', true);
playAnim('BendyLegs','DarkHEHEHEImGonnaGetU',true)
playAnim('BFLegs','DarkRunBitch',true)
elseif curStep == 3072 then
songFinishedCheck = true
running = false
for _, v in ipairs({ 'bendyRunner1', 'bendyRunner2' }) do
removeLuaSprite(v, true)
end
setProperty('Final.alpha', 1)
setProperty('Grain.alpha', 1)
setProperty('CupheqdShid.alpha', 1)
for _, uigroupstuff in ipairs({'healthBar','scoreTxt','iconP1', 'iconP2','timeBar','timeBarBG','timeTxt'}) do
setProperty(uigroupstuff..'.visible', false)
end
removeLuaSprite('BFLegs', true)
removeLuaSprite('BendyLegs', true)
end
end
function onUpdate()
if running then
if getProperty('bendyRunner1.x') <= -12200 then
setProperty('bendyRunner1.x', 12200)
end
if getProperty('bendyRunner2.x') <= -12200 then
setProperty('bendyRunner2.x', 12200)
end
end
end
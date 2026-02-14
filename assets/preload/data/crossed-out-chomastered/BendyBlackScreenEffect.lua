function onCreatePost()
    setTextFont('scoreTxt', 'CupheadICFont.ttf')
	setTextFont('timeTxt','CupheadICFont.ttf')

makeLuaSprite('CupheadHealthBar', 'health_IC/cuphealthbar', getProperty('healthBar.x') - 25, getProperty('healthBar.y') - 18)
setProperty('healthBarBG.visible', false)
setObjectCamera('CupheadHealthBar', 'hud')
addLuaSprite('CupheadHealthBar', true)
setObjectOrder('iconP1', getObjectOrder('CupheadHealthBar') + 1)
setObjectOrder('iconP2', getObjectOrder('CupheadHealthBar') + 1)
setProperty('healthBar.scale.y', 2.0)
setProperty('healthBar.scale.x', 1.06)

makeLuaSprite('SansHealthBar', 'health_IC/sanshealthbar', getProperty('healthBar.x') - 55, getProperty('healthBar.y') - 0)
setObjectCamera('SansHealthBar', 'hud')
addLuaSprite('SansHealthBar', true)
setObjectOrder('iconP1', getObjectOrder('SansHealthBar') + 1)
setObjectOrder('iconP2', getObjectOrder('SansHealthBar') + 1)
setProperty('SansHealthBar.alpha', 0)
end

function opponentNoteHit()
    if (curStep > 1527 and curStep < 1536) then
	if getProperty('health') > 0.4 then
	setProperty('health',getProperty('health')-0.29)
	end
end
end

function onCreate()
makeLuaSprite('startblack', 'bleck', -10, -10);
scaleLuaSprite('startblack', 3, 3)
addLuaSprite('startblack', true);
setObjectCamera('startblack', 'other')
end

function onSongStart()
    doTweenAlpha('startblack', 'startblack', 0, 4, 'linear')
end
--darkness effect for bendy and finale

function onStepHit()
    if curStep == 1024 then
        removeLuaSprite('CupheadHealthBar', true)
	    setObjectOrder('SansHealthBar', getObjectOrder('healthBar') + 1)
		setProperty('Attack.alpha', 0)
        setProperty('healthBar.flipX', true)
        setProperty('iconP1.visible', false)
        setProperty('iconP2.visible', false)
        setTextFont('scoreTxt', 'SansICFont.ttf')
        setTextFont('timeTxt','SansICFont.ttf')
        setProperty('SansHealthBar.alpha', 1)
        setProperty('healthBar.scale.x', 1)
        setProperty('healthBar.scale.y', 1.5)
    elseif curStep == 1280 then
    setProperty('button.alpha', 0)
    elseif curStep == 1783 then
    setProperty('Attack.alpha', 1)
    setProperty('button.alpha', 1)
    elseif curStep == 2040 then
        removeLuaSprite('SansHealthBar', true)
        removeLuaSprite('button', true)
        removeLuaSprite('Attack', true)
    elseif curStep == 2304 then
        setProperty('healthBar.flipX', false)
		setTextColor('scoreTxt', 'fbd263')
		setTextColor('botplayTxt', 'fbd263')
		setTextColor('timeTxt', 'fbd263')
		setProperty('healthBar.scale.x', 1.06)
		setProperty('healthBar.scale.y', 2)
		makeLuaSprite('BendyHealthBar', 'health_IC/bendyhealthbar', 300, 550)
        if downscroll then
        makeLuaSprite('BendyHealthBar', 'health_IC/bendyhealthbar', 300, 0)
        end
	setObjectCamera('BendyHealthBar', 'hud')
	addLuaSprite('BendyHealthBar', true)
        setObjectOrder('iconP1', getObjectOrder('BendyHealthBar') + 1)
	setObjectOrder('iconP2', getObjectOrder('BendyHealthBar') + 1)
        setTextFont('scoreTxt', 'BendyFont.ttf')
        setTextFont('timeTxt','BendyFont.ttf')
        elseif curStep == 2816 then
        triggerEvent('noteskinchange','BendyNotes','')
    elseif curStep == 3072 then
    triggerEvent('noteskinchange','NM','')
        removeLuaSprite('BendyHealthBar', true)
    elseif curStep == 2308 then
        makeLuaSprite('BlackSubEffectBendyIC', '', 0, 0)
        makeGraphic('BlackSubEffectBendyIC', 1, 1, '646464')
        scaleObject('BlackSubEffectBendyIC', screenWidth, screenHeight)
        setObjectCamera('BlackSubEffectBendyIC', 'other')
        setProperty('BlackSubEffectBendyIC.alpha', 0)
        addLuaSprite('BlackSubEffectBendyIC', true)
        setBlendMode('BlackSubEffectBendyIC', 'SUBTRACT')
        runTimer('BackToBlackBendy', 2)
    elseif curStep == 3602 then
        doTweenAlpha('songendfadeaway', 'startblack', 1, 8, 'linear')
    end
end

function onTimerCompleted(tag)
    if tag == 'BackToWhiteBendy' then
        doTweenAlpha('BlackLightEffect', 'BlackSubEffectBendyIC', 0, 2, 'linear')
        runTimer('BackToBlackBendy', 2 * 1.5)
    end
    if tag == 'BackToBlackBendy' then
        doTweenAlpha('BlackLightEffect', 'BlackSubEffectBendyIC', 0.5, 2, 'linear')
        runTimer('BackToWhiteBendy', 2 * 1.5)
    end
end

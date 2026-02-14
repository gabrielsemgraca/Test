--Script by sirFerzy

function onCreatePost()
    for num = 0, 4 do
        precacheSound('Cup/attacks/chaser' .. num)
    end
    precacheImage('cup/bull/GreenShit')
end

local greenshits = 0
function opponentNoteHit(i, d, e, q)
    if not q and dadName == 'pissed' then
        if altAnim or e == 'Alt Animation' then
            greenshits = greenshits + 1
            runTimer('www' .. greenshits, 0.45 / playbackRate)
            runTimer('wew' .. greenshits, 0.8 / playbackRate)
            playSound('chaser' .. getRandomInt(0, 4), 0.3)
            if greenshits > 100 then
                greenshits = 0
            end
            if d == 3 then
                makeAnimatedLuaSprite('chased' .. greenshits, 'cup/bull/GreenShit', getProperty('dad.x') + 390, defaultOpponentY + 420)
                addAnimationByPrefix('chased' .. greenshits, 'cup/bull/GreenShit',
                    'GreenShit0' .. getRandomInt(1, 2) .. ' instance 1'
                    , 24, false)
                setProperty('chased' .. greenshits .. '.flipY', getRandomBool(50))
            elseif d == 0 then
                makeAnimatedLuaSprite('chased' .. greenshits, 'cup/bull/GreenShit', getProperty('dad.x') + 240, defaultOpponentY + 340)
                addAnimationByPrefix('chased' .. greenshits, 'cup/bull/GreenShit',
                    'GreenShit0' .. getRandomInt(1, 2) .. ' instance 1'
                    , 24, false)
                setProperty('chased' .. greenshits .. '.flipY', getRandomBool(50))
            elseif d == 1 then
                makeAnimatedLuaSprite('chased' .. greenshits, 'cup/bull/GreenShit', getProperty('dad.x') + 340, defaultOpponentY + 430)
                addAnimationByPrefix('chased' .. greenshits, 'cup/bull/GreenShit',
                    'GreenShit0' .. getRandomInt(1, 2) .. ' instance 1'
                    , 24, false)
                setProperty('chased' .. greenshits .. '.flipY', true)
            elseif d == 2 then
                makeAnimatedLuaSprite('chased' .. greenshits, 'cup/bull/GreenShit', getProperty('dad.x') + 300, defaultOpponentY + 335)
                addAnimationByPrefix('chased' .. greenshits, 'cup/bull/GreenShit', 'GreenShit02 instance 1', 24, false)
            end
            scaleObject('chased' .. greenshits, 1.1, 0.9)
            addLuaSprite('chased' .. greenshits, true)
            setBlendMode('chased' .. greenshits, 'add')
        end
    end
end

--very important shit

function onTimerCompleted(tag)
    if string.sub(tag, 1, 3) == 'www' then
        if getHealth() > 0.15 then
            addHealth(-0.023)
        end
    end
    if string.sub(tag, 1, 3) == 'wew' then
        removeLuaSprite('chased' .. string.sub(tag, 4, 8), true)
    end
end


function onStepHit()
    if curStep == 1942 then
        close()
    end
end
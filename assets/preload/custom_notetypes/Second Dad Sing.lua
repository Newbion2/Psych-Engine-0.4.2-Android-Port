local penis
local nd = 0;
function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Second Dad Sing' then



			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true); --No Anim
            setPropertyFromGroup('unspawnNotes', i, 'texture', 'bnb/bosip'); --Change texture

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
                        setPropertyFromGroup('unspawnNotes', i, 'texture', ''); --Change texture

				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
			end
		else
			if songName == 'Celebrations' and not getPropertyFromGroup('unspawnNotes', i, 'mustPress')then
          		setPropertyFromGroup('unspawnNotes', i, 'texture', 'bnb/bob'); --Change texture
          	end
		end
	end
	--debugPrint('Script started!')
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false

function onEvent( name, value1,value2)
	if name == "dad2sing" then

		if value1 == 0 then
			objectPlayAnimation('secondDad','singLEFT',true)
		end
		if value1 == 1 then
			objectPlayAnimation('secondDad','singDOWN',true)
		end
		if value1 == 2 then
			objectPlayAnimation('secondDad','singUP',true)
		end
		if value1 == 3 then
			objectPlayAnimation('secondDad','singRIGHT',true)
		end
	end
end
function opponentNoteHit(id, noteData, noteType, isSustainNote)

	if noteType == 'Second Dad Sing' then
		triggerEvent("dad2sing",noteData,'')
	end
end
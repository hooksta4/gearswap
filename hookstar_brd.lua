-- [[************************************]] --
-- [[MmeWardu's BRD lua (ft. Lovercraft) ]] --
-- [[    Adapted from Wren's lua file    ]] --
-- [[************************************]] --

-- [[************************************]] --
-- [[         Chapter 0: Stats           ]] --
-- [[************************************]] --

-- DEBUFF SONGS

-- MAGIC HIT RATE (MHR)

-- Macc determines Magic Hit Rate. It does not affect potency of spells. 
-- Magic Hit rate gets calculated from Magic Skill, CHR and Macc from gear. 
-- Magic Hit rate gets compared to the target's Magic Evasion to determines resists. 
-- Enfeebles can have one or more resist states. If they have more than one, duration is decreased.
-- Determination of the "resist" state is an iterative "random roll" against your MHR.

-- 1 Macc equals 1 MHR @ resists rates <50% and 0.5 >50%. MHR caps around 95%.
-- 1 Magic Skill equals 1/3 Macc. Magic skill also affect interruption rate.
-- 1 CHR equals 1 Macc until total CHR > (targetCHR + 10), after which it roughly equals 0,5 Macc.

-- BRD songs CAN NOT get interrupted.

-- DEBUFF SONG DURATION AND POTENCY

-- These stats are ONLY affected by "song +" effects.
-- Gjallarhorn has +2 on all songs and ONLY gets beaten by Requiem flute for Requiem (+4).
-- "Song +n" cannot overwrite "song +n+1".

-- BUFF SONG POTENCY AND DURATION

-- Song "+" increase both potency and duration. 
-- Combined skill increases potency of buff songs. 

-- [[************************************]] --
-- [[         Chapter 1: Gearsets        ]] --
-- [[************************************]] --
 
 function get_sets()
 
-- Idle set on BRD can be swapped according to role as puller (PDT) or specific endgame content (MDT).
	
-- DAMAGE REDUCTION sets
 -- Can be macro'd in when damage is imminent.
 
 -- PDT set will for things like Oblivion Smash. 
 -- This set is identical to our IDLE set, but gets macro'd in to stick during actions like casting, which is not the case for our IDLE set.
 
  sets.PDT = {
	    main        = "Terra's Staff",
        sub         = "Reign Grip",
        range       = "Gjallarhorn",
        head        = "Maat's cap",
        neck        = "Evasion Torque",
        left_ear    = "Merman's Earring",
        right_ear   = "Merman's Earring",
        body        = "Avalon Breastplate",
        hands       = "Choral Cuffs +1",
        left_ring   = "Minerva's Ring",
        right_ring  = "Shadow Ring",
        back        = "Hexerei Cape",
        waist       = "Resolute Belt",
        legs        = "Goliard Trews",
        feet        = "Dance Shoes +1"
    }
 
 -- MDT panic button set for things like Meteor and Mijin Gakure.
 
    sets.MDT = {
	    main        = "Terra's Staff",
        sub         = "Reign Grip",
        range       = "Gjallarhorn",
        head        = "Maat's Cap", -- Black Ribbon
        neck        = "Evasion Torque",
        left_ear    = "Merman's Earring",
        right_ear   = "Merman's Earring",
        body        = "Avalon Breastplate",
        hands       = "Choral Cuffs +1",
        left_ring   = "Minerva's Ring",
        right_ring  = "Shadow Ring",
        back        = "Hexerei Cape",
        waist       = "Resolute Belt",
        legs        = "Goliard Trews",
        feet        = "Dance Shoes +1"
    }
 
-- MAGIC SETS
 -- Spell precast.
   -- Enhances Fast Cast and Haste (for recast timers).
 
    sets.fc  = {
        sub         = "Vivid Strap +1",
		head        = "Walahra Turban",
		hands		= "Dusk Gloves +1",
		back        = "Veela Cape", 
        feet		= "Dusk Ledelsens +1",
		body        = "Goliard Saio",
		legs        = "Byakko's Haidate",
        left_ear    = "Loquac. Earring",
		waist		= "Capricornian Rope",
        feet        = "Rostrum Pumps"
    }  
	
 -- Song Precast.
  -- Reduced song spellcasting times.
	
     sets.fcsong = {
        body        = "Sheikh Manteel",
        right_ring  = "Minstrel's Ring"
    }
 
 -- Song Midcast.
  -- This set is for enhancing songs. Singing and Wind skills. CHR does not affect buffing songs in any way.
  
    sets.song = {
        main        = "Chanter's Staff",
        sub         = "Reign Grip",
		range       = "Gjallarhorn",
        head        = "Demon Helm +1", -- get
        neck        = "Wind Torque", --get
        left_ear    = "Musical Earring",--get
        right_ear   = "Singing Earring",--get
        body        = "Sheikh Manteel",--get Minstrels Coat
        hands       = "Choral Cuffs +1", --  +1
        left_ring   = "Nereid Ring", --get
        right_ring  = "Minstrel's Ring",
        back        = "Astute Cape",--ixdrg
        waist       = "Marching Belt", --get
        legs        = "Choral Cannions",
        feet        = "Oracle's Pigaches"
    }
 
 -- Debuff Midcast. 
  -- Debuffing songs primarily use Magic Accuracy and CHR, then skill.
  -- CHR is equal to Macc until 10 CHR above the mobs CHR, after which it is 50% as effective. 
  -- Skill is 1/3 Macc.
  
    sets.debuff = {
        main        = "Chatoyant Staff",
        sub         = "Light Grip",
		range       = "Gjallarhorn",
		head        = "Diana Corona",
		neck		= "Piper's Torque",
		left_ear    = "Helenus's Earring",
        right_ear   = "Cassandra's Earring",
		body        = "Oracle's Robe",
        hands       = "Choral Cuffs +1", --+1
		left_ring   = "Heavens Ring +1", --get
        right_ring  = "Minstrel's Ring",
		back        = "Marching Belt", 
		legs		= "Valkyrie's Trews",
		feet		= "Goliard Clogs",
    }
 
 -- Cure Midcast.
  -- Cure potency and MND.
	
    sets.heal = {
        main        = "Chatoyant Staff",
        sub         = "Reign Grip",
        head        = "Goliard Chapeau",
        neck        = "Fylgja Torque +1",
		left_ear    = "Celestial Earring",
        right_ear   = "Celestial Earring",
        body        = "Mahatma Hpl.",
        hands       = "Bricta's Cuffs",
        left_ring   = "Celestial Ring",
        right_ring  = "Celestial Ring",
        back        = "Altruistic Cape",
        waist       = "Pythia Sash +1",
        legs        = "Mahatma Slops",
        feet        = "Suzaku's Sune-Ate"
    }
 
 -- Enfeebling midcast.
  -- Skill = 0.9 Macc (at high skill) > MND.
    sets.enfeebling = {
        sub         = "Vivid Strap +1",
		range		= "Aureole",
        head        = "Diana Corona",
        neck        = "Enfeebling Torque",
		left_ear    = "Helenus's Earring",
        right_ear   = "Cassandra's Earring",
        body        = "Mahatma Hpl.",
        hands       = "Bricta's Cuffs",
        left_ring   = "Celestial Ring",
        right_ring  = "Celestial Ring",
        back        = "Altruistic Cape",
        waist       = "Pythia Sash +1",
        legs        = "Mahatma Slops",
        feet        = "Avocat Pigaches"
    }
 
 -- Enhancing midcast. 
  -- Enhancing skill and Mind.
    sets.enhancing = {
        main        = "Chatoyant Staff",
        sub         = "Reign Grip",
        head        = "Goliard Chapeau",
        neck        = "Enhancing Torque",
        left_ear    = "Celestial Earring",
		right_ear   = "Augment. Earring",
        body        = "Mahatma Hpl.",
        hands       = "Bricta's Cuffs",--DL
        left_ring   = "Celestial Ring",
        right_ring  = "Celestial Ring",
        back        = "Merciful Cape",
        waist       = "Pythia Sash +1",
        legs        = "Mahatma Slops",
        feet        = "Suzaku's Sune-Ate"
    }
 
 -- hMP set when resting.
 
    sets.rest = {
        main        = "Chatoyant Staff",
        head        = "Mirror Tiara",
		range       = "Gjallarhorn",
        neck        = "Beak Necklace +1",
        left_ear    = "Antivenom Earring",
        right_ear   = "Relaxing Earring",
        body        = "Mahatma Hpl.",
        hands       = "Oracle's Gloves",
        left_ring   = "Celestial Ring",
        right_ring  = "Celestial Ring",
        back        = "Invigorating Cape",
        waist       = "Qiqirn Sash +1",
        legs        = "Oracle's Braconi",
        feet        = "Goliard Clogs"
    }
 
 -- Yellow set.
  --  HP to MP conversion gear to reduce HP below 75% which procs Minstrel's Ring.
    sets.yellow = {
        main        = "Chanter's Staff",
        head        = "Zenith Crown +1",
	    left_ear    = "Astral Earring",
        body        = "Dalmatica +1",
        hands       = "Zenith Mitts +1",
        left_ring   = "Serket Ring",
        waist       = "Scouter's Rope",
        legs        = "Zenith Slacks +1",
        feet        = "Zenith Pumps +1"
    }
	
 end
 
-- [[************************************]] --
-- [[         Chapter 2: Functions       ]] --
-- [[************************************]] -- 

-- Functions execute the gearswaps automatically in certain situations.

function status_change(new,old)
    choose_set()
end
 
 function choose_set()
	if player.status == 'Engaged' then 
		equip_idle()
    elseif player.status == 'Resting' then
        equip_rest()
	else
		equip_idle()
	windower.add_to_chat(8,'[PanicMode: ' ..PanicMode..']')
	end
	equip_Panic()
end

-- Equip functions equip the sets we just defined. The equip function can then be integrated in other functions. 

 function equip_idle()
    windower.add_to_chat(8,'[Idle]')
    if IdleMode == "PDT" then
		equip(sets.PDT)
	else equip(sets.MDT)
end
end

-- PANIC
 -- Equips MDT or PDT sets in ALL situations when macro'd in with a command function (see Chapter 3).

function equip_Panic()
	if PanicMode == "PDT" then
		equip(sets.PDT)
		windower.add_to_chat(8,'[PDT]')
	elseif PanicMode == "MDT" then
		equip(sets.MDT)
		windower.add_to_chat(8,'[MDT]')
	end
end

-- PRECAST 
 -- The precast function runs automatically BEFORE we begin casting a spell or job ability:
 -- It equips our Fast Cast set before a spell. 
 -- It casts Utsusemi: Ichi instead of Ni when Ni's CD is down (so only a Ni macro is necessary).
 
 function precast(spell)
     if spell.action_type == 'Magic' then
        equip(sets.fc)
	 if spell.type == "Ninjutsu" then
		if spell.name == "Utsusemi: Ni" and spell_recasts[spell.recast_id] > 0 then
			cancel_spell()
			send_command('input /ma "Utsusemi: Ichi" <me>')	
        end
     elseif spell.type == 'BardSong' then
        equip(sets.fcsong)
	end
	equip_Panic()
 end
 end
 
 -- MIDCAST
 -- Equips the potency gear for the type of spell being cast.
 

 function equip_song(spell)
    windower.add_to_chat(8,'[Bard Song]')
    equip(sets.song)
    if string.find(spell.english,'Elegy') or string.find(spell.english,'Threnody') or string.find(spell.english,'Lullaby') or string.find(spell.english,'Finale') or string.find(spell.english,'Requiem') then
        equip(sets.debuff)
    end
 end
 

 function midcast(spell)
     if spell.skill == 'Healing Magic' then
        equip_heal()
    elseif spell.skill == 'Enfeebling Magic' then
        equip_enfeebling()
    elseif spell.skill == 'Enhancing Magic' then
        equip_enhancing(spell)
    elseif spell.type == 'BardSong' then
        equip_song(spell)
    end
	
-- AUTO BUFF CANCELS
 -- Cancel current buffs if a non-overwriting spell is cast.
 
	if spell.name == "Utsusemi: Ichi" then send_command('input ; wait 3;input //cancel copy image*')end
	if spell.name == "Blink" then send_command('wait 3;cancel blink;input //cancel copy image*') end
	if spell.name == "Sneak" or spell.name == "Spectral Jig" then send_command("cancel sneak") end
	if spell.name == "Stoneskin" then send_command("wait 5;cancel Stoneskin") end		

	equip_Panic()

 end
 
-- AFTERCAST
 -- After we finish our spell or ability, status change is ran to return to our current stance (idle, resting, engaged).
 
 function aftercast(spell)
    choose_set()
 end


-- MAGIC sets

function equip_heal()
    windower.add_to_chat(8,'[Healing]')
    equip(sets.heal)
end

function equip_enhancing(spell)
    windower.add_to_chat(8,'[Enhancing]')
    if spell.name == 'Stoneskin' then
        equip(sets.enhancing,{neck="Stone Gorget"})
    else
         equip(sets.enhancing)
    end
 end
 
 function equip_enfeebling()
    windower.add_to_chat(8,'[Enfeebling]')
    equip(sets.enfeebling)
end

-- REST set

function equip_rest()
    windower.add_to_chat(8,'[Resting]')
    equip(sets.rest)
end 
 
-- Yellow set function equips the HP to MP set for a split second.
 function equip_yellow()
    windower.add_to_chat(8,'[Yellow]')
    equip(sets.yellow)
    send_command('wait .1; gs equip MDT')
end

-- [[************************************]] --
-- [[         Chapter 3: Commands        ]] --
-- [[************************************]] --  
 
-- IDLE SWAPS
 -- Swaps in MDT with "I" and PDT with "A".
 -- These will then stay on during all actions, untill the command is hit again.
 -- Puts HP at yellow with "Y".
 -- Commands are /console gs c X
 
function self_command(m)
	if m == "Y" then
        equip_yellow()
    end
	
    if m == "I" then
		if PanicMode == "Off" or PanicMode == "MDT" then
        PanicMode = "PDT"
		else 
		PanicMode = "Off" 
		end
		choose_set()
		
	elseif m == "A" then
		if PanicMode == "Off" or PanicMode == "PDT" then
        PanicMode = "MDT"
		else 
		PanicMode = "Off" 
		end
		choose_set()
		
	elseif m == "W" then
		if IdleMode == "PDT" then
        IdleMode = "MDT"
		else 
		IdleMode = "PDT" 
		end
		choose_set()
	end
end
 
 
-- [[************************************]] --
-- [[         Chapter 4: Start code      ]] --
-- [[************************************]] --  
  
-- When changing jobs these will be the default/starting modes.

PanicMode = "Off"
IdleMode = "PDT"

-- Equip our Idle set and lockstyleset 16 our Fashion set. Swapping to the correct macro book.
 
send_command('wait 1;gs equip PDT; wait 2;input /lockstyleset 10; wait 1; input /macro book 15; wait 2; input /macro set 1')
--[[ *************************************************************
	TG's WAR lua - 2019
************************************************************* --]]
 
 --[[ ******************************************************
  Gearsets - define the various sets of gear we'll wear.
****************************************************** --]]
 
 function get_sets()
 
     -- fashion set is for looking nice while lockstyled.
    -- make sure you include your top-row equipment,
    -- especially if you use a ranged or throwing weapon.
    sets.fashion    =   {
        main        =   "Spharai",
        head        =   "Maat's Cap",
        body        =   "Hachiryu Haramaki",
        hands       =   "Hachiryu Kote",
        legs        =   "Hachiryu Haidate",
        feet        =   "Denali Gamashes"
    }
 
    -- idle set is worn when we're standing around doing
    -- nothing.  we want evasion, damage reduction and movement speed+.
	
    sets.idle       =   {
        ammo        =   "White Tathlum",
        head        =   "Gnole Crown",
        body        =   "Melee Cyclas +1",
        hands       =   "Denali Wristbands",
        legs        =   "Denali Kecks",
        feet        =   "Herald's Gaiters",
        neck        =   "Orochi Nodowa +1",
        waist       =   "Scouter's Rope",
        left_ear    =   "Novia Earring",
        right_ear   =   "Triton Earring",
        left_ring   =   "Shadow Ring",
        right_ring  =   "Patronus Ring",
        back        =   "Shadow Mantle"
    }
	
	-- daylight idle set with lycopodium sash and feronia's bangles for super regen
	
	sets.daylight    =   {
        hands       = "Feronia's Bangles",
		waist		= "Lycopodium Sash"
	}
	 
    -- engaged sets
    
    -- maximize haste and prioritize accuracy and attack second
    sets.haste    =   {
	    ammo        =   "White Tathlum",
        head        =   "Walahra Turban",
        body        =   "Hachiryu Haramaki",
        hands       =   "Bandomusha Kote",
        legs        =   "Byakko's Haidate",
        feet        =   "Fuma Sune-Ate",
        neck        =   "Faith Torque",
        waist       =   "Black Belt",
        left_ear    =   "Brutal Earring",
        right_ear   =   "Merman's Earring",
        left_ring   =   "Rajas Ring",
        right_ring  =   "Toreador's Ring",
        back        =   "Cerb. Mantle +1"
    }
    
    -- full accuracy set
    sets.accuracy   =   {
        ammo        =   "Black Tathlum",
        head        =   "Optical Hat",
        body        =   "Hachiryu Haramaki",
        hands       =   "Enkidu's Mittens",
        legs        =   "Cobra Subligar",
        feet        =   "Denali Gamashes",
        neck        =   "Peacock Amulet",
        waist       =   "Virtuoso Belt",
        left_ear    =   "Pixie Earring",
        right_ear   =   "Brutal Earring",
        left_ring   =   "Toreador's Ring",
        right_ring  =   "Toreador's Ring",
        back        =   "Cuchulain's Mantle"
}   

    -- full evasion
    sets.eva        =   {
        ammo        =   "White Tathlum",
        head        =   "Gnole Crown",
        body        =   "Scp. Harness +1",
        hands       =   "Denali Wristbands",
        legs        =   "Denali Kecks",
        feet        =   "Herald's Gaiters",
        neck        =   "Evasion Torque",
        waist       =   "Scouter's Rope",
        left_ear    =   "Triton Earring",
        right_ear   =   "Triton Earring",
        left_ring   =   "Wivre Ring +1",
        right_ring  =   "Wivre Ring +1",
        back        =   "Boxer's Mantle"
}

    -- specialized TP sets
    
    sets.footwork   =   {
        legs        =   "",
        feet        =   "Kyoshu Kyahan"
    }
      
    -- our resting set is for hMP.
    sets.rest = {
        body        = "Melee Cyclas +1",
        neck        = "",
        left_ear    = "Sanative Earring",
        right_ear   = "",
        hands       = "",
        left_ring   = "",
        right_ring  = "",
        waist       = "",
		feet		= "",
		back		= "Melee Cape"
    }
 
     -- stacking strength for Final Heaven
	 
    sets.finalheaven = {
        ammo        =   "Black Tathlum",
        head        =   "Maat's Cap",
        body        =   "Kirin's Osode",
        hands       =   "Alkyoneus's Bracelets",
        legs        =   "Hachiryu Haidate",
        feet        =   "Agrona's Leggings",
        neck        =   "Fotia Gorget",
        waist       =   "Black Belt",
        left_ear    =   "Brutal Earring",
        right_ear   =   "Harmonius Earring",
        left_ring   =   "Rajas Ring",
        right_ring  =   "Flame Ring",
        back        =   "Cerb. Mantle +1"
}
    
    -- Dragon Kick: STR50% DEX50%
    sets.dragonkick =   {
        ammo        =   "Black Tathlum",
        head        =   "Maat's Cap",
        body        =   "Hachiryu Haramaki",
        hands       =   "Alkyoneus's Bracelets",
        legs        =   "Hachiryu Haidate",
        feet        =   "Denali Gamashes",
        neck        =   "Fotia Gorget",
        waist       =   "Black Belt",
        left_ear    =   "Brutal Earring",
        right_ear   =   "Harmonius Earring",
        left_ring   =   "Rajas Ring",
        right_ring  =   "Flame Ring",
        back        =   "Cerb. Mantle +1",

    }
    
	-- stacking more str for other WSs
	 
    sets.ws = {
        ammo        =   "Black Tathlum",
        head        =   "Maat's Cap",
        body        =   "Kirin's Osode",
        hands       =   "Alkyoneus's Bracelets",
        legs        =   "Hachiryu Haidate",
        feet        =   "Denali Gamashes",
        neck        =   "Fotia Gorget",
        waist       =   "Black Belt",
        left_ear    =   "Harmonius Earring",
        right_ear   =   "Harmonius Earring",
        left_ring   =   "Harmonius Ring",
        right_ring  =   "Flame Ring",
        back        =   "Cerb. Mantle +1"
    }
 
     -- chakra set with +VIT
    sets.chakra={
        ammo        =   "Bibiki Seashell",
        head        =   "Genbu's Kabuto",
        body        =   "Temple Cyclas +1",
        hands       =   "Melee Gloves +1",
        legs        =   "Kensei Sitabaki",
        feet        =   "Creek M Clomps",
        neck        =   "Fortitude Torque",
        waist       =   "Warwolf Belt",
        left_ear    =   "Robust Earring",
        right_ear   =   "Cassie Earring",
        left_ring   =   "Corneus Ring",
        right_ring  =   "Mercenary's Ring",
        back        =   "Melee Cape",
}

    -- chi blast set with +MND
    sets.chiblast   =   {
        ammo        =   "Black Tathlum",
        head        =   "Temple Crown",
        body        =   "Kirin's Osode",
        hands       =   "Denali Wristbands",
        legs        =   "Prince's Slops",
        feet        =   "Suzaku's sune-ate",
        neck        =   "Faith Torque",
        waist       =   "Pythia Sash +1",
        left_ear    =   "Celestial Earring",
        right_ear   =   "Celestial Earring",
        left_ring   =   "Celestial Ring",
        right_ring  =   "Celestial Ring",
        back        =   "Melee Cape"
    }
    
    -- counterstance set - max out guarding/counter
    sets.counter    =   {
        head        =   "Gnole Crown",
        body        =   "Cobra Harness",
        hands       =   "",
        legs        =   "Temple Hose +1",
        feet        =   "Melee Gaiters +1",
        back        =   "Boxer's Mantle",
        ring1       =   "",
        ring2       =   "",
        ear1        =   "",
        ear2        =   ""
    }
   
    -- Utsusemi casting set - maximize ninjutsu skill and haste.
    sets.utsu = {
        neck        =   "Ninjutsu Torque",
        left_ear    =   "Ninjutsu Earring",
		back		=   "Astute Cape"
    }
 
     sets.fc = {
        ammo        =   "White Tathlum",
        head        =   "Gnole Crown",
        body        =   "Scp. Harness +1",
        hands       =   "Denali Wristbands",
        legs        =   "Byakko's Haidate",
        feet        =   "Enkidu's Leggings",
        neck        =   "Tiercel Necklace",
        waist       =   "Black Belt",
        left_ear    =   "Triton Earring",
        right_ear   =   "Loquac. Earring",
        left_ring   =   "Shadow Ring",
        right_ring  =   "Patronus Ring",
        back        =   "Boxer's Mantle"
    }
 
 end
 
 --[[ ******************************************************
  Equip functions - put on the sets we defined above, and
 echo a note to our chat log so we know it worked.
****************************************************** --]]
 
 -- equip our idle set for standing around
 function equip_idle()
     windower.add_to_chat(8,'[Idle]')
  	if world.time <= 1080 and world.time >= 360 then
		windower.add_to_chat(8,"[Daylight Regen]")
		equip(sets.idle,sets.daylight)
    else
        equip(sets.idle)
		end
	end

-- equip our engaged set. if footwork is not active, reset footwork flag and unequip that set.

function equip_engaged()
    if ev == true then
        windower.add_to_chat(8,'[Evasion]')
        equip(sets.haste,sets.eva)
    elseif acc == true then
        windower.add_to_chat(8,'[Accuracy]')
        equip(sets.haste,sets.accuracy)
    else
        equip(sets.idle,sets.haste)
    end
end
 
 -- equip our WS set
 function equip_ws(spell)
    if spell.name == 'Final Heaven' then
        equip(sets.finalheaven)
    elseif spell.name == 'Dragon Kick' then
        equip(sets.dragonkick)
        if (buffactive['footwork']) then
            equip(sets.footwork)
        end
    else
        equip(sets.ws)
    end
    if world.time <= 1080 and world.time >= 360 then
			windower.add_to_chat(8,"[Daylight Bonus - Fenrir Earring]")
			equip({right_ear="Fenrir's Earring"})
    end
 end
 
 -- equip our hMP set
 function equip_rest()
     windower.add_to_chat(8,'[Resting]')
    equip(sets.rest)
end

-- pick between our idle set and engaged set, depending on
-- whether we're currently engaged with a mob.
function choose_set()
    if player.status == 'Engaged' then
		windower.add_to_chat(8,'[Engaged Mode Active]')
        equip_engaged()
		-- Extra Attack, Fenrir's Earring
		if world.time <= 1080 and world.time >= 360 then
			windower.add_to_chat(8,"[Engaged - Daylight Bonus]")
			equip({right_ear="Fenrir's Earring"})
		end
        if (buffactive['footwork']) then
            equip(sets.footwork)
        end
    elseif (buffactive['counterstance']) then
            equip(sets.counter)
    elseif player.status == 'Resting' then
		equip_rest()
	else
        equip_idle()	
    end
 end
 
 --[[ ******************************************************
  Casting functions - these functions run automatically when
 we cast a spell, use a job ability, rest for MP, and so on
****************************************************** --]]
 
 -- the precast function runs automatically BEFORE we
 -- begin casting a spell or job ability.
 function precast(spell, spellMap, action)
    if spell.type == 'WeaponSkill' then
        equip_ws(spell)
    elseif spell.name == 'Boost' then
        equip({hands="Temple Gloves"})
    elseif spell.name == 'Focus' then
        equip({head="Temple Crown"})
    elseif spell.name == 'Chakra' then
        windower.add_to_chat(8,'[Chakra]')
        if world.day_element == 'Darksday' then
            windower.add_to_chat(8,'[Chakra on Darksday - +Shadow Mantle]')
            equip(sets.chakra,{back="Shadow Mantle"})
        else
            equip(sets.chakra)
        end
	elseif spell.name == 'Chi Blast' then
        windower.add_to_chat(8,'[Chi Blast]')    
		equip(sets.engaged,sets.chiblast)
    elseif spell.type:contains('Magic') or spell.type == 'Ninjutsu' then
        equip(sets.fc)
    else
        choose_set()
    end
 end
 
 -- most of our abilities are either insta-cast or require
 -- gearswaps at the start, so we don't do much mid-cast.
 function midcast(spell)
    if spell.name == 'Utsusemi: Ni' or spell.name == 'Utsusemi: Ichi' then
        windower.add_to_chat(8,'[Utsusemi]')
        equip(sets.utsu)
    elseif spell.name == 'Chakra' then
        windower.add_to_chat(8,'[Chakra]')
        if world.day == 'Darksday' then
            windower.add_to_chat(8,'[Darksday - Shadow Mantle]')
            equip(sets.chakra,{back="Shadow Mantle"})
        else
            equip(sets.chakra)
        end
	elseif spell.name == 'Chi Blast' then
        windower.add_to_chat(8,'[Chi Blast]')    
		equip(sets.engaged,sets.chiblast)
    else
        choose_set()
    end
 end
 
 -- when we're done with our spell or ability, return to either
 -- our idle or engaged gear.
 function aftercast(spell)
     choose_set()
end

-- swap into hMP gear when we /heal, and return to idle gear
-- when we stand up.
function status_change(new,old)
    if new == 'Resting' then
        equip_rest()
    else
        choose_set()
    end
 end
 
function buff_change(new,old)
    if buffactive['Silence'] then
        send_command('@ input /item "Echo Drops" <me>')
        windower.add_to_chat(256,'[Silence Removed!]')
    elseif buffactive['Curse'] then
        send_command('@ input /item "Holy Water" <me>')
        windower.add_to_chat(201,'[Curse Removed!]')
    elseif buffactive['Doom'] then
        send_command('@ input /item "Hallowed Water" <me>')
        windower.add_to_chat(002,'[Doom Removed!]')
    elseif buffactive['Blindness'] then
        send_command('@ input /item "Remedy" <me>')
        windower.add_to_chat(160,'[Blindness Removed!]')
    elseif buffactive['Poison'] then
        send_command('@ input /item "Antidote" <me>')
        windower.add_to_chat(259,'[Poison Removed!]')
	elseif buffactive['Paralyzed'] then
		send_command('@ input /item "Remedy" <me>')
		windower.add_to_chat(259,'[Paralysis Removed!]')
    end
	-- footwork gone > do another choose_set
	if buffactive['Footwork'] then
		footwork = true
		choose_set()
    else
        footwork = false
        choose_set()
	end
end
 
function self_command(m)
if m == "EVA" then
        if ev == false then
            ev = true
            windower.add_to_chat(8,'[Evasion during combat: ON]')
            choose_set()
        else
            ev = false
            windower.add_to_chat(8,'[Evasion during combat: OFF]')
            choose_set()
        end
	elseif m == "acc" then
        if acc == false then
            acc = true
            windower.add_to_chat(8,'[Accuracy: ON]')
            choose_set()
        else
            acc = false
            windower.add_to_chat(8,'[Accuracy: OFF]')
            choose_set()
        end
    end
end

 
 --[[ ******************************************************
  Code that runs once, when we first swap to MNK job
****************************************************** --]]
 
-- ev determines whether we should wear our evasion gear in combat
    ev          =   false

-- acc determines whether we should wear our Accuracy gear in combat
    acc         =   false
    
-- footwork determines whether or not footwork is active in combat

    footwork    =   false

 -- Puts on our fashion set, lockstyle it, then switch
 -- to our idle set.
    send_command('wait 1;gs equip fashion;wait 1;input /lockstyle on;wait 1;gs equip idle')
    send_command('input /macro book 2; wait 0.1; input /macro set 1')
    windower.add_to_chat(8,'[Evasion Mode: Deactivated]')
    windower.add_to_chat(8,'[Accuracy Mode: Deactivated]')
    windower.add_to_chat(8,'[Footwork: Deactivated]')
	send_command('input //dp height')
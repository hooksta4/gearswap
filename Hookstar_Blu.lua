--[[*********************************************
Tristamgreen BLU v2 - 2021
********************************************* --]]
 
 -- Update Notes
 -- Sep 25 2020 - entirely rewritten from scratch
 -- Sep 28 2020 - all modes (mage, melee, dual wield, mdef) established
 -- Sep 29 2020 - all blue magic handlers established
 -- Sep 30 2020 - all white mage sub job functionality established
 -- May 29 2021 - better handling on blue magic enhancing. breath set reworked.
 -- May 30 2021 - realigned all ammo and ranged options, set ammo to bibiki+disable for tank mode
 -- Jun 02 2021 - set weapons to disable (main,sub,ranged,ammo) when in MELEE or TANK.
 -- 			  weapons will re-enable when swapped to MAGE.
 -- Jun 07 2021 - realigned physical magic set and created "undefined" blue mage set for outlier spells
 -- Jul 02 2021 - set up self_commands to help pre-select azure set for certain subjobs
 -- Jul 08 2021 - refine the initial gear loads via subjob
 
 --[[ **********
  Gearsets 
************ --]]
 
 function get_sets()
 
    -- lockstyle set 
    sets.lockstyle = {
        head        = "Mirage Keffiyeh +1",
        body        = "Ebon Frock",
        hands       = "Denali Wristbands",
        legs        = "Mirage Shalwar +1",
        feet        = "Mirage Charuqs +1"
    }
 
    -- idle sets 
	
	-- Generic Idle
    -- prioritize Regen and Refresh with Evasion
	sets.idle		= {
	    -- ammo		= "Fenrir's Stone",
		ranged		= "Aureole",
		head		= "Blood Mask",
		body		= "Mirage Jubbah +1",
		hands		= "Denali Wristbands",
		legs		= "Blood Cuisses",
		feet		= "Magus Charuqs",
		neck		= "Orochi Nodowa +1",
		waist		= "Resolute Belt",
		left_ear	= "Novia Earring",
		right_ear	= "Ethereal Earring",
		left_ring	= "Shadow Ring",
		right_ring	= "Patronus Ring",
		back		= "Boxer's Mantle"
	}
	
	-- terra's staff for damage mitigation
	sets.terra		= {
		main		= "Terra's Staff",
		sub			= "Magic Strap"
	}
    
    -- combat sets
    
    -- engaged set prioritizes haste and accuracy, engaged function assumes Sea Torques over PCA
	sets.engaged 	= {
		-- ammo		= "White Tathlum",
		head		= "Walahra Turban",
		body		= "Homam Corazza",
		hands		= "Homam Manopolas",
		legs		= "Homam Cosciales",
		feet		= "Homam Gambieras",
		neck		= "Peacock Amulet",
		waist		= "Velocious Belt",
		left_ear	= "Brutal Earring",
		right_ear	= "Ethereal Earring",
		right_ring	= "Toreador's Ring",
		left_ring	= "Toreador's Ring",
		back		= "Cuchulain's Mantle"
	}
	
	-- max evasion set, toggled by macro /console gs c eva
    sets.evasion 	= {
        -- ammo        = "Fenrir's Stone",
        head        = "Wivre Mask +1",
        neck        = "Evasion Torque",
        left_ear    = "Triton Earring",
        right_ear   = "Triton Earring",
        body        = "Scp. Harness +1",
        hands       = "Denali Wristbands",
        left_ring   = "Wivre Ring +1",
        right_ring  = "Wivre Ring +1",
        back        = "Boxer's Mantle",
        waist       = "Scouter's Rope",
        legs        = "Denali Kecks",
        feet        = "Magus Charuqs"
    }
	
	-- Tank Set - Maximize Defense, Enmity
    -- toggled by macro /console gs c tank
	sets.tank       = {
		ammo		= "Bibiki Seashell",
		head		= "Denali Bonnet",
		body		= "Blood Scale Mail",
		hands		= "Denali Wristbands",
		legs		= "Enkidu's Subligar",
		feet		= "Homam Gambieras",
		neck		= "Harmonia's Torque",
		waist		= "Trance Belt",
		left_ear	= "Brutal Earring",
		right_ear	= "Ethereal Earring",
		left_ring	= "Shadow Ring",
		right_ring	= "Patronus Ring",
		back		= "Shadow Mantle"
	}
    
    -- magic defense set
    -- toggled via macro /console gs c defmode
    
    sets.mdef       = {
        left_ear    = "Merman's Earring",
        right_ear   = "Merman's Earring",
        left_ring   = "Merman's Ring",
        right_ring  = "Merman's Ring"
    }
	
	sets.HPMP 	    = {
        main		= "Imperial Wand",
		sub			= "Legion Scutum",
		-- ammo		= "White Tathlum",
		head		= "Mirror Tiara",
		body		= "Mahatma Hpl.",
		hands		= "Genie Gages",
		legs		= "Blood Cuisses",
		feet		= "Numerist Pumps",
		neck		= "Grandiose Chain",
		waist		= "Qiqirn Sash +1",
		left_ear	= "Relaxing Earring",
		right_ear	= "Antivenom Earring",
		left_ring	= "Celestial Ring",
		right_ring	= "Celestial Ring",
		back		= "Invigorating Cape"
    }
	
    -- specific weapon sets.  toggled via macro
    -- "Mode Switch" macro is /console gs c mode
    
	--Dual-Wield Set
	sets.dualwield	= {
		main		= "Excalibur",
		sub			= "Perdu Hanger"
	}

	--Learn Set
	sets.learn	= {
		hands		= "Magus Bazubands",
	}    
    sets.shield     = {
        main        = "Excalibur",
        sub         = "Genbu's Shield"
    }
	
	--staff set
	sets.staff		= {
		main		= "Chatoyant Staff",
	}
	
	-- Daylight Regen set
	sets.dayregen	= {
		hands		= "Feronia's Bangles",
		waist		= "Lycopodium Sash"
	}
	
     -- fast cast set 
    sets.fc         = {
		left_ear    = "Loquacious Earring",
        legs        = "Homam Cosciales"
    }
	
	-- Haste set
    -- used basically for Utsusemi only
	sets.haste		= {
		head		= "Walahra Turban",
		neck		= "Tiercel Necklace",
		hands		= "Homam Manopolas",
		feet		= "Homam Gambieras",
        legs        = "Homam Cosciales",
        body        = "Nashira Manteel",
		waist		= "Velocious Belt"
	}
    
        -- *** Enhancing and Healing Sets ***
    
    -- Healing Magic Potency set
    sets.healing	= {
		-- ammo		= "Jasper Tathlum",
		head		= "Denali Bonnet",
		body		= "Blood Scale Mail",
		hands		= "Mirage Bazubands +1",
		legs		= "Mahatma Slops",
		feet		= "Denali Gamashes",
		neck		= "Gnole Torque",
		waist		= "Pythia Sash +1",
		left_ear	= "Celestial Earring",
		right_ear	= "Celestial Earring",
		left_ring	= "Celestial Ring",
		right_ring	= "Celestial Ring",
		back		= "Dew Silk Cape +1"
    }
	-- *** SETS FOR OFFENSIVE SPELLS***
	
	-- STR set for physical spells
	sets.phys    	= {
	--	ranged		= "Aureole",
		head		= "Gnadbhod's Helm",
		body		= "Magus Jubbah +1",
		hands		= "Alkyoneus's Bracelets",
		legs		= "Enkidu's Subligar",
		feet		= "Denali Gamashes",
		neck		= "Ancient Torque",
		waist		= "Warwolf Belt",
		left_ear	= "Harmonius Earring",
		right_ear	= "Harmonius Earring",
		left_ring	= "Flame Ring",
		right_ring	= "Harmonius Ring",
		back		= "Cuchulain's Mantle"
	}
		
	-- int set for INT-based spells
	
	sets.int		= {
        ranged		= "Aureole",
		head		= "Ree's Headgear",
		body		= "Blood Scale Mail",
		hands		= "Mahatma Cuffs",
		legs		= "Denali Kecks",
		feet		= "Denali Gamashes",
		neck		= "Lemegeton Medallion +1",
		waist		= "Penitent's Rope",
		left_ear	= "Incubus Earring +1",
		right_ear	= "Incubus Earring +1",
		left_ring	= "Galdr Ring",
		right_ring	= "Omn. Ring +1",
		back		= "Prism Cape"
	}
	
	-- mind set for MND-based spells
	sets.mnd		= {
		ranged		= "Aureole",
		head		= "Ree's Headgear",
		body		= "Blood Scale Mail",
		hands		= "Mirage Bazubands +1",
		legs		= "Mahatma Slops",
		feet		= "Denali Gamashes",
		neck		= "Gnole Torque",
		waist		= "Pythia Sash +1",
		left_ear	= "Novio Earring",
		right_ear	= "Moldavite Earring",
		left_ring	= "Celestial Ring",
		right_ring	= "Celestial Ring",
		back		= "Hecate's Cape"
	}
	
	-- HP Set for Breaths
	-- 1617 HP @ lv75 without food
	
	sets.breath		= {
		ammo		= "Verthandi's Gem",
		head		= "Saurian Helm", 			-- (more HP, same breath % boost)
		body		= "Blood Scale Mail",
		hands		= "Creek M Mitts",
		legs		= "Homam Cosciales",
		feet		= "Homam Gambieras",
		neck		= "Bloodbead Gorget",
		waist		= "Steppe Sash",
		left_ear	= "Cassie Earring",
		right_ear	= "Harmonius Earring",
		left_ring	= "Bloodbead Ring",
		right_ring	= "Bomb Queen Ring",
		back		= "Gigant Mantle"
	}
    
    -- Set for Blue-based Enfeebling Magic (tanking)
    sets.enfeeblu   = {
		ranged		= "Aureole",
        head        = "Mirage Keffiyeh +1",
        body        = "Magus Jubbah +1",
        neck        = "Tiercel Necklace",
        left_ear    = "Incubus Earring +1",
        right_ear   = "Incubus Earring +1",
        left_ring   = "Antica Ring",
        right_ring  = "Celestial Ring",
        back        = "Hecate's Cape",
        waist       = "Velocious Belt",
        legs        = "Homam Cosciales",
        feet        = "Homam Gambieras"
    }
	
	-- basic catch-all Blue Magic skill set
	sets.bluemagic	= {
		head		= "Mirage Keffiyeh +1",
		body		= "Magus Jubbah +1",
		ring1		= "Antica Ring"
	}
	
    -- prioritize skill, macc, and mind for Enfeebling Magic (while subbing WHM)
    
    sets.enfeebling =   {
        head        = "Walahra Turban",
        body        = "Nashira Manteel",
        neck        = "Enfeebling Torque",
        left_ear    = "Lycopodium Earring",
        right_ear   = "Enfeebling Earring",
        left_ring   = "Celestial Ring",
        right_ring  = "Celestial Ring",
        back        = "Altruistic Cape",
        waist       = "Velocious Belt",
        legs        = "Denali Kecks",
        feet        = "Homam Gambieras"
    }
    
    -- prioritize skill and haste for Enhancing Magic (while subbing WHM)
    
    sets.enhancing  = {
        head        = "Walahra Turban",
        body        = "Nashira Manteel",
        neck        = "Enhancing Torque",
        left_ear    = "Celestial Earring",
        right_ear   = "Augmenting Earring",
        left_ring   = "Celestial Ring",
        right_ring  = "Celestial Ring",
        back        = "Merciful Cape",
        waist       = "Velocious Belt",
        legs        = "Mahatma Slops",
        feet        = "Homam Gambieras"
    }
	
	sets.enhancblu  = set_combine(
		sets.enhancing,
	{
        head        = "Mirage Keffiyeh +1",
        body        = "Magus Jubbah +1",
        left_ring   = "Antica Ring"
    })
    
    -- stack MND for Stoneskin potency
    
    sets.enhancing.stoneskin    = {
        head        = "Maat's Cap",
        body        = "Blood Scale Mail",
        neck        = "Stone Gorget",
		hands		= "Stone Mufflers",
        left_ear    = "Celestial Earring",
        right_ear   = "Celestial Earring",
        left_ring   = "Celestial Ring",
        right_ring  = "Celestial Ring",
        back        = "Dew Silk Cape +1",
        waist       = "Pythia Sash +1",
        legs        = "Mahatma Slops",
        feet        = "Denali Gamashes"
    }     
        
    -- *** WEAPON SKILL SETS FOR SWORDS ***
    
    sets.ws         = {}
    
    sets.ws.knights = {
        -- ammo        = "White Tathlum",
        head        = "Maat's Cap",
        neck        = "Fotia Gorget",
        body        = "Homam Corazza",
        hands       = "Denali Wristbands",
        legs        = "Mirage Shalwar +1",
        feet        = "Rutter Sabatons",
        back        = "Cerberus Mantle +1",
        left_ear    = "Brutal Earring",
        right_ear   = "Harmonius Earring",
        left_ring   = "Rajas Ring",
        right_ring  = "Toreador's Ring",
        waist       = "Virtuoso Belt"
    }
    
    sets.ws.vorpal  =  {
        -- ammo        = "White Tathlum",
        head        = "Gnadbhod's Helm",
        neck        = "Fotia Gorget",    
        body        = "Enkidu's Harness",
        hands       = "Alkyoneus's Bracelets",
        legs        = "Mirage Shalwar +1",
        feet        = "Rutter Sabatons",
        back        = "Cerberus Mantle +1",
        left_ear    = "Brutal Earring",
        right_ear   = "Harmonius Earring",
        left_ring   = "Rajas Ring",
        right_ring  = "Harmonius Ring",
        waist       = "Warwolf Belt"
    }
    
	end
	
--[[ ******************************************************
  Equip functions - put on the sets we defined above, and
 echo a note to our chat log so we know it worked.
****************************************************** --]]
 
 -- equip our idle set
 function equip_idle()
    equip(sets.idle)
    windower.add_to_chat(8,'[Blue Mage - Idle]')
    if world.time <= 1080 and world.time >= 360 then 
		windower.add_to_chat(8,'[Daylight Bonus Regen]')
		equip(sets.idle,sets.dayregen)
    end
    if mode == "mage" then
        equip(sets.terra)
    end
    if defmode == "magical" then
        equip(sets.mdef)
    end
end

-- equip our engaged set
function equip_engaged()
    windower.add_to_chat(8,'[Engaged]')
    equip(sets.engaged)
    if ev == true then  
        windower.add_to_chat(8,'[Max Evasion]')
        equip(sets.engaged,sets.evasion)
    elseif mode == "melee" then
        if tank == true then
            equip(sets.tank,sets.shield,{neck="Fortitude Torque"})
        else
            if player.sub_job == "NIN" or player.sub_job == "DNC" then
                equip(sets.dualwield,{neck="Fortitude Torque"})
            else
                equip(sets.shield,{neck="Fortitude Torque"})
            end
        end
        if world.time <= 1080 and world.time >= 360 then
			windower.add_to_chat(8,"[Engaged - Daylight Bonus]")
			equip({right_ear="Fenrir's Earring"})
		end
    end
    if defmode == "magical" then
        equip(sets.mdef)
    end
end

-- equip appropriate Weapon Skill set

function equip_ws(name)
	if name == "Knights of Round" or name == "Savage Blade" then
		equip(sets.ws.knights)
	elseif name == "Vorpal Blade" then
		equip(sets.ws.vorpal)
	end
    if world.time <= 1080 and world.time >= 360 then
			windower.add_to_chat(8,"[Engaged - Daylight Bonus]")
			equip({left_ear="Fenrir's Earring"})
    end
end
 -- equip our hMP set when resting
 function equip_rest()
     windower.add_to_chat(8,'[Resting]')
    equip(sets.HPMP)
end

-- pick between our idle set and engaged set, depending on
-- whether we're currently engaged with a mob.
function choose_set()
    if mode == "mage" then
		enable('ammo','ranged','main','sub')
        equip(sets.terra)
    elseif mode == "melee" then
        if tank == true then
			enable('ammo','ranged','main','sub')
            equip(sets.tank,sets.shield)
			disable('ammo','ranged','main','sub')
        else
			enable('ammo','ranged','main','sub')
            if player.sub_job == "NIN" or player.sub_job == "DNC" then
                windower.add_to_chat(8,'[Dual Wield Selected]')
                equip(sets.dualwield)
            else
                windower.add_to_chat(8,'[Sword + Shield Selected]')
                equip(sets.shield)
            end
				disable('ammo','ranged','main','sub')
        end
    end
    if player.status == "Engaged" then
        equip_engaged()
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
 function precast(spell)
 if spell.action_type == 'Magic' then
	
		-- Cancel magic when it is not up yet
		local spell_recasts = windower.ffxi.get_spell_recasts()
		if spell_recasts[spell.recast_id] > 60 then -- 1s margin
			add_to_chat(167,spell.english .. ' is still on cooldown!')
			cancel_spell()
		else

			-- Fast cast for all spells	
			equip(sets.fc)	
            if mode == "mage" then
                equip({sub="Vivid Strap +1"})
            end
		
			-- Cancel status effects for spells that don't overwrite themselves
			if spell.name == "Sneak" then send_command("cancel sneak") end
			if spell.name == "Stoneskin" then send_command("wait 4;cancel stoneskin") end
			if spell.name == "Reraise" then send_command("cancel reraise") end
			if spell.name == "Blink" then send_command("wait 4;cancel blink") end
			if spell.name == "Aquaveil" then send_command("wait 4;cancel aquaveil") end
		end		
    end
	-- Abilities	
	if spell.type == 'WeaponSkill' then
        equip_ws(spell)        
    end
end
 
-- Midcast is for all Blue Magic Spells and other spells.
 function midcast(spell)
    if spell.skill == "Blue Magic" then
        local blutype = get_magic_type(spell)
        if blutype == 'physBlu' then
            equip(sets.phys)
            if mode == 'mage' then
                equip(sets.staff,{sub="Wise Strap"})
            end
        elseif blutype == 'intBlu' then
            equip(sets.int)
            if mode == 'mage' then
                equip(sets.staff,{sub="Wise Strap"})
            end
        elseif blutype == 'mndBlu' then
            equip(sets.mnd)
            if mode == 'mage' then
                equip(sets.staff,{sub="Reign Grip"})
            end
        elseif blutype == 'breathBlu' then
            equip(sets.breath)
            if mode == 'mage' then
                equip(sets.staff,{sub="Raptor Strap +1"})
            end
        elseif blutype == 'healBlu' then
            equip(sets.healing)
            if mode == 'mage' then
                equip(sets.staff,{sub="Reign Grip"})
            end
        elseif blutype == 'enfBlu' then
            equip(sets.enfeeblu)
            if mode == 'mage' then
                equip(sets.staff,{sub="Reign Grip"})
            end
        elseif blutype == 'enhBlu' then
            equip(sets.enhancblu)
            if mode == 'mage' then
                equip(sets.staff,{sub="Vivid Strap +1"})
            end
        end
    end
    if spell.skill == 'Enhancing Magic' then
        windower.add_to_chat(8,'[Enhancing Magic - ' .. spell.english .. ']')
        equip(sets.enhancing)
        if mode == 'mage' then
            equip(sets.staff,{sub="Reign Grip"})
        end
        if spell.name == 'Stoneskin' then
            equip(sets.enhancing.stoneskin)
        end
    end
    if spell.skill == 'Enfeebling Magic' then
        windower.add_to_chat(8,'[Enf. Magic - ' .. spell.english .. ']')
        equip(sets.enfeebling)
        if mode == 'mage' then
            equip(sets.staff,{sub="Reign Grip"})
        end
    end
    if spell.name:contains('Utsusemi') then
        windower.add_to_chat(8,'[Utsusemi]')
        equip(sets.haste)
    end
 end
 
 -- when we're done with our spell or ability, return to either
 -- our idle or engaged gear.
 function aftercast(spell)
     choose_set()
end

-- Get Blue Magic type
function get_magic_type(spell)
	if spell.skill == 'Blue Magic' then
        if physBlueMagic:contains(spell.english)then
            windower.add_to_chat(8,'[Physical Blue Magic - ' .. spell.english .. ']')
            return 'physBlu'
		elseif intBlueMagic:contains(spell.english) then
            windower.add_to_chat(8,'[INT-based Blue Magic - ' .. spell.english .. ']')
			return 'intBlu'
		elseif mndBlueMagic:contains(spell.english) then
            windower.add_to_chat(8,'[MND-based Blue Magic - ' .. spell.english .. ']')
			return 'mndBlu'
		elseif chrBlueMagic:contains(spell.english) then
            windower.add_to_chat(8,'[CHR-based Blue Magic - ' .. spell.english .. ']')
            return 'chrBlu'
        elseif brBlueMagic:contains(spell.english) then
            windower.add_to_chat(8,'[Blue Magic Breath - ' .. spell.english .. ']')
            return 'breathBlu'
        elseif healBlueMagic:contains(spell.english) then
            windower.add_to_chat(8,'[Healing Blue Magic - ' .. spell.english .. ']')
            return 'healBlu'
        elseif enfBlueMagic:contains(spell.english) then
            windower.add_to_chat(8,'[Enfeebling Blue Magic - ' .. spell.english .. ']')
            return 'enfBlu'
        elseif enhBlueMagic:contains(spell.english) then
            windower.add_to_chat(8,'[Enhancing Blue Magic - ' .. spell.english .. ']')
            return 'enhBlu'
		else
			windower.add_to_chat(8,'[Undefined Blue Magic - ' .. spell.english .. ']')
			equip(sets.bluemagic)
        end
	end
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
end

function setup_job()
    physBlueMagic = S{
        'Foot Kick','Wild Oats','Power Attack','Sprout Smack','Battle Dance','Head Butt','Helldive','Bludgeon',
        'Claw Cyclone','Screwdriver','Grand Slam','Smite of Rage','Jet Stream','Uppercut','Terror Touch','Mandibular Bite',
        'Sickle Slash','Death Scissors','Dimensional Death','Body Slam','Frypan','Frenetic Rip','Hydro Shot','Spinal Cleave',
        'Hysteric Barrage','Tail Slap','Cannonball','Disseverment','Ram Charge','Vertical Cleave'}
		
	intBlueMagic = S{
		'Sandspin','Blastbomb','Cursed Sphere','Bomb Toss','Death Ray','Blitzstrahl','Ice Break','Maelstrom','Firespit'}
        
    mndBlueMagic = S{
        'Mind Blast','Magic Hammer'}
    
    chrBlueMagic = S{
        'Mysterious Light','Eyes on Me'}
        
    brBlueMagic = S{
        'Poison Breath','Magnetite Cloud','Hecatomb Wave','Radiant Breath','Flying Hip Press','Bad Breath','Frost Breath','Heat Breath'}
        
    enhBlueMagic = S{
        'Metallic Body','Cocoon','Refueling','Feather Barrier','Memento Mori','Voracious Trunk','Diamondhide','Warm-Up','Triumphant Roar',
        'Amplification','Saline Coat','Reactor Cool','Plasma Charge'}
        
    healBlueMagic = S{
        'Pollen','Healing Breeze','Wild Carrot','Magic Fruit'}
        
    enfBlueMagic = S{
        'Sheep Song','Soporific','Sound Blast','Chaotic Eye','Blank Gaze','Venom Shell','Stinking Gas','Geist Wall',
        'Awful Eye,','Jettatura','Frightful Roar','Cold Wave','Filamented Hold','Light of Penance','Yawn','Feather Tickle',
        'Infrasonics','Sandspray','Enervation','Lowing','Temporal Shift','Actinic Burst'}       
    
end
	
function self_command(m)
    if m == "W+" then
        if ws == "Knights of Round" then
			ws = "Vorpal Blade"
        else
			ws = "Knights of Round"
        end
        windower.add_to_chat(8,'[Current WS: ' .. ws .. ']')
    elseif m == "WS" then
        send_command('input /ws "' .. ws .. '" <t>')
    elseif m == "EVA" then
        if ev == false then
            ev = true
            windower.add_to_chat(8,'[Evasion during combat: ON]')
            choose_set()
        else
            ev = false
            windower.add_to_chat(8,'[Evasion during combat: OFF]')
            choose_set()
        end
    elseif m == "mode" then
        if mode == "mage" then
            windower.add_to_chat(8,'[Combat mode: MELEE]')
            mode = "melee"
            choose_set()
        else
            windower.add_to_chat(8,'[Combat mode: MAGE]')
            mode = "mage"
            choose_set()
        end
    elseif m == "tank" then
        if mode == "melee" then
            if tank == false then
                windower.add_to_chat(8,'[Tank mode: ACTIVE]')
                tank = true
                choose_set()
            else
                windower.add_to_chat(8,'[Tank mode: DEACTIVATED]')
                tank = false
                choose_set()
				enable('ammo')
            end
        else
            windower.add_to_chat(8,'[Cannot activate Tank Mode when in Mage Mode.]')
        end
    elseif m == "defmode" then
        if defmode == "normal" then
            windower.add_to_chat(8,'[Defense Mode: MDT]')
            defmode = "magical"
            choose_set()
        else
            windower.add_to_chat(8,'[Defense Mode: Normal]')
            defmode = "normal"
            choose_set()
        end
    end
 end
	
--[[ ******************************************************
  Code that runs once, when we first swap to Blue Mage
****************************************************** --]]
 
-- mode decides if we are melee or mage mode
-- mode = "melee"
 
-- ev determines whether we should wear our evasion gear in combat
ev = false

-- tank determines if we should go tank mode or dual-wield in melee combat
tank = false

-- defmode outlins defensive mode while tank mode is active.
defmode = "normal"
 
-- ws determines which weapon skill we'll use.  Mercy Stroke by default.
ws = "Knights of Round"

-- Runs the job setup function to populate list of spells 
setup_job()
 
 -- Send default text commands to Windower

 --Set Macro Book
 send_command('input /macro book 10; wait 0.1; input /macro set 1')
 -- Set up Style Lock, equip Idle set, and equip Terra's Staff for idle Damage Mitigation
 send_command('wait 1; input /lockstyleset 6; wait 1; gs equip idle')
 send_command('input //dp magic; wait 1; input //dp height')
 
 -- below commands set azureset based entirely on subjob selection
 send_command('wait 2; input //asets removeall')
    if player.sub_job == "NIN" or player.sub_job == "THF" or player.sub_job == "MNK" then
		send_command('wait 2; input //asets spellset physical')
		mode = "melee"
		if player.sub_job == "NIN" then
			send_command('gs equip dualwield')
				else
			send_command('gs equip tank')
			tank = true
		end
	else
		send_command('wait 2; input //asets spellset mindblast; gs equip terra')
		mode = "mage"
	end
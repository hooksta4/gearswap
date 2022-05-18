--[[ *************************************************************
	TG's DRK lua - 2018
    rebuilt 2020
************************************************************* --]]
 
 --[[ ******************************************************
  Gearsets - define the various sets of gear we'll wear.
****************************************************** --]]
 
 function get_sets()
  
    -- idle set is worn when we're standing around doing
    -- nothing.  we want auto-refresh, auto-regen, movement speed, some evasion
	
    sets.idle = {
        ammo		= "Phantom Tathlum",
        neck        = "Orochi Nodowa +1",
        left_ear    = "Novia Earring",
        right_ear   = "Merman's Earring",
		head		= "Blood Mask",
        body        = "Plastron +1",
        hands       = "Coral Finger Gauntlets +1", --make
        left_ring   = "Shadow Ring",
        right_ring  = "Patronus Ring",
        back        = "Boxer's Mantle",
        waist       = "Resolute Belt",
        legs        = "Blood Cuisses",
        feet        = "Askar Gambieras"
    }
	
	-- daylight idle set with lycopodium sash and feronia's bangles for super regen
	
	sets.dayidle = {
		waist		= "Lycopodium Sash",
		hands		= "Feronia's Bangles"
	}
	 
     sets.weapons   = {
        main        = "Apocalypse",
        sub         = "Pole Grip"
    }
     
    -- we throw on our engaged set when we engage a mob
    -- stacks a balance of haste and attack
    sets.engaged = {}

    --sets.engaged.fivehit = {
--      sub         = "Rose Strap",
--	    ammo		= "White Tathlum",
--      head        = "Nocturnus Helm",
--      neck        = "Chivalrous Chain",
--      body        = "Aurum Cuirass",
--      hands		= "Homam Manopolas",
--      back        = "Abyss Mantle",
--      legs        = "Homam Cosciales",
--      waist		= "Ninurta's Sash",
--      feet		= "Homam Gambieras",
--      ring1		= "Rajas Ring",
--      ring2		= "Blitz Ring",
--      ear1		= "Brutal Earring",
--      ear2		= "Abyssal Earring"
--  }
    
    sets.engaged.haste = {
        sub         = "Pole Grip",
		ammo		= "Bomb Core",
        head        = "Walahra Turban",
        neck        = "Ancient Torque",
        body        = "Askar Korazin",
		hands		= "Homam Manopolas",
        back        = "Cerberus Mantle +1",
        legs        = "Homam Cosciales",
		waist	    = "velocious belt",
		feet		= "Homam Gambieras",
		ring1	    = "Toreador's Ring",
		ring2	    = "Rajas Ring",
		ear1	    = "Brutal Earring",
		ear2	    = "Ethereal Earring"
    }
    
    sets.evasion = {
        ammo        = "Fenrir's Stone",
        head        = "Optical Hat",
        neck        = "Evasion Torque",
        body        = "Scorpion Harness +1",
        hands       = "Homam Manopolas",
        back        = "Boxer's Mantle",
        legs        = "Chaos Flanchard",
        feet        = "Askar Gambieras",
        ring1       = "Wivre Ring +1",
        ring2       = "Wivre Ring +1",
        ear1        = "Novia Earring",
        ear2        = "Triton Earring"
    }
     
    -- if its latent is procced, we'd rather wear the
    -- parade gorget than the others
	
    sets.parade = {
        neck        = "Parade Gorget"
    }
  
     -- our resting set is for hMP.
    sets.rest = {
        neck        = "Gnole Torque",
        left_ear    = "Rapture Earring",
        right_ear   = "Antivenom Earring",
        hands       = "Genie Gages",
        left_ring   = "Celestial Ring",
        right_ring  = "Celestial Ring",
        waist       = "Qiqirn Sash +1",
		feet		= "Askar Gambieras",
		back		= "Shadow Mantle"
    }
 
     -- stacking strength for Guillotine
	 
    sets.guillotine = {
        ammo        = "Bomb Core",
        head        = "Nocturnus Helm",
        neck        = "Fotia Gorget",
        left_ear    = "Brutal Earring",
        right_ear   = "Harmonius Earring",
        body        = "Armada Hauberk",
        hands       = "Hct. Mittens +1",
        left_ring   = "Harmonius Ring",
        right_ring  = "Rajas Ring",
        back        = "Abyss Cape",
        waist       = "Warwolf Belt",
        legs        = "Aurum Cuisses",
        feet        = "Hct. Leggings +1"
    }
     
	-- stacking more str for other WSs (Cata, Insurgency)
	 
    sets.str = {
        ammo        = "Bomb Core",
        head        = "Nocturnus Helm",
        neck        = "Fotia Gorget",
        left_ear    = "Brutal Earring",
        right_ear   = "Harmonius Earring",
        body        = "Armada Hauberk",
        hands       = "Alkyoneus's Bracelets",
        left_ring   = "Harmonius Ring",
        right_ring  = "Rajas Ring",
        back        = "Cerberus Mantle",
        waist       = "Warwolf Belt",
        legs        = "Aurum Cuisses",
        feet        = "Hct. Leggings +1"
    }
     -- weapon bash set
	 
    sets.bash = {
        hands       = "Chaos Gauntlets",
    }
 
     -- stun set prioritizes haste over dark magic skill
    sets.stun={
		ammo		= "Phantom Tathlum",
		head		= "Walahra Turban",
		body		= "Corselet +1",
		hands		= "Blood Fng. Gnt.",
		legs		= "Abyss Flanchard +1",
		feet		= "Homam Gambieras",
		neck		= "Dark Torque",
		waist		= "velocious belt",
		left_ear	= "Omn. Earring +1",
		right_ear	= "Dark Earring",
		left_ring	= "Blitz Ring",
		right_ring	= "Omn. Ring +1",
		back		= "Abyss Cape",
}

	-- dark magic set maximizes dark magic skill and MAB for Bio
	
	sets.dark={
		ammo		= "Phantom Tathlum",
		head		= "Chaos Burgeonet",
		body		= "Corselet +1",
		hands		= "Abyss Gauntlets +1",
		legs		= "Abyss Flanchard +1",
		feet		= "Shrewd Pumps",
		neck		= "Dark Torque",
		waist		= "Crimson Belt",
		left_ear	= "Dark Earring",
		right_ear	= "Omn. Earring +1",
		left_ring	= "Galdr Ring",
		right_ring	= "Omega Ring",
		back		= "Merciful Cape"
	}
	
	
	-- drain and aspir set maximize dark magic skill with a little haste thrown in
	
	sets.drain={
		ammo		= "Fire Bomblet",
		head		= "Chaos Burgeonet",
		body 		= "Dmn. Harness +1",
		hands		= "Abyss Gauntlets +1",
		legs		= "Abyss Flanchard +1",
		feet		= "Homam Gambieras",
		neck		= "Dark Torque",
		waist		= "Crimson Belt",
		left_ear	= "Abyssal Earring",
		right_ear	= "Dark Earring",
		left_ring	= "Galdr Ring",
		right_ring	= "Omega Ring",
		back		= "Merciful Cape",
	}
	
	-- absorb set maximizes duration for absorb-style spells by maxing dark skill and using
	-- onyx set + vicious mufflers
	
	sets.absorb={
		head		= "Onyx Sallet",
		body		= "Plastron +1",
		hands   	= "Vicious Mufflers",
		legs		= "Onyx Cuisses",
		feet		= "Onyx Sollerets",
		neck		= "Dark Torque",
		waist		= "velocious belt",
		left_ear	= "Abyssal Earring",
		right_ear	= "Dark Earring",
		left_ring	= "Galdr Ring",
		right_ring	= "Omega Ring",
		back		= "Abyss Cape",
}

	-- equip Chaos Burgeonet for Souleater maximizing
	
	sets.souleater = {
		head		= "Chaos Burgeonet",
	}
	
	-- equip Abyss Sollerets +1 for Last Resort
	
	sets.lastresort = {
		feet		= "Abyss Sollerets +1",
	}
     
     -- for utsusemi, maximize haste.
    sets.utsu = {
        neck        = "",
        left_ear    = "Ninjutsu Earring",
		back		= "Astute Cape",
    }
 
    sets.fc = {
        head        =   "Walahra Turban",
        right_ear   =   "Loquac. Earring",
        feet        =   "Homam Gambieras",
        hands       =   "Dusk Gloves +1",
        right_ring  =   "Blitz Ring"
    }
 
 end
 
 --[[ ******************************************************
  Equip functions - put on the sets we defined above, and
 echo a note to our chat log so we know it worked.
****************************************************** --]]
 
 -- equip our idle set for standing around
 function equip_idle()
     windower.add_to_chat(8,'[Idle]')
     equip(sets.idle)
    if weapontype == "scythe" then
         equip({main="Apocalypse",sub="Pole Grip"})
    else 
        equip({main="Ragnarok",sub="Pole Grip"})
    end
    if world.time <= 1080 and world.time >= 360 and player.hpp < 94 then
		windower.add_to_chat(8,"[Daylight Regen - HP at " .. player.hpp .. "%]")
		equip(sets.idle,sets.dayidle)
	end
    if player.hpp >= 85 and player.mpp <= 99 then
		windower.add_to_chat(8,"[Parade Gorget - MP at " .. player.mpp .. "%]")
        equip(sets.parade)
    end
end

-- equip our engaged set. If the parade gorget latent is
-- procced and we need mp, throw that on as well.
function equip_engaged()
    windower.add_to_chat(8,'[Engaged]')
    equip(sets.engaged.haste)
    if weapontype == "scythe" then
         equip(sets.engaged.haste,{neck="Ancient Torque"})
    else 
        equip(sets.engaged.haste,{neck="Ancient Torque"})
    end
    if world.time <= 1080 and world.time >= 360 then
			windower.add_to_chat(8,"[Engaged - Daylight Bonus]")
			equip({right_ear="Fenrir's Earring"})
    end
end

 
 -- equip our WS set
 function equip_ws(spell)
     windower.add_to_chat(8,'[Weapon Skill]')
    if spell.name == 'Guillotine' then
        equip(sets.guillotine)
    else
         equip(sets.str)
    end
end
 
 -- Dark Spell equip macros.
 function equip_dark(spell)
 equip(sets.dark)
    if spell.english:contains 'Absorb' then
        equip(sets.absorb)
    end
    if spell.element == world.day_element then
            equip({waist="Hachirin-no-Obi"})
            if spell.element == world.weather_element then
                equip({right_ring="Diabolos's Ring"})
                add_to_chat(8,'[Matching Day + Weather]')
            else
                add_to_chat(8,'[Matching Day]')
            end
        elseif spell.element == world.weather_element then  
            add_to_chat(8,'[Matching Weather]')
            equip({waist="Hachirin-no-Obi",right_ring="Diabolos's Ring"})
        end
        if spell.english:contains('Bio') then
            if player.mp - spell.mp_cost < 0.51*player.max_mp then
                windower.add_to_chat(8,'[Uggalepih Pendant boost]')
                equip({neck="Uggalepih Pendant"})
            end
        end
        if spell.english:contains 'Drain' or spell.english:contains 'Aspir' then
            equip(sets.drain)
            if player.status ~= "Engaged" and player.tp == 0 then
                if spell.element == world.weather_element then
                    windower.add_to_chat(8,"[Diabolos's Pole enhanced effect]")
                    equip({main="Diabolos's Pole"})
                end
            end
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
    if spell.type == 'WeaponSkill' then
        equip_ws(spell)
    elseif spell.name == 'Weapon Bash' then
        windower.add_to_chat(8,'[Weapon Bash]')
        equip(sets.engaged,sets.bash)
	elseif spell.name == 'Souleater' then
		equip(sets.engaged,sets.souleater)
	elseif spell.name == 'Last Resort' then
		equip(sets.engaged,sets.lastresort)
    elseif spell.action_type == 'Magic' then
        local spell_recasts = windower.ffxi.get_spell_recasts()
		if spell_recasts[spell.recast_id] > 60 then -- 1s margin
			add_to_chat(167,spell.english .. ' is still on cooldown!')
			cancel_spell()
		else
            equip(sets.fc)
        end
    end
    if player.tp == 0 then
        equip({sub="Vivid Strap +1"})
    end
 end
 
 -- most of our abilities are either insta-cast or require
 -- gearswaps at the start, so we don't do much mid-cast.
 function midcast(spell)
    if spell.name == 'Utsusemi: Ni' or spell.name == 'Utsusemi: Ichi' then
        windower.add_to_chat(8,'[Utsusemi]')
        equip(sets.fc)
    elseif spell.skill == 'Dark Magic' then
		windower.add_to_chat(8,'[Dark Magic]')
		equip_dark(spell)
    end
    if player.tp == 0 then
        equip({sub="Vivid Strap +1"})
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
end
 
 -- a set of self commands that dictate various job functions
 -- self commands are called via macro, through the syntax /console gs c (command name)
 -- eg., /command gs c W+ cycles through weaponskills to call on for our generic WS macro
 
 function self_command(m)
 
    -- W+ cycles weapon skill names.  If using a Scythe, it will cycle Guillotine and Catastrophe.
    -- If using a Great Sword it cycles Scourge and Ground Strike.
    
    if m == "W+" then
        if weapontype == "scythe" then
            if ws == "Guillotine" then
                ws = "Catastrophe"
            else ws = "Guillotine"
            end
        else
            if ws == "Ground Strike" then
                ws = "Scourge"
            else ws = "Ground Strike"
            end
        end
        windower.add_to_chat(8,'[Current WS: ' .. ws .. ']')
        
    -- initiates the weaponskill defined above.
    
    elseif m == "WS" then
        send_command('input /ws "' .. ws .. '" <t>')
        
    -- selects weapon being used and changes equipment accordingly.
    -- Available types are Scythe and Great Sword.
    
    elseif m == "weapontype" then
        if weapontype == "gsword" then
            weapontype = "scythe"
            ws = 'Guillotine'
            windower.add_to_chat(8,'[Weapon: Scythe]')
            windower.add_to_chat(8,'[Current WS: ' .. ws .. ']')
            equip({main="Perdu Sickle"})
            choose_set()
        else
            weapontype = "gsword"
            ws = 'Ground Strike'
            windower.add_to_chat(8,'[Weapon Type: Great Sword]')
            windower.add_to_chat(8,'[Current WS: ' .. ws .. ']')
            equip({main="Algol"})
            choose_set()
        end
        
    -- Dictates whether or not we want full evasion gear during combat.
    
     elseif m == "EVA" then
        if ev == false then
            ev = true
            windower.add_to_chat(8,'[Evasion while engaged: ON]')
            choose_set()
        else
            ev = false
            windower.add_to_chat(8,'[Evasion while engaged: OFF]')
            choose_set()
        end
     end
 end
 
 --[[ ******************************************************
  Code that runs once, when we first swap to Dark Knight
****************************************************** --]]

 -- weapontype variable determines which weapon we fight with and is defaulted to scythe.
 -- (note: only scythe and great sword are compensated for here, axes and kclubs are not)
 
 weapontype = "scythe"
 
 -- ev determines whether we should wear our evasion gear in combat
 
 ev = false

 -- ws determines which weapon skill we'll use. Guillotine by default.
 
 ws = "Guillotine"
 
 -- Puts on our fashion set, lockstyle it, then switch
 -- to our idle set.
 send_command('gs equip idle; wait 1; input /lockstyleset 24; wait 1; gs equip weapons')
 -- Set current macro book to book 8 and set 1
 send_command('input /macro book 4; wait 0.1; input /macro set 1')
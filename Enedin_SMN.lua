--[[

+---------------------------+
|----- ABOUT THIS FILE -----|
+---------------------------+

Started levelling SMN and wanted a Motes-free and basic SMN GS lua that does everything it needs.
Stopped working on this since I don't really like playing SMN too much.
Learned a lot about both SMN and Gearswap through this so I'm glad I did it.
Would still need to add custom timers to match the Kinematics SMN lua.
All sets have comments so you know what to put there.

CHANGELOG
- v1.8:		gearsets retooled by Tristamgreen allowing for more BIS offerings, Daylight Regen handles added in idle equip
- v1.7:		cleaned up code and comments for publication
- v1.6:		fixed bug where sets.precast.bp wasn't selected for BP:Wards of type <me> when no target was selected
- v1.5:		made distance checks work better in conjunction with auto-target determination
- v1.4:		added <stnpc>, <me> or <stpc> auto-target determination for Blood Pacts
- v1.3:		added distance checks for Blood Pacts and Assault to counter unwanted gear swaps (when not activating due to distance)
- v1.2: 	added respirit command: release spirit and recast same one again (which I use to try and get it to cast spells)
- v1.1: 	added /p messages for buffs with variable effects (based on moon phase/time of day)
- V1.0: 	base

CREDITS
- Adapted this from Wren's GearSwap luas: https://supernovaffxi.fandom.com/wiki/Wren%27s_Gearswaps
- Included good ideas from Kinematic's SMN GearSwap lua: https://github.com/Kinematics/GearSwap-Jobs/blob/master/SMN.lua
- Thanks to Tehbonz for listening to me complain about Motes and eventually inspiring me to make this.
- Thanks to Tristamgreen for testing it and adding good gear as well as Regen gear.

+--------------------+
|----- CONTENTS -----|
+--------------------+

REQUIREMENTS
- None. Kinematic's file requires shortcuts addon, but I auto-determine target type now.

PERKS
- Shorthand-BP-choice by providing one command, such as //gs c bplv70 or //gs c bpbuffoffense. Full list and their pacts per avatar at the bottom of this file.
	- Automatically checks whether avatar has a pact in this category and executes it.
	- Target of pact is auto-determined to be <me>, <stpc> or <stnpc>
- After Summoning, the correct perp set (day, weather, carby, spirits) is chosen
- After BP, aftercast is skipped and 5s later, the correct set is chosen
- Auto-siphon casts correct spirit, siphons it and releases it
- Automatically informs party members of the exact effects of BPs with variable effects (e.g. based on moon phase)
- Automatic abortion of BP/Assault when you're too far to counter unwanted gear swaps (when not activating due to distance)

- Full pre-, mid- and aftercast set definitions for SMN-relevant spells, abilities and stances
- Melee stance locks main/sub to keep TP
- Engaging/Disengaging will auto-equip your melee/idle set

- Assaulting with a pet will auto-equip your perp engaged set
- Release automatically puts you back in no perp mode (solo idle)
- Retreat automatically removes perp engaged set and goes into correct perp set

BEWARE
- When a pet auto-attacks a mob, this will not put on sets.perp.engaged. It will do that with Assault, or any other aftercast while pet is engaged.
	- It is advised to make a macro /console gs equip perp.engaged - that command will put your pet in engage mode.
	- For this reason, it is also advised to use Assault anyway whenever you want a pet to engage a mob.
- Wait for the Blood Pact to be executed before doing anything else (or you may use the wrong gear for it)


+---------------+
|----- USE -----|
+---------------+

- To call a command from a macro:		/console gs c [command]

commands: (see the table at the bottom to see which BPs are in which command)

bplowlv
bpcure			
bpcuraga
bpbuffoffense
bpbuffdefense
bpdebuff1
bpdebuff2
bpsleep
bpnuke2
bpnuke4
bplv70
bplv75
bpaf

melee (lock main/sub to keep TP)
siphon (auto-siphons)
perp (calls equip_perp(pet.name))
respirit (releases spirit and recasts it)

+----------------+
|----- INFO -----|
+----------------+

STILL TO FIX
- Nothing faulty.

STILL TO IMPROVE
- PetTP notice somewhere. Healing Ruby heals more HP healed when TP is higher.
- Custom timers.

MAIN CHALLENGES
- When summoning a pet, in aftercast, GS doesn't think you have a pet yet.
- When releasing a pet, in aftercast, GS thinks you still have a pet.
- pet_aftercast/pet_midcast didn't seem to work when I was making this. However, I can use it in my DRG lua now (4 months later).

]]--

function get_sets()

-- lockstyle set 
sets.lockstyle = {
	main        = "Chatoyant Staff",
	head        = "Smn. Horn +1",
	body        = "Yinyang Robe",
	hands       = "Summoner's Bracers +1",
	legs        = "Oracle's Braconi",
	feet        = "Rostrum Pumps"
}

-------------------------------------------------------------- IDLE SETS

sets.idle={ -- refresh, mp, pdt, mdt all that. Could make more sets and toggle between them if you like (and know how to set that up)
    main		= "Terra's Staff",
    sub			= "Magic Strap",
    ammo		= "Hedgehog Bomb",
	head		= "Walahra Turban",
    body		= "Yinyang Robe",
    hands		= "Summoner's Bracers +1",
    legs		= "Goliard Trews",
    feet		= "Herald's Gaiters",
    neck		= "Orochi Nodowa +1",
    waist		= "Hierarch Belt",
    left_ear	= "Astral Earring",
    right_ear	= "Loquacious Earring",
    left_ring	= "Shadow Ring",
    right_ring	= "Patronus Ring",
    back		= "Umbra Cape",
}

sets.daylight = { -- idle with daylight refresh stuff. lyco sash, feronia's bangles...
	hands		= "Feronia's Bangles",
	waist		= "Lycopodium Sash"
}

sets.perp = { -- Avatar perpetuation cost-
	main 		= "Chatoyant Staff",
	body 		= "Penance Robe",
	head		= "Spurrer Beret",
	legs		= "Goliard Trews",
	feet		= "Evoker's Pigaches +1",
	left_ring	= "Evoker's Ring"
}

sets.perp.carbuncle = {  -- Carbuncle-specific items
	body		= "Yinyang Robe",
	hands		= "Carbuncle Mitts"
}

sets.perp.garuda = {head="Karura Hachigane"} 			-- Garuda-specific items
sets.perp.day = {body="Summoner's Doublet +1"}  		-- Perp cost- on day
sets.perp.weather = {head="Summoner's Horn +1"} 		-- Perp cost- in weather
sets.perp.darkspirit	= {body="Duende Cotehardie"} 	-- -1 Dark Spirit Perp Cost
sets.perp.lightspirit	= {body="Nimbus Doublet"} 		-- -1 Light Spirit Perp Cost
sets.perp.engaged = { -- Avatar acc/atk
	feet		= "Evoker's Pigaches +1",
	legs		= "Evoker's Spats"
}

-------------------------------------------------------------- SMN SPECIFIC NON-IDLE SETS

sets.precast = {}
sets.precast.summon = {  -- reduce summoning casting time
	sub			= "Vivid Strap +1",
	head		= "Walahra Turban",
	legs		= "Summoner's Spats +1",
	feet		= "Rostrum Pumps"} 

sets.precast.bp = {  -- BP delay
	head		= "Penance Hat",
    body		= "Yinyang Robe",
	hands		= "Penance Cuffs",
	legs		= "Summoner's Spats +1"
}
	
sets.precast.siphon = { -- Summoning magic skill
	main		= "Chatoyant Staff",
	head		= "Evoker's Horn",
	body		= "Penance Robe",
	hands		= "Summoner's Bracers +1",
	legs		= "Oracle's Braconi",
	feet		= "Penance Sabots",
	neck		= "Summoning Torque",
	left_ear	= "Summoning Earring",
	left_ring	= "Evoker's Ring",
	waist		= "Summoning Belt",
	back		= "Astute Cape"
}

sets.midcast = {}
sets.midcast.bpragephys = {  -- BP potency (Summoning magic skill + acc/atk)
	head		= "Evoker's Horn",
	body		= "Penance Robe",
	hands		= "Penance Cuffs",
	legs		= "Oracle's Braconi",
	feet		= "Penance Sabots",
	neck		= "Summoning Torque",
	left_ear	= "Summoning Earring",
	left_ring	= "Evoker's Ring",
	waist		= "Summoning Belt",
	back		= "Astute Cape"
}
sets.midcast.bpragemag = sets.midcast.bpragephys  -- BP potency (Summoning magic skill + macc/matk)
sets.midcast.bpwarddebuff = sets.midcast.bpragephys  -- BP potency (Summoning magic skill)
sets.midcast.bpwardbuff = sets.midcast.bpragephys  -- BP potency (Summoning magic skill)

-------------------------------------------------------------- GENERAL MAGIC SETS

sets.precast.general = {} -- Fast Cast to reduce casting time (for all magics)

sets.healing = { -- Healing potency + MND
	main		= "Chatoyant Staff",
    sub			= "Reign Grip",
	head		= "Goliard Chapeau",
    hands		= "Patrician's Cuffs",
	body		= "Mahatma Houppelande",
	legs		= "Mahatma Slops",
	feet		= "Goliard Clogs",
    neck		= "Fylgja Torque +1",
    left_ear	= "Roundel Earring",
	right_ear	= "Celestial Earring",
	left_ring	= "Celestial Ring",
	right_ring	= "Celestial Ring",
    back		= "Dew Silk Cape +1",
}

sets.stoneskin = { -- MND gear
	main		= "Kirin's Pole",
	sub			= "Reign Grip",
	head		= "Goliard Chapeau",
	body		= "Mahatma Hpl.",
	hands		= "Bricta's Cuffs",
	feet		= "Goliard Clogs",
	legs		= "Mahatma Slops",
	neck		= "Gnole Torque",
	back		= "Dew Silk Cape +1",
	left_ear	= "Celestial Earring",
    right_ear	= "Celestial Earring",
    left_ring	= "Celestial Ring",
    right_ring	= "Celestial Ring",
}

sets.enhancing = { -- Enhancing magic skill
    head		= "Goliard Chapeau",
	body		= "Mahatma Hpl.",
	hands		= "Bricta's Cuffs",
	legs		= "Mahatma Slops",
	feet		= "Shrewd Pumps",
	right_ear	= "Augmenting Earring",
	neck		= "Enhancing Torque",
	back		= "Merciful Cape"
}

sets.ninjutsu = { -- Interrupt down (although who the fuck is going SMN/NIN)
	main		= "Eremite's Wand",
	sub			= "Eremite's Wand",
	waist		= "Druid's Rope"
}

-------------------------------------------------------------- FAST CAST

sets.fcasthaste={ -- fast cast and haste gear for those spells without potency modifiers (like Raise or Paralyna)
	sub			= "Vivid Strap +1",
	head		= "Walahra Turban",
	body		= "Goliard Saio",
	right_ear	= "Loquacious Earring",
	waist		= "Swift Belt",
	feet		= "Rostrum Pumps"
}

-------------------------------------------------------------- RESTING SET

sets.rest={ -- hMP
	main		= "Chatoyant Staff",
    sub			= "Magic Strap",
	head		= "Mirror Tiara",
	body		= "Oracle's Robe",
	hands		= "Oracle's Gloves",
    legs		= "Oracle's Braconi",
	feet		= "Goliard Clogs",
	neck		= "Gnole Torque",
	waist		= "Qiqirn Sash +1",
	left_ear	= "Rapture Earring",
    right_ear	= "Celestial Earring",
    left_ring	= "Celestial Ring",
    right_ring	= "Celestial Ring",
    back		= "Invigorating Cape",
}

-------------------------------------------------------------- MELEE SETS

sets.melee = { -- haste, acc, atk, typical melee stuff
	neck		= "Peacock Amulet",
	waist		= "Swift Belt",
}

sets.melee_weapons = { -- whatever you want to melee with
	main		= "Kraken Club",
	sub			= "Genbu's Shield",
}

-------------------------------------------------------------- ELEMENTAL GRIPS

-- elemental grips
sets.grip = {}
	sets.grip.Ice     	= {sub='Ice Grip'}
	sets.grip.Fire     	= {sub='Fire Grip'}
	sets.grip.Wind     	= {sub='Wind Grip'}
	sets.grip.Dark     	= {sub='Dark Grip'}
	sets.grip.Water 	= {sub='Water Grip'}
	sets.grip.Earth 	= {sub='Earth Grip'}
	sets.grip.Light 	= {sub='Light Grip'}
	sets.grip.Lightning = {sub='Thunder Grip'}

end

--[[********************************************************
	functions go here
********************************************************--]]	

-- auto-detect when a pet goes to Idle
function pet_status_change(new,old)
	if old == 'Engaged' and new == 'Idle' then
		back_to_perp(name)
	end
end

-- equip our idle set
function equip_idle(name)
	if melee then
		equip(sets.idle,sets.melee_weapons)
	elseif world.time <= 1080 and world.time >= 360 then 
			windower.add_to_chat(8,"[Bonus Regen ON]")
			equip(sets.idle,sets.daylight)
	else
        windower.add_to_chat(8,"[Summoner's Base Idle set]")
        equip(sets.idle)
	end
	back_to_perp(name)
 end
 
-- equip our engaged set
function equip_engaged(name)
	equip(sets.melee)
	back_to_perp(name)
end
-- equip our ws set
function equip_ws()
	equip(sets.ws) 
end
-- equip our resting hMP set
function equip_rest()
	equip(sets.rest)
end

function equip_summoning(spell)
end

function equip_bp(spell)
	local bptype = get_bp_type(spell)
	if bptype == 'RagePhys' then
		equip(sets.midcast.bpragephys)
	elseif bptype == 'RageMag' then
		equip(sets.midcast.bpragemag)
	elseif bptype == 'WardDebuff' then
		equip(sets.midcast.bpwarddebuff)
	elseif bptype == 'WardBuff' then
		equip(sets.midcast.bpwardbuff)
	end
	
	bp_waiting_for_execution = true
end

function equip_heal(spell)

	-- for all healing spells
	equip(sets.mnd,sets.healing)
	
	-- exceptions that don't need MND/healing gear
	if spell.name:contains('Reraise') or spell.name:contains('Raise') or spell.name == 'Blindna' or spell.name == 'Cursna' or spell.name == 'Paralyna' or spell.name == 'Poisona' or spell.name == 'Silena' or  spell.name == 'Viruna' then
		equip(sets.fcasthaste)
	else
		-- obi
		if spell.element == world.day_element then
			windower.add_to_chat(8,'[Cure - on matching day]')
			equip({waist="Hachirin-no-Obi"})
		elseif spell.element == world.weather_element then
			windower.add_to_chat(8,'[Cure - with matching weather]')
			equip({waist="Hachirin-no-Obi"})
		elseif world.weather_element == 'Dark' or world.day_element == 'Dark' then
			-- windower.add_to_chat(8,'BUGGED ATM [Cure - on Dark weather / day to negate]')
			-- equip({waist="Hachirin-no-Obi"})
		end
	end
end

function equip_enfeebling(spell) -- if you're enfeebling on SMN I take it you mean Dia so no potency gear here
	equip(sets.fcasthaste)
    equip(sets.grip[spell.element])
end

function equip_enhancing(spell) 

	-- MND
	if spell.name == 'Stoneskin' then
		equip(sets.fcasthaste,sets.stoneskin)
		
	-- enhancing magic
	elseif spell.name:contains('Bar') or spell.name:contains('Phalanx') or spell.name == 'Aquaveil' or spell.name:contains('Enaero') or spell.name:contains('Enstone') or spell.name:contains('Enfire') or spell.name:contains('Enwater') or spell.name:contains('Enblizzard') or spell.name:contains('Enthunder') or spell.name == 'Invisible' or spell.name == 'Sneak' or spell.name:contains('Spikes') then
		equip(sets.fcasthaste,sets.enhancing)
	-- no modifiers, just fcast
	elseif spell.name == 'Refresh' or spell.name:contains('Regen') or spell.name == 'Haste' or spell.name == 'Flurry' or spell.name == 'Blink' or spell.name:contains('Protect') or spell.name:contains('Shell') then
		equip(sets.fcasthaste)
	end
end

-- checks whether you really have to go back to perp
-- this is the same as equip_perp but it has a spell as parameter. This is used to check whether it's Release.
-- if it's Release, you don't need perp (but we need this check since GS is slow and thinks we still have a pet after Release)
-- if it's not Release, check whether you really have a pet and if you do, equip_perp
function back_to_perp(name)
	if name ~= "Release" then
		if pet.isvalid then equip_perp(pet.name) end -- if you've got a pet, equip right perp gear
	end
end

-- equips the right perp set
function equip_perp(name)
	
	equip(sets.perp)
	
	-- check day
	if name == 'Ifrit' and world.day_element == 'Fire' then equip(sets.perp.day) end
	if name == 'Shiva' and world.day_element == 'Ice' then equip(sets.perp.day) end
	if name == 'Garuda' and world.day_element == 'Wind' then equip(sets.perp.day) end
	if name == 'Titan' and world.day_element == 'Earth' then equip(sets.perp.day) end
	if name == 'Ramuh' and world.day_element == 'Lightning' then equip(sets.perp.day) end
	if name == 'Leviathan' and world.day_element == 'Water' then equip(sets.perp.day) end
	if (name == 'Diabolos' or name == 'Fenrir') and world.day_element == 'Dark' then equip(sets.perp.day) end
	if name == 'Carbuncle' and world.day_element == 'Light' then equip(sets.perp.day) end
	
	-- check weather
	if name == 'Ifrit' and world.weather_element == 'Fire' then equip(sets.perp.weather) end
	if name == 'Shiva' and world.weather_element == 'Ice' then equip(sets.perp.weather) end
	if name == 'Garuda' and world.weather_element == 'Wind' then equip(sets.perp.weather) end
	if name == 'Titan' and world.weather_element == 'Earth' then equip(sets.perp.weather) end
	if name == 'Ramuh' and world.weather_element == 'Lightning' then equip(sets.perp.weather) end
	if name == 'Leviathan' and world.weather_element == 'Water' then equip(sets.perp.weather) end
	if (name == 'Diabolos' or name == 'Fenrir') and world.weather_element == 'Dark' then equip(sets.perp.weather) end
	if name == 'Carbuncle' and world.weather_element == 'Light' then equip(sets.perp.weather) end
	
	-- specific sets
	if name == 'Carbuncle' then equip(sets.perp.carbuncle) end
	if name == 'Garuda' then equip(sets.perp.garuda) end
	
	-- spirits (no ava perp right?)
	if name:contains('Dark Spirit') then equip(sets.perp.darkspirit) end
	if name:contains('Light Spirit') then equip (sets.perp.lightspirit) end
	
	-- if you've got a pet (you did not JUST summon this, GS doesn't immediately recognize pet in aftercast of summoning it)
	if pet.isvalid then
		if just_retreated == false then
			if pet.status == 'Engaged' then 
			equip(sets.perp.engaged) end -- equip engaged set when the pet is attacking
		end
	end
	
	send_command('wait 1;input //gs c donesummoning')
	-- whenever the right perp set is chosen, a pet is always out and thus just_summoned should be false
	-- the wait is there, otherwise your gear doesn't change to right perp set after summoning immediately
	
end

-- the choose_set function figures out whether we're engaged with a mob or not, and passes control to the relevant function above
function choose_set(name)
	-- if we just summoned, skip everything (so equip_perp can just do its job)
	if just_summoned == false then
		if player.status == "Engaged" then
			equip_engaged(name)
		else
			equip_idle(name)
		end
		-- if you're Retreating your pet, equip right perp set
		if name == "Retreat" then
			just_retreated = true -- necessary because GS thinks the pet is still engaged immediately after Retreating
			equip_perp(pet.name)
		else
			just_retreated = false
		end
	end
 end

-- Get BP type
function get_bp_type(spell)
	if spell.type == 'BloodPactRage' then
		if magicalRagePacts:contains(spell.english) then
			return 'RageMag'
		elseif physicalRagePacts:contains(spell.english) then
			return 'RagePhys'
		end
	elseif spell.type == 'BloodPactWard' then
		if debuffWardPacts:contains(spell.english) then
			return 'WardDebuff'
		elseif buffWardPacts:contains(spell.english) then
			return 'WardBuff'
		end
	end
end 

-- Handles executing blood pacts in a generic, avatar-agnostic way.
function execute_blood_pact(name)

	-- if you don't have a pet
    if pet.isvalid == false then
        add_to_chat(122,'No avatar currently available.')
        return
    end

	-- if you have a pet, but it's a spirit
    if pet.name:contains('Spirit') then
        add_to_chat(122,'Cannot use pacts with spirits.')
        return
    end
   
    -- if the name of the pact doesn't exist in the list
    if not pacts[name] then
        add_to_chat(122,'Unknown pact type: '..tostring(name))
        return
    end
    
	-- if the pact exists for that pet
    if pacts[name][pet.name] then
	
		-- if it's astral flow and you have astral flow active
        if name == 'af' and not buffactive['astral flow'] then
            add_to_chat(122,'Cannot use Astral Flow pacts at this time.')
            return
        end
        
        -- Target is either <me>, <stpc> or <stnpc>. <stpc> for Healing Ruby I/II, <me> for all other buffs/heals, <stnpc> for everything else
		if bptargets_stpc:contains(pacts[name][pet.name]) then
			send_command('input /pet "'..pacts[name][pet.name]..'" <stpc>')
		elseif bptargets_me:contains(pacts[name][pet.name]) then
			send_command('input /pet "'..pacts[name][pet.name]..'" <me>')
		else
			send_command('input /pet "'..pacts[name][pet.name]..'" <stnpc>')
		end
    else
        add_to_chat(122,pet.name..' does not have a pact of type ['..name..'].')
    end
	
end

-- show information about spells' variable effects to the party (or yourself)
function blood_pact_information_for_party(name)
	
	if name == "Dream Shroud" then
		-- https://github.com/DarkstarProject/darkstar/blob/08f7115f028376eb4db577c465fc9cfc89abdeb7/scripts/globals/abilities/pets/dream_shroud.lua
		local hour = math.abs(12-math.floor(world.time/60))+1
		send_command('input /p - ' .. name .. ': MAB +' .. tostring(hour) .. ', MDB +' .. tostring(14-hour) .. '')
	end
	
	if name == "Lunar Cry" then
		-- https://github.com/DarkstarProject/darkstar/blob/08f7115f028376eb4db577c465fc9cfc89abdeb7/scripts/globals/abilities/pets/lunar_cry.lua
		local moon = 0
		if world.moon_pct > 90 then moon = 31
			elseif world.moon_pct > 75 then moon = 26
			elseif world.moon_pct > 60 then moon = 21
			elseif world.moon_pct > 40 then moon = 16
			elseif world.moon_pct > 24 then moon = 11
			elseif world.moon_pct > 10 then moon = 6
			else moon = 1
		end
		send_command('input /p - ' .. name .. ': Accuracy -' .. tostring(moon) .. ', Evasion -' .. tostring(32-moon) .. '')
	end
	
	if name == "Ecliptic Growl" then
		-- https://github.com/DarkstarProject/darkstar/blob/08f7115f028376eb4db577c465fc9cfc89abdeb7/scripts/globals/abilities/pets/ecliptic_growl.lua
		local moon = 0
		if world.moon_pct > 90 then moon = 7
			elseif world.moon_pct > 75 then moon = 6
			elseif world.moon_pct > 60 then moon = 5
			elseif world.moon_pct > 40 then moon = 4
			elseif world.moon_pct > 24 then moon = 3
			elseif world.moon_pct > 10 then moon = 2
			else moon = 1
		end
		send_command('input /p - ' .. name .. ': STR/DEX/VIT +' .. tostring(moon) .. ', AGI/INT/MND/CHR +' .. tostring(8-moon) .. '')
	end
	
	if name == "Ecliptic Howl" then
		-- https://github.com/DarkstarProject/darkstar/blob/08f7115f028376eb4db577c465fc9cfc89abdeb7/scripts/globals/abilities/pets/ecliptic_howl.lua
		local moon = 0
		if world.moon_pct > 90 then moon = 25
			elseif world.moon_pct > 75 then moon = 21
			elseif world.moon_pct > 60 then moon = 17
			elseif world.moon_pct > 40 then moon = 13
			elseif world.moon_pct > 24 then moon = 9
			elseif world.moon_pct > 10 then moon = 5
			else moon = 1
		end
		send_command('input /p - ' .. name .. ': Accuracy +' .. tostring(moon) .. ', Evasion +' .. tostring(25-moon) .. '')
	end
	
end

-- release your current spirit and immediately recast it
function respirit()

	if pet.isvalid then
		if pet.name:contains('Spirit') then
			local spirit_to_cast = ''
			if pet.name == 'FireSpirit' then spirit_to_cast = 'Fire Spirit' end
			if pet.name == 'IceSpirit' then spirit_to_cast = 'Ice Spirit' end
			if pet.name == 'AirSpirit' then spirit_to_cast = 'Air Spirit' end
			if pet.name == 'EarthSpirit' then spirit_to_cast = 'Earth Spirit' end
			if pet.name == 'ThunderSpirit' then spirit_to_cast = 'Thunder Spirit' end
			if pet.name == 'WaterSpirit' then spirit_to_cast = 'Water Spirit' end
			if pet.name == 'LightSpirit' then spirit_to_cast = 'Light Spirit' end
			if pet.name == 'DarkSpirit' then spirit_to_cast = 'Dark Spirit' end
			send_command('input /release <me>;wait 0.5;input /ma "' .. spirit_to_cast .. '"')
		else
			add_to_chat(122,'You do not have a Spirit out.')
		end
	else
		add_to_chat(122,'You do not have a pet out.')
	end
end

-- Auto-Siphon
function auto_siphon()

	local element_to_use = world.day_element -- usual case
	
	-- if there's weather
	if world.weather_element ~= 'None' then
		-- if it's double weather, we choose weather element
		if (world.weather_id > 4 and world.weather_id %1 == 0) then
			element_to_use = world.weather_element
		else
			-- only use single weather element if it's not weak to the element of the current day
			if (world.weather_element == 'Fire' and world.day_element ~= 'Water')
			or (world.weather_element == 'Ice' and world.day_element ~= 'Fire')
			or (world.weather_element == 'Wind' and world.day_element ~= 'Ice')
			or (world.weather_element == 'Earth' and world.day_element ~= 'Wind')
			or (world.weather_element == 'Lightning' and world.day_element ~= 'Earth')
			or (world.weather_element == 'Water' and world.day_element ~= 'Lightning')
			or (world.weather_element == 'Dark' and world.day_element ~= 'Light')
			or (world.weather_element == 'Light' and world.day_element ~= 'Dark') then
				element_to_use = world.weather_element
			else
				-- use day element if the current day is strong to the current weather
				element_to_use = world.day_element
			end
		end
	else
		-- use day element if there's no weather
		element_to_use = world.day_element
	end
	
	-- check whether the right pet is out
	if pet.isvalid == true then
		-- if the right spirit is already out, just Siphon (I assume there's a reason it's out, so keep it out)
		if pet.name:contains('Spirit') and pet.element == element_to_use then
			send_command('input /ja "Elemental Siphon" <me>')
		else
			-- if the wrong pet is out, release it
			send_command('input /pet "Release" <me>')
			windower.add_to_chat(122, 'Wrong pet for Siphon: released ' .. pet.name .. '.')
		end
	else
		-- if you don't yet have a pet out, Summon, Siphon and Release
		if element_to_use == 'Fire' then send_command('input /ma "Fire Spirit" <me>; wait 4; input /ja "Elemental Siphon" <me>; wait 1.5; input /pet "Release" <me>') end
		if element_to_use == 'Ice' then send_command('input /ma "Ice Spirit" <me>; wait 4; input /ja "Elemental Siphon" <me>; wait 1.5; input /pet "Release" <me>') end
		if element_to_use == 'Wind' then send_command('input /ma "Air Spirit" <me>; wait 4; input /ja "Elemental Siphon" <me>; wait 1.5; input /pet "Release" <me>') end
		if element_to_use == 'Earth' then send_command('input /ma "Earth Spirit" <me>; wait 4; input /ja "Elemental Siphon" <me>; wait 1.5; input /pet "Release" <me>') end
		if element_to_use == 'Lightning' then send_command('input /ma "Thunder Spirit" <me>; wait 4; input /ja "Elemental Siphon" <me>; wait 1.5; input /pet "Release" <me>') end
		if element_to_use == 'Water' then send_command('input /ma "Water Spirit" <me>; wait 4; input /ja "Elemental Siphon" <me>; wait 1.5; input /pet "Release" <me>') end
		if element_to_use == 'Dark' then send_command('input /ma "Dark Spirit" <me>; wait 4; input /ja "Elemental Siphon" <me>; wait 1.5; input /pet "Release" <me>') end
		if element_to_use == 'Light' then send_command('input /ma "Light Spirit" <me>; wait 4; input /ja "Elemental Siphon" <me>; wait 1.5; input /pet "Release" <me>') end
	end
end
 
--[[ ******************************************************
 Casting functions - these functions run automatically when
 we cast a spell, use a job ability, rest for MP, and so on
****************************************************** --]]
 
-- prior to using our ability
function precast(spell)
	
	-- precast gear changes
	if spell.name == 'Elemental Siphon' then
		equip(sets.precast.siphon)
	elseif spell.type == 'WeaponSkill' then
        equip_ws()
	elseif spell.type == 'BloodPactRage' or spell.type == 'BloodPactWard' then
	
		-- we KNOW that <stpc> and <stnpc> have to have a subtarget, so if we have none, it's a <me>
		if tostring(player.subtarget.name) ~= 'nil' then
			-- if it's a <stnpc> or <stpc>, check whether we're not too far
			if player.subtarget.distance > 18 then
				add_to_chat(122,'You are too far to use a Blood Pact.')
				cancel_spell() -- if we're too far, cancel the spell to prevent unwanted gear change
			else
				equip(sets.precast.bp)
			end
		else -- if it's a <me>, distance doesn't matter
			equip(sets.precast.bp)
		end
		
	elseif spell.action_type == 'Magic' then
		equip(sets.precast.general)
		if spell.skill == 'Ninjutsu' then
			equip(sets.ninjutsu)
		elseif spell.skill == 'Summoning Magic' then
			equip(sets.precast.summon)
		end
	end
	
	-- check whether you're not doing Assault in vain, as it triggers a gear change even if it doesn't complete because of distance
	if spell.name == 'Assault' then
		if player.subtarget.distance > 19 then
			cancel_spell()
			add_to_chat(122,'You are too far to use Assault.')
		end
	end
	
	-- cancellations for your pleasure
	if spell.name == "Sneak" or spell.name == "Spectral Jig" then send_command("cancel sneak"); end
	if spell.name == "Stoneskin" then send_command("wait 4;cancel stoneskin"); end
	if spell.name == "Reraise" then send_command("cancel reraise"); end
	if spell.name == "Blink" then send_command("wait 4;cancel blink"); end
	if spell.name == "Aquaveil" then send_command("wait 4;cancel aquaveil"); end
	if spell.name == "Ice Spikes" then send_command("cancel ice spikes"); end
	if spell.name == "Shock Spikes" then send_command("cancel shock spikes"); end
	if spell.name == "Phalanx" then send_command("cancel phalanx"); end
end

-- the midcast function swaps in a new set of gear during
-- the cast, which will make the spell effect more potent.
function midcast(spell)
	if spell.action_type == 'Magic' then
		if spell.skill == 'Healing Magic' then
			equip_heal(spell)
		elseif spell.skill == 'Enfeebling Magic' then
			equip_enfeebling(spell)
		elseif spell.skill == 'Enhancing Magic' then
			equip_enhancing(spell)
		elseif spell.skill == 'Summoning Magic' then
			equip_summoning(spell)
		end
	elseif spell.type == 'BloodPactRage' or spell.type == 'BloodPactWard' then
		equip_bp(spell)
	end
end
 
 -- after we use an ability, put on either our engaged or
 -- idle sets.
function aftercast(spell)

	if bp_waiting_for_execution == false then -- when not just BPed, business as usual
	
		-- if you just summoned
		if spell.skill == 'Summoning Magic' then
			just_summoned = true
			equip_perp(spell.name) -- go into right perp set after summoning
		else
			just_summoned = false
			back_to_perp(spell.name) -- if not just summoned, go back to perp
		end
		
		-- do choose_set, unless you Assault (so we can put on sets.perp.engaged)
		if spell.name == "Assault" then
			equip(sets.perp.engaged)
		else
			choose_set(spell.name)
		end
		
	else  -- don't swap when we're still waiting for pet to complete BP
	
		bp_waiting_for_execution = false -- reset this variable
		send_command('wait 5;input //gs c postbp')
		
	end
	
	-- show party members info about Blood Pacts with variable effects
	if spell.type == "BloodPactRage" or spell.type == "BloodPactWard" then
		blood_pact_information_for_party(spell.name)
	end
	
end

-- when we engage or disengage, sit or stand, put on the correct set of gear.
-- the status_change function runs automatically whenever we engage, disengage, kneel, or stand.
-- As a SMN we use this to equip our +hMP gear when we /heal, and return to our idle gear when we stand up.
function status_change(new,old)
    if new == 'Resting' then
		equip_rest()
    else
        choose_set()
    end
 end
 
-- this posts into chatlog what buffs are added to and removed from you
function buff_change(name,gain)
	if gain == true then
		windower.add_to_chat(130, '['.. name ..' Applied!]')
	elseif gain == false then
		windower.add_to_chat(130, '['.. name ..' Has Fallen!]')
	end
end

function self_command(command)
    if command == "melee" then
        if melee == false then
            melee = true
            choose_set()
			equip(sets.idle,sets.melee_weapons)
			if player.status == "Engaged" then
				equip(sets.melee)
			end
            disable('main')
            disable('sub')
			windower.add_to_chat(8,'[>> Melee stance]')
        else
            melee = false
            enable('main')
            enable('sub')
            choose_set()
			equip(sets.idle)
			windower.add_to_chat(8,'[>> Mage stance]')
        end
	elseif command == "perp" then
		equip_perp(pet.name)
	elseif command == "postbp" then
		choose_set()
	elseif command == "donesummoning" then
		just_summoned = false
	elseif command == "siphon" then
		auto_siphon()
	elseif string.sub(command, 1, 2) == "bp" then -- check if the command begins with "bp" (start at 1, go to 2)
		execute_blood_pact(string.sub(command, 3, -1)) -- send the rest of the word to the function (start at 3, -1 means rest of the word)
	elseif command == "respirit" then
		respirit()
	end
 end
 
 ----------------------------------------------------- START UP FUNCTIONS ----------------------------
 
 -- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function setup_job()

    spirits = S{"LightSpirit", "DarkSpirit", "FireSpirit", "EarthSpirit", "WaterSpirit", "AirSpirit", "IceSpirit", "ThunderSpirit"}
    avatars = S{"Carbuncle", "Fenrir", "Diabolos", "Ifrit", "Titan", "Leviathan", "Garuda", "Shiva", "Ramuh", "Odin", "Alexander"}

	bptargets_stpc = S{'Healing Ruby', 'Healing Ruby II'}
	bptargets_me = S{'Shining Ruby', 'Aerial Armor', 'Frost Armor', 'Rolling Thunder', 'Whispering Wind', 'Crimson Howl', 'Lightning Armor',
		'Ecliptic Growl', 'Glittering Ruby', 'Earthen Ward', 'Spring Water', 'Hastega', 'Noctoshield', 'Ecliptic Howl', 'Dream Shroud'}
	
    magicalRagePacts = S{
        'Inferno','Earthen Fury','Tidal Wave','Aerial Blast','Diamond Dust','Judgment Bolt','Searing Light','Howling Moon','Ruinous Omen',
        'Fire II','Stone II','Water II','Aero II','Blizzard II','Thunder II',
        'Fire IV','Stone IV','Water IV','Aero IV','Blizzard IV','Thunder IV',
        'Thunderspark','Burning Strike','Meteorite','Nether Blast','Flaming Crush',
        'Meteor Strike','Heavenly Strike','Wind Blade','Geocrush','Grand Fall','Thunderstorm',}
		
	physicalRagePacts = S{
		'Punch','Rock Throw','Barracuda Dive','Claw','Axe Kick','Shock Strike','Camisado','Poison Nails','Moonlit Charge','Crescent Fang',
		'Rock Buster','Burning Strike','Tail Whip','Double Punch','Megalith Throw','Double Slap','Meteorite',
		'Eclipse Bite','Nether Blast','Flaming Crush','Mountain Buster','Spinning Dive','Predator Claws','Rush','Chaotic Strike'}
		
	debuffWardPacts = S{
		'Somnolence','Lunar Cry','Nightmare','Lunar Roar','Slowga','Ultimate Terror','Sleepga'}
	
	buffWardPacts = S{
		'Healing Ruby','Shining Ruby','Aerial Armor','Frost Armor','Rolling Thunder','Whispering Wind','Crimson Howl','Lightning Armor',
		'Ecliptic Growl','Glittering Ruby','Earthen Ward','Spring Water','Hastega','Noctoshield','Ecliptic Howl','Dream Shroud','Healing Ruby II'}

    pacts = {}
	pacts.lowlv ={['Carbuncle']='Poison Nails', ['Ifrit']='Double Punch', ['Shiva']='Double Slap', ['Fenrir']='Crescent Fang'}
    pacts.cure = {['Carbuncle']='Healing Ruby'}
    pacts.curaga = {['Carbuncle']='Healing Ruby II', ['Garuda']='Whispering Wind', ['Leviathan']='Spring Water'}
    pacts.buffoffense = {['Carbuncle']='Glittering Ruby', ['Ifrit']='Crimson Howl', ['Garuda']='Hastega', ['Ramuh']='Rolling Thunder',
		['Fenrir']='Ecliptic Growl',['Diabolos']='Dream Shroud'}
    pacts.buffdefense = {['Carbuncle']='Shining Ruby', ['Shiva']='Frost Armor', ['Garuda']='Aerial Armor', ['Titan']='Earthen Ward', ['Ramuh']='Lightning Armor',
		['Fenrir']='Ecliptic Howl', ['Diabolos']='Noctoshield'}
    pacts.debuff1 = {['Fenrir']='Lunar Cry', ['Diabolos']='Somnolence'}
    pacts.debuff2 = {['Leviathan']='Slowga', ['Fenrir']='Lunar Roar'}
    pacts.sleep = {['Shiva']='Sleepga', ['Diabolos']='Nightmare'}
    pacts.nuke2 = {['Ifrit']='Fire II', ['Shiva']='Blizzard II', ['Garuda']='Aero II', ['Titan']='Stone II',['Ramuh']='Thunder II', ['Leviathan']='Water II'}
    pacts.nuke4 = {['Ifrit']='Fire IV', ['Shiva']='Blizzard IV', ['Garuda']='Aero IV', ['Titan']='Stone IV',['Ramuh']='Thunder IV', ['Leviathan']='Water IV'}
    pacts.lv70 = {['Ifrit']='Flaming Crush', ['Shiva']='Rush', ['Garuda']='Predator Claws', ['Titan']='Mountain Buster',
        ['Ramuh']='Chaotic Strike', ['Leviathan']='Spinning Dive', ['Carbuncle']='Meteorite', ['Fenrir']='Eclipse Bite', ['Diabolos']='Nether Blast'}
    pacts.lv75 = {['Ifrit']='Meteor Strike', ['Shiva']='Heavenly Strike', ['Garuda']='Wind Blade', ['Titan']='Geocrush',
        ['Ramuh']='Thunderstorm', ['Leviathan']='Grand Fall'}
    pacts.af = {['Ifrit']='Inferno', ['Shiva']='Diamond Dust', ['Garuda']='Aerial Blast', ['Titan']='Earthen Fury',
        ['Ramuh']='Judgment Bolt', ['Leviathan']='Tidal Wave', ['Carbuncle']='Searing Light', ['Fenrir']='Howling Moon', ['Diabolos']='Ruinous Omen'}

    -- Wards table for creating custom timers (unused atm)
    wards = {}
    -- Base duration for ward pacts.
    wards.durations = {
        ['Crimson Howl'] = 60,
        ['Rolling Thunder'] = 120,
        ['Shining Ruby'] = 180, ['Frost Armor'] = 180, ['Lightning Armor'] = 180, ['Ecliptic Growl'] = 180,
        ['Glittering Ruby'] = 180, ['Hastega'] = 180, ['Noctoshield'] = 180, ['Ecliptic Howl'] = 180,
        ['Dream Shroud'] = 180,
        ['Reraise II'] = 3600
    }
    -- Icons to use when creating the custom timer.
    wards.icons = {
        ['Earthen Ward']   = 'spells/00299.png', -- 00299 for Titan
        ['Shining Ruby']    = 'spells/00043.png', -- 00043 for Protect
        ['Dream Shroud']    = 'spells/00304.png', -- 00304 for Diabolos
        ['Noctoshield']     = 'spells/00106.png', -- 00106 for Phalanx
        ['Hastega']         = 'spells/00358.png', -- 00358 for Hastega
        ['Rolling Thunder'] = 'spells/00104.png', -- 00358 for Enthunder
        ['Frost Armor']     = 'spells/00250.png', -- 00250 for Ice Spikes
        ['Lightning Armor'] = 'spells/00251.png', -- 00251 for Shock Spikes
    }
    -- Flags for code to get around the issue of slow skill updates.
    wards.flag = false
    wards.spell = ''
	
end

--[[ ******************************************************
  Code that runs once, when we first swap to our smn job
****************************************************** --]]
 melee = false
 bp_waiting_for_execution = false
 just_summoned = false
 just_retreated = false
 setup_job()
 
-- puts on our fashion set, lockstyle it, then switch to our idle set.
send_command('wait 1; gs equip lockstyle; wait 1; input /lockstyle on; wait 1; gs equip idle')
send_command('input /macro book 17; wait 0.1; input /macro set 1')
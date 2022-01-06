-------------------------------------------------------------------------------------------------------------------
-- Lau's Custom ERA BLM Lua -- Based on 75 Cap Private Server --
-------------------------------------------------------------------------------------------------------------------

--[[
    Custom commands:
		Ctrl + = Cycles through the available treasure hunter modes.
		Ctrl + F11 Toggles Resistance & Normal Sets.  
		Ctrl + F12 Toggles Idle Sets.
		Alt + Tilde Toggles Magic Burst On/Off
    
	Treasure hunter modes:
        None - Will never equip TH gear.
        Tag - Will equip Lotus Katana along with Elemental Magic skill gear everytime Magic is cast.
--]]

-- Initialization function for this job file --

function get_sets()
    mote_include_version = 2
	
	sets.obi = {
		Fire = {waist="Karin Obi"},
		Earth = {waist="Dorin Obi"},
		Water = {waist="Suirin Obi"},
		Wind = {waist="Furin Obi"},
		Ice = {waist="Hyorin Obi"},
		Lightning = {waist="Rairin Obi"},
		Light = {waist="Korin Obi"},
		Dark = {waist="Anrin Obi"}}
	
	sets.staff = {
		Fire = {main="Claustrum"},
		Earth = {main="Claustrum"},
		Water = {main="Claustrum"},
		Wind = {main="Claustrum"},
		Ice = {main="Aquilo's Staff"},
		Lightning = {main="Claustrum"},
		Light = {main="Claustrum"},
		Dark = {main="Claustrum"}}
	
	sets.staff2 = {
		main="Diabolos's Pole"}
		
	sets.grips = {
		Fire = {sub="Fire Grip"},
		Earth = {sub="Earth Grip"},
		Water = {sub="Water Grip"},
		Wind = {sub="Wind Grip"},
		Ice = {sub="Ice Grip"},
		Lightning = {sub="Thunder Grip"},
		Light = {sub="Light Grip"},
		Dark = {sub="Dark Grip"}}
	
	sets.tonban = {
		legs="Sorcerer's Tonban"}	
		
	sets.boots = {
		feet="Marabout Sandals"}	
   
-- Load and initialize the include file --
	include('Mote-Include.lua')
end


-- Setup vars that are user-independent -- state.Buff vars initialized here will automatically be tracked --

function job_setup()
	include('Mote-TreasureHunter')
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job -- Recommend that these be overridden in a sidecar file --
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent -- Can override this function in a sidecar file --

function user_setup()
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'Refresh', 'Nuke','NukeRes', 'Dark', 'Debuff', 'Enfeeb', 'Show')
    state.MagicBurst = M(false, 'Magic Burst')
    
    -- Additional local binds --
    send_command('bind ^= gs c cycle TreasureMode')
    send_command('bind ^` gs c toggle MagicBurst')

    select_default_macro_book()
	failcheck()
end

-- Called when this job file is unloaded (eg: job change) --

function user_unload()
    send_command('unbind ^`') 
	send_command('unbind ^=')  
end

-- Define sets and vars used by this job file --

function init_gear_sets()
	
	--------------------------------------
    -- Start defining the sets --
    --------------------------------------
    
    ---- Precast Set ----  
		
	sets.precast.FC = {
		ear1="Loquacious Earring",
		feet="Rostrum Pumps"}
	
	---- Yellowing Set ---- Temp disabled. until sorc ring is obtained
	
--	sets.precast.FC['Elemental Magic'] = {
--		head="Zenith Crown",
--		body="Dalmatica",
--		hands="Zenith Mitts",
--		legs="Zenith Slacks",
--		left_ring="Ether Ring",
--		back="Ixion Cape",
--		right_ring="Serket Ring",
--		ear1="Loquacious Earring",
--		feet="Rostrum Pumps"}
	
	---- Precast Shadows ----
	
	sets.precast.FC.Utsusemi = {
		ear1="Loquacious Earring",
		feet="Rostrum Pumps"}

    ---- Midcast Sets ----
	
	sets.TreasureHunter = {
		main="Lotus Katana",
		hands="Wizard's Gloves",
		neck="Lemegeton medallion +1",
		ammo="Sturm's Report"}
	
	sets.midcast.Utsusemi = {
		head="Walahra Turban",
		ear1="Loquacious Earring",
		body="Nashira Manteel",
		feet="Rostrum Pumps"}
	
	sets.midcast.Cure = {
	    main="Claustrum",
		sub="Bugard Leather Strap +1",
        body="Nashira Manteel",
		head="Walahra Turban",
		hands="Bricta's Cuffs",
        back="Altruistic Cape",
		legs="Jet Seraweels",
		ring1="Star Ring",
		ring2="Tamas Ring",
		ear1="Celestial Earring",
		ear2="Roundel Earring",
		feet="Mahatma Pigaches",
		ammo="Phtm. Tathlum",
		neck="Fylgja Torque +1",
		waist="Sorcerer's belt"}

    sets.midcast.Curaga = sets.midcast.Cure 
	
	sets.midcast['Enhancing Magic'] = {
		main="Claustrum",
		sub="Bugard Leather Strap +1",
	    head="Walahra Turban",
		hands="Bricta's Cuffs",
        body="Nashira Manteel",
		back="Merciful Cape",
		legs="Jet Seraweels",
		ring1="Snow Ring",
		ring2="Tamas Ring",
		ear1="Loquacious Earring",
		ear2="Static Earring",
		ammo="Phtm. Tathlum",
		feet="Igqira Huaraches",
		neck="Faith Torque",
		waist="Penitent's Rope"}

    sets.midcast.Stoneskin = {
	    main="Kirin's Pole",
		sub="Bugard Leather Strap +1",
		head="Walahra Turban",
        body="Errant Houppelande",
		back="Ixion Cape",
		hands="Bricta's Cuffs",
		legs="Jet Seraweels",
		ring1="Star Ring",
		ring2="Tamas Ring",
		ear1="Celestial Earring",
		ammo="Phtm. Tathlum",
		ear2="Static Earring",
		feet="Avocat Pigaches",
		neck="Faith Torque",
		waist="Penitent's Rope"}
    
	sets.midcast.IntEnfeebles =  {
	    main="Claustrum",
	    head="Igqira Tiara",
		waist="Sorcerer's belt",
		body="Wizard's Coat",
		legs="Igqira Lappas",
		hands="Oracle's Gloves",
		neck="Spider Torque",
		ring1="Snow Ring",
		ring2="Snow Ring",
		ear2="Abyssal Earring",
		ammo="Sturm's Report",
		ear1="Loquacious Earring",
		back="Altruistic Cape",
		feet="Avocat Pigaches"}
		
	sets.midcast.MndEnfeebles =  {
	    main="Claustrum",
	    head="Igqira Tiara",
		waist="Sorcerer's belt",
		body="Wizard's Coat",
		legs="Igqira Lappas",
		hands="Bricta's Cuffs",
		neck="Spider Torque",
		ring1="Star Ring",
		ring2="Tamas Ring",
		ear2="Static Earring",
		ammo="Sturm's Report",
		ear1="Celestial Earring",
		back="Altruistic Cape",
		feet="Avocat Pigaches"}
	
	sets.midcast.ElementalEnfeeble = {
		main="Claustrum",
		head="Sorcerer's Petasos",
		body="Sorcerer's Coat",
		hands="Wizard's Gloves",
		waist="Sorcerer's belt",
		back="Merciful Cape",
	    legs="Jet Seraweels",
		neck="Spider Torque",
		ring1="Snow Ring",
		ammo="Sturm's Report",
		ring2="Tamas Ring",
		ear2="Abyssal Earring",
		ear1="Loquacious Earring",
		feet="Sorcerer's Sabots"}

	sets.midcast.Sleep = {
		main="Claustrum",
		sub="Dark Grip",
		head="Igqira Tiara",
		body="Wizard's Coat",
		hands="Bricta's Cuffs",
		neck="Spider Torque",
		waist="Sorcerer's belt",
		back="Prism Cape",
		legs="Igqira Lappas",
		feet="Oracle's Pigaches",
		ammo="Sturm's Report",
		ring1="Snow Ring",
		ring2="Tamas Ring",
		ear1="Loquacious Earring",
		ear2="Abyssal Earring"}
		
	sets.midcast['Sleep II'] = sets.midcast.Sleep
	
	sets.midcast.Sleepga = sets.midcast.Sleep
	
	sets.midcast['Sleepga II'] = sets.midcast.Sleep
		
	sets.midcast['Dark Magic'] = {
	    main="Claustrum",
		sub="Dark Grip",
	    head="Igqira Tiara",
		waist="Sorcerer's belt",
		body="Wizard's Coat",
		legs="Wizard's Tonban",
		hands="Sorcerer's Gloves",
		neck="Dark Torque",
		ring1="Tamas Ring",
		back="Merciful Cape",
		ring2="Snow Ring",
		ammo="Sturm's Report",
		ear2="Abyssal Earring",
		ear1="Dark Earring",
		feet="Igqira Huaraches"}
		
	-- Nuking Sets -- Ctrl + F11 Toggles Resistance & Normal Sets --
	
    sets.midcast['Elemental Magic'] = { 
	    main="Claustrum",
		sub="Bugard Leather Strap +1",
        head="Sorcerer's Petasos",
		neck="Lemegeton medallion +1",
		body="Igqira Weskit",
		hands="Zenith Mitts",
		waist="Penitent's Rope",
        back="Prism Cape",
		legs="Jet Seraweels",
		ring2="Tamas Ring",
		ring1="Snow Ring",
		ear1="Abyssal Earring",
		ammo="Phtm. Tathlum",
		ear2="Moldavite Earring",
		feet="Custom M boots"}
		
	sets.midcast['Elemental Magic'].Resistant = { 
		main="Claustrum",
		sub="Bugard Leather Strap +1",
        head="Sorcerer's Petasos",
		neck="Lemegeton medallion +1",
		body="Igqira Weskit",
		hands="Zenith Mitts",
		waist="Penitent's Rope",
        back="Prism Cape",
		legs="Jet Seraweels",
		ring2="Tamas Ring",
		ring1="Snow Ring",
		ear1="Abyssal Earring",
		ammo="Phtm. Tathlum",
		ear2="Moldavite Earring",
		feet="Custom m boots"}
    
    -- Resting Set --
    
	sets.resting = {
	    main="Claustrum",
		sub="Bugard Leather Strap +1",
        body="Oracle's Robe",
        waist="Mohbwa Sash",
		neck="Beak Necklace +1",
		hands="Oracle's Gloves",
		legs="Oracle's Braconi",
		ear2="Relaxing Earring",
		ear1="Rapture Earring",
		head="Oracle's Cap",
		ring1="Star Ring",
		ring2="Star Ring",
		feet="Avocat Pigaches",
		ammo="Bibiki Seashell"}

    -- Idle Set --
	
	sets.idle = { 
	    main="Claustrum",sub="Bugard Leather Strap +1",
        body="Dalmatica",
		ear1="Loquacious Earring",
		ear2="Static Earring",
		neck="Lemegeton medallion +1",
		waist="Penitent's Rope",
		back="Ixion Cape",
		legs="Jet Seraweels",
		head="Sorcerer's Petasos",
		hands="Zenith Mitts",
		ring1="Defending Ring",
		ring2="Shadow Ring",
		feet="Herald's Gaiters",
		ammo="Bibiki Seashell"}
	
	-- Ctrl + F12 Toggles -- To show people my sets. --
	
    sets.idle.Refresh = { 
	    main="Claustrum",sub="Bugard Strap +1",
        body="Dalmatica",
		ear1="Loquacious Earring",
		ear2="Static Earring",
		neck="Lemegeton medallion +1",
		waist="Sorcerer's belt",
		back="Hexerei Cape",
		legs="Jet Seraweels",
		head="Sorcerer's Petasos +1",
		hands="Zenith Mitts +1",
		ring1="Defending Ring",
		ring2="Tamas Ring",
		feet="Herald's Gaiters",
		ammo="Bibiki Seashell"}

	sets.idle.Enfeeb =  {
	    main="Claustrum",
	    head="Genie Tiara",
		waist="Sorcerer's belt",
		body="Wizard's Coat",
		legs="Igqira Lappas",
		hands="Oracle's Gloves",
		neck="Enfeebling Torque",
		ring1="Snow Ring",
		ring2="Tamas Ring",
		ear2="Abyssal Earring",
		ammo="Phtm. Tathlum",
		ear1="Loquacious Earring",
		back="Altruistic Cape",
		feet="Avocat Pigaches"}

	sets.idle.Debuff = {
		main="Claustrum",sub="Thunder Grip",
		head="Sorcerer's Petasos +1",
		body="Sorcerer's Coat +1",
		hands="Wizard's Gloves +1",
		waist="Sorcerer's belt",
		back="Merciful Cape",
	    legs="Jet Seraweels",
		neck="Elemental Torque",
		ring1="Snow Ring",
		ammo="Phtm. Tathlum",
		ring2="Tamas Ring",
		ear2="Abyssal Earring",
		ear1="Loquacious Earring",
		feet="Sorcerer's Sabots +1"}
		
	sets.idle.Dark = {
	    main="Claustrum",sub="Dark Grip",
	    head="Nashira Turban",
		waist="Sorcerer's belt",
		body="Nashira Manteel",
		legs="Wizard's Tonban",
		hands="Sorcerer's Gloves",
		neck="Dark Torque",
		ring1="Insect Ring",
		back="Merciful Cape",
		ring2="Tamas Ring",
		ammo="Sturm's Report",
		ear2="Abyssal Earring",
		ear1="Loquacious Earring",
		feet="Genie Huaraches"}
		
	sets.idle.Nuke = { 
	    main="Claustrum",sub="Bugard Leather Strap +1",
        head="Sorcerer's Petasos",
		neck="Lemegeton medallion +1",
		body="Genie Weskit",
		hands="Zenith Mitts",
		waist="Sorcerer's belt",
        back="Ixion Cape",
		legs="Jet Seraweels",
		ring2="Tamas Ring",
		ring1="Snow Ring",
		ear1="Novio Earring",
		ammo="Phtm. Tathlum",
		ear2="Moldavite Earring",
		feet="Sorcerer's Sabots"}
		
	sets.idle.NukeRes = { 
		main="Claustrum",sub="Thunder Grip",
        head="Sorcerer's Petasos +1",
		neck="Lemegeton medallion +1",
		body="Genie Weskit",
		hands="Wizard's Gloves",
		waist="Sorcerer's belt",
        back="Ixion Cape",
		legs="Jet Seraweels",
		ring2="Tamas Ring",
		ring1="Snow Ring",
		ear1="Novio Earring",
		ear2="Moldavite Earring",
		ammo="Sturm's Report",
		feet="Sorcerer's Sabots"}
		
	sets.idle.Show = {
		main="Claustrum",sub="Bugard Leather Strap +1",
		ammo="Sturm's Report",
		head="Nashira Turban",
		body="Nashira Manteel",
		hands="Zenith Mitts +1",
		legs="Shadow Trews",
		feet="Herald's Gaiters",
		neck="Uggalepih Pendant",
		waist="Sorcerer's belt",
		left_ear="Novio Earring",
		right_ear="Static Earring",
		left_ring="Defending Ring",
		right_ring="Snow Ring",
		back="Ixion Cape"}

		
    -- Magic Burst Set -- Alt + Tilde Toggles Magic Burst On/Off --
	
	sets.magicburst = {
		main="Claustrum",sub="Bugard Leather Strap +1",
		head="Demon Helm +1",
		hands="Sorcerer's Gloves",
		legs="Shadow Trews",
		ear2="Static Earring"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events --
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done --

-- Run after the general precast() is done.

function job_midcast(spell, action, spellMap, eventArgs)
	if spell.action_type == "Magic" then
      equip(sets.grips[spell.element])
	end 
end

function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Elemental Magic' or spell.skill == 'Dark Magic' then
		if spell.element == world.weather_element or spell.element == world.day_element then
			equip(sets.obi[spell.element]) 
	    end	
	end	
	if spell.skill == 'Elemental Magic' or spell.skill == 'Dark Magic' then
		if spell.element == world.weather_element then
			equip(sets.staff[spell.element]) 
		end
	end
	if spell.skill == 'Elemental Magic' and world.day_element == 'Fire' then
		equip(sets.boots)
    end
	if spell.action_type == "Magic" and state.TreasureMode.value == 'Tag' then
		equip(sets.TreasureHunter)
		equip(sets.grips[spell.element])
	end
	if spell.skill == 'Elemental Magic' and state.MagicBurst.value then
        equip(sets.magicburst)
		end
	if spell.skill == 'Elemental Magic' then
		if spell.element == world.day_element then
			equip(sets.tonban)
        end
		if player.mpp < 51 then
			equip({neck="Uggalepih Pendant"})
		end
	end
	if spell.english == 'Drain' or spell.english == 'Aspir' then
		if world.weather_element == 'Dark' then
			equip(sets.staff2)
		end
	end
end
	  
function job_aftercast(spell)
    if spell.english == 'Drain' or spell.english == 'Aspir' then
	    send_command('@wait 50;input /echo ------- '..spell.english..' is Ready!!! -------')
	end	
	if spell.english == 'Stun' then
	    send_command('@wait 37;input /echo ------- '..spell.english..' is Ready!!! -------')
	end	
	if spell.english == 'Sleep' or spell.english == 'Sleepga' then
		send_command('@wait 50;input /echo ------- '..spell.english..' is wearing off in 10 seconds -------')
		send_command('@wait 55;input /echo ------- '..spell.english..' is wearing off in 5 seconds -------')
		send_command('@wait 57;input /echo ------- '..spell.english..' is wearing off in 3 seconds -------')
	elseif spell.english == 'Sleep II' or spell.english == 'Sleepga II' then
		send_command('@wait 80;input /echo ------- '..spell.english..' is wearing off in 10 seconds -------')
		send_command('@wait 85;input /echo ------- '..spell.english..' is wearing off in 5 seconds -------')
		send_command('@wait 87;input /echo ------- '..spell.english..' is wearing off in 3 seconds -------')
	end
	if state.MagicBurst.value == true then
		send_command('gs c toggle MagicBurst')
	end
end

function job_state_change(stateField, newValue, oldValue)
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events --
-------------------------------------------------------------------------------------------------------------------

-- gain == true if the buff was gained, false if it was lost --

function job_buff_change(buff, gain)
    if buff == 'silence' and gain == true then
		send_command('@input /item "Echo Drops" <me>')
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions --
-------------------------------------------------------------------------------------------------------------------

-- Custom spell mapping --

function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if spell.skill == 'Enfeebling Magic' then
            if spell.type == 'WhiteMagic' then
                return 'MndEnfeebles'
            else
                return 'IntEnfeebles'
            end
        end
    end
end

function failcheck()
    if not player.inventory['Static Earring'] then
        windower.add_to_chat(7, "Missing Static Earring")
    end
	if not player.inventory['Tamas Ring'] then
		windower.add_to_chat(7, "Missing Tamas Ring")
	end
	if not player.inventory['Abyssal Earring'] then
		windower.add_to_chat(7, "Missing Abyssal Earring")
	end
end

-- Function to display the current relevant user state when doing an update --

function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
	failcheck()
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job --
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change --

function select_default_macro_book()
     -- Default macro set/book
    if player.sub_job == 'RDM' then
        set_macro_page(1, 8)
    elseif player.sub_job == 'SCH' then
        set_macro_page(1, 8)
    elseif player.sub_job == 'WHM' then
        set_macro_page(1, 8)
	elseif player.sub_job == 'NIN' then
        set_macro_page(8, 8)
    else
        set_macro_page(1, 8)
    end
end
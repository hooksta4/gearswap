-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

	-- Load and initialize the include file.
	include('Mote-Include.lua')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
			state.Buff.Berserk = buffactive.berserk or false
			state.Buff.Warcry = buffactive.warcry or false
			state.Buff.Aggressor = buffactive.aggressor or false
			state.Buff.Retaliation = buffactive.retaliation or false
            state.Buff.Aftermath = buffactive.aftermath or false
			state.Buff['Mighty Strikes'] = buffactive['Mighty Strikes'] or false
end


-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

--    F9 - Cycle Offense Mode (the offensive half of all 'hybrid' melee modes).
--    Ctrl-F9 - Cycle Hybrid Mode (the defensive half of all 'hybrid' melee modes).
--    Alt-F9 - Cycle Ranged Mode.
--    Win-F9 - Cycle Weaponskill Mode.
--    F10 - Activate emergency Physical Defense Mode. Replaces Magical Defense Mode, if that was active.
--    F11 - Activate emergency Magical Defense Mode. Replaces Physical Defense Mode, if that was active.
--    Ctrl-F10 - Cycle type of Physical Defense Mode in use.
--    Alt-F12 - Turns off any emergency defense mode.
--    Alt-F10 - Toggles Kiting Mode.
--    Ctrl-F11 - Cycle Casting Mode.
--    F12 - Update currently equipped gear, and report current status.
--    Ctrl-F12 - Cycle Idle Mode.

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.

function user_setup()
	state.OffenseMode:options('Normal', 'Acc')
	state.HybridMode:options('MDT', 'PDT')
	state.WeaponskillMode:options('Normal', 'Acc')
	state.IdleMode:options('Normal', 'HP')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
    select_default_macro_book()
	end


-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind ^f11')
    send_command('unbind !f11')
    send_command('unbind @f10')
    send_command('unbind @f11')
end

function init_gear_sets()
	
	--------------------------------------
	-- Precast sets
	--------------------------------------
	
	-- Sets to apply to arbitrary JAs
	sets.precast.JA['Souleater'] = {head="Chaos Burgeonet"}

    -- Sets for fast cast gear for spells
	sets.precast.FC = {ear1="Loquacious Earring",legs="Homam Cosciales"}

    -- Fast cast gear for specific spells or spell maps
	sets.precast['Ninjutsu'] = sets.precast.FC

	-- Weaponskill sets
	sets.precast.WS = 
		{head="Hecatomb Cap +1",
		neck="Shadow Gorget",
		ear1="Brutal Earring",
		ear2="Assault Earring",
		body="Armada Hauberk",
		hands="Hct. Mittens +1",
		ring1="Rajas Ring",
		ring2="Flame Ring",
		back="Cerb. Mantle +1",
		waist="Warwolf Belt",
		legs="Hct. Subligar +1",
		feet="Hct. Leggings +1",
		ammo="Bomb Core"}
	sets.precast.WS.Acc = set_combine(sets.precast.WS, 
		{waist="Life Belt",
		ring2="Toreador's Ring"})
	

	-- Specific weaponskill sets.
	--sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Guillotine'] = set_combine (sets.precast.WS, {neck="Snow Gorget",ammo="Fire Bomblet"})
	
	--------------------------------------
	-- Midcast sets
	--------------------------------------

    -- Generic spell recast set
	sets.midcast.FastRecast = {ear1="Loquacious Earring"}
	
	sets.midcast['Dark Magic'] = {ear1="Dark Earring",ear2="Abyssal Earring",neck="Dark Torque",head="Chaos Burgeonet",body="Demon's Harness +1",feet="Inferno Sabots +1",hands="Blood Finger Gauntlets",legs="Abyss Flanchard"}
	-- Specific spells
	
		
	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------
	
	-- Resting sets
	sets.resting = 
		{head="",
		neck="Orochi Nodowa +1",
		ear1="Brutal Earring",
		ear2="Assault Earring",
		body="Vampire Cloak",
		hands="Homam Manopolas",
		ring1="Rajas Ring",
		ring2="Blitz Ring",
		back="Cuchulain's Mantle",
		waist="Hierarch Belt",
		legs="Blood Cuisses",
		feet="Homam Gambieras",
		ammo="Bomb Core"}
	 
	-- Idle sets
	sets.idle = 
		{head="",
		neck="Parade Gorget",
		ear1="Brutal Earring",
		ear2="Assault Earring",
		body="Vampire Cloak",
		hands="Homam Manopolas",
		ring1="Rajas Ring",
		ring2="Blitz Ring",
		back="Cuchulain's Mantle",
		waist="Sonic Belt +1",
		legs="Blood Cuisses",
		feet="Homam Gambieras",
		ammo="Bomb Core"}

	sets.idle.Town = 
		{head="",
		neck="Justice Torque",
		ear1="Brutal Earring",
		ear2="Assault Earring",
		body="Vampire Cloak +1",
		hands="Homam Manopolas",
		ring1="Rajas Ring",
		ring2="Blitz Ring",
		back="Cuchulain's Mantle",
		waist="Sonic Belt +1",
		legs="Blood Cuisses",
		feet="Homam Gambieras",
		ammo="Bomb Core"}
		
	-- Defense sets
	sets.defense.PDT = 
		{head="Genbu's Kabuto",
		neck="Tempered Chain",
        body="Kaiser Cuirass",
		hands="Kaiser Handschuhs",
		ring1="Rajas Ring",
		ring2="Blitz Ring",
        back="Gigant Mantle",
		waist="Sonic Belt +1",
		legs="Dst. Subligar +1",
		feet="Dst. Leggings +1",
		ammo="White Tathlum"}

	sets.defense.HP = 
		{head="Genbu's Kabuto",
		neck="Tempered Chain",
		ear1="Harmonius Earring",
		ear2="Harmonius Earring",
        body="Kaiser Cuirass",
		hands="Seiryu's Kote",
		ring1="Rajas Ring",
		ring2="Blitz Ring",
        back="Gigant Mantle",
		waist="Marid Belt +1",
		legs="Byakko's Haidate",
		feet="Hermes' Sandals +1",
		ammo="White Tathlum"}

	sets.defense.MDT = 
		{head="Coral Visor +1",
		neck="Tempered Chain",
		ear1="Merman's Earring",
		ear2="Merman's Earring",
        body="Coral Scale Mail +1",
		hands="Coral Fng. Gnt. +1",
		ring1="Merman's Ring",
		ring2="Merman's Ring",
        back="Lamia Mantle +1",
		waist="Resolute Belt",
		legs="Coral Cuisses +1",
		feet="Askar Gambieras",
		ammo="White Tathlum"}
	
    -- Gear to wear for kiting
	sets.Kiting = {feet="Hermes' Sandals +1"}
	sets.hercule_ring = {ring2="Hercules' ring"}
	

	--------------------------------------
	-- Engaged sets
	--------------------------------------

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group
	sets.engaged = 
		{head="Walahra Turban",
		neck="Justice Torque",
		ear1="Brutal Earring",
		ear2="Assault Earring",
		body="Askar Korazin",
		hands="Dusk Gloves +1",
		ring1="Rajas Ring",
		ring2="Blitz Ring",
		back="Cuchulain's Mantle",
		waist="Sonic Belt +1",
		legs="Homam Cosciales",
		feet="Homam Gambieras",
		ammo="Fire Bomblet"}
	sets.engaged.Acc = set_combine(sets.engaged, 
		{head="Ace's Helm",
		body="Armada Hauberk",
		hands="Dusk Gloves +1",
		ring1="Toreador's Ring",
		ring2="Rajas Ring",
		back="Cuchulain's Mantle",
		waist="Sonic Belt +1",
		legs="Onyx Cuisses",
		feet="Onyx Sollerets",
		ammo="Fire Bomblet"})

end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic target handling to be done.
function job_pretarget(spell, action, spellMap, eventArgs)

end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
	
end

-- Run after the default precast() is done.
-- eventArgs is the same one used in job_precast, in case information needs to be persisted.
function job_post_precast(spell, action, spellMap, eventArgs)

end


-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)

end

-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)

end

-- Runs when a pet initiates an action.
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_pet_midcast(spell, action, spellMap, eventArgs)

end

-- Run after the default pet midcast() is done.
-- eventArgs is the same one used in job_pet_midcast, in case information needs to be persisted.
function job_pet_post_midcast(spell, action, spellMap, eventArgs)

end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
if player.status =='Engaged' then
		equip(sets.engaged)
	else
		equip(sets.Idle)
	end
		if spell.english == 'Mighty Strikes' then
		send_command('@wait 50; input /echo ------- Mighty Strikes Wearing in 10 seconds!! -------')
	end
end

-- Run after the default aftercast() is done.
-- eventArgs is the same one used in job_aftercast, in case information needs to be persisted.
function job_post_aftercast(spell, action, spellMap, eventArgs)

end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_pet_aftercast(spell, action, spellMap, eventArgs)

end

-- Run after the default pet aftercast() is done.
-- eventArgs is the same one used in job_pet_aftercast, in case information needs to be persisted.
function job_pet_post_aftercast(spell, action, spellMap, eventArgs)

end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when the player's status changes.
--function job_status_change(newStatus, oldStatus, eventArgs)
 --if T{'Idle','Resting'}:contains(new) then
--		if areas.Town:contains(world.zone) then
--			windower.add_to_chat(121, "Town Gear")
--			equip(sets.idle.Town)
--		else	
--			if PDT == 1 then
--			if buffactive['Weakness'] or player.hpp < 30 then
--					equip(sets.defense.PDT)
--								end
--			elseif MDT == 1 then
--				equip(sets.defense.MDT)
--			elseif new == "Resting" then
--				equip(sets.Resting)
--			else
--				equip(sets.idle)
--			end
-- end 
--		elseif new == 'Engaged' then
		
 -- Engaged Sets
--		if PDT == 1 then
--			if buffactive['Weakness'] or player.hpp < 30 then
--				equip(sets.defense.PDT)
--			else
--				equip(sets.idle)
--			end
--		elseif MDT == 1 then
--			equip(sets.defense.MDT)
--		end
--    end
-- end

-- Called when the player's pet's status changes.
function job_pet_status_change(newStatus, oldStatus, eventArgs)

end

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)

end

-- Called when a generally-handled state value has been changed.
function job_state_change(stateField, newValue, oldValue)

end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Called before the Include starts constructing melee/idle/resting sets.
-- Can customize state or custom melee class values at this point.
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_handle_equipping_gear(status, eventArgs)

end

-- Custom spell mapping.
-- Return custom spellMap value that can override the default spell mapping.
-- Don't return anything to allow default spell mapping to be used.
function job_get_spell_map(spell, default_spell_map)

end

-- Return a customized weaponskill mode to use for weaponskill sets.
-- Don't return anything if you're not overriding the default value.
function get_custom_wsmode(spell, spellMap, default_wsmode)

end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.hpp < 50 then 
		idleSet = set_combine(sets.idle, sets.hercule_ring)
	end
	return idleSet
end

-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
    	
	return meleeSet
end

-- Modify the default defense set after it was constructed.
function customize_defense_set(defenseSet)
	return defenseSet
end

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)

end

-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)

end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called for custom player commands.
function job_self_command(cmdParams, eventArgs)

end

-- Job-specific toggles.
function job_toggle_state(field)

end

-- Request job-specific mode lists.
-- Return the list, and the current value for the requested field.
function job_get_option_modes(field)

end

-- Set job-specific mode values.
-- Return true if we recognize and set the requested field.
function job_set_option_mode(field, val)

end

-- Handle auto-targetting based on local setup.
function job_auto_change_target(spell, action, spellMap, eventArgs)

end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'NIN' then
		set_macro_page(4, 2)
	elseif player.sub_job == 'SAM' then
		set_macro_page(5, 2)
	else
		set_macro_page(3, 2)
	end
end
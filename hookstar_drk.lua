--[[ *************************************************************
Almuth's putrid DRK script - handles both relic Scythe and GS
Based on Wren's WHM gearswap .lua for SuperNova FFXI
Save as windower/addons/GearSwap/data/DRK.lua
 
Dec 14/2020 OC	- First version.

To be used with the cancel addon

Macros are used to enter most commands, ie. /console gs c command
************************************************************* --]]
 
 --[[ ******************************************************
  Gearsets - define the various sets of gear we'll wear.
****************************************************** --]]

--[[ Set Summary
idle
pdt
mdt
fastCast
meleeScythe
meleeScytheAM
meleeScytheAcc
meleeScytheAccAM
meleeScytheMaxAcc
meleeScytheMaxAccAM
meleeGS
meleeGSMaxAcc
wsGS
wsGSMaxAcc
wsScythe
wsScytheAcc
wsScytheMaxAcc
scythe
scytheSAMAcc
GS
GSacc
enfeebling
drainAspir
stun
absorb
dread
nuke
shadows
waltz
]]
 
function get_sets()
	-- Idle set is worn when we're standing around doing nothing. We want auto-regen and movement
	sets.idle = {
		ammo		= "Fenrir's Stone", --Moonlit Path
		head		= "Blood Mask",
		body		= "Plastron +1",
		hands		= "Feronia's Bangles",
		legs		= "Blood Cuisses",
		feet		= "Homam Gambieras",
		neck		= "Parade Gorget",
		waist		= "Lycopodium Sash", -- lottery item
		left_ear	= "Brutal Earring",
		right_ear	= "Ethereal Earring",
		left_ring	= "Succor Ring", -- AV drop
		right_ring	= "Patronus Ring",
		back		= "Shadow Mantle",
	}

	-- PDT-% gear
	sets.pdt = {
		ammo		= "Fire Bomblet",
		head		= "Darksteel Cap +1",
		body		= "Dst. Harness +1",
		hands		= "Dst. Mittens +1",
		legs		= "Dst. Subligar +1",
		feet		= "Dst. Leggings +1",
		neck		= "Ancient Torque", -- Cerberus drop
		waist		= "Velocious Belt",
		left_ear	= "Brutal Earring",
		right_ear	= "Ethereal Earring",
		left_ring	= "Succor Ring",
		right_ring	= "Defending Ring",
		back		= "Cuchulain's Mantle", -- Shen drop
	}

	-- MDT-% gear
	sets.mdt = {
		ammo		= "Fire Bomblet",
		head		= "Coral Visor +1",
		body		= "Cor. Scale Mail +1",
		hands		= "Merman's Bangles",
		legs		= "Coral Cuisses +1",
		feet		= "Coral Greaves +1",
		neck		= "Ancient Torque",
		waist		= "Velocious Belt",
		left_ear	= "Brutal Earring",
		right_ear	= "Ethereal Earring",
		left_ring	= "Minerva's Ring",
		right_ring	= "Defending Ring",
		back		= "Cuchulain's Mantle",
	}
 
	-- fast cast set is for casting quickly.  We put this on before the spell is begun, then switch to one of the other sets during cast. Will be further modified on a conditional basis
	sets.fastCast = {
		legs		= "Homam Cosciales",
		left_ear	= "Loquac. Earring",
	}

	-- ~407 acc, 1 STP needed for 7 hit but have 6
	sets.meleeScythe = {
		ammo		= "Bomb Core",
		head		= "Walahra Turban",
		body		= "Askar Korazin", -- Jormy drop
		hands		= "Dusk Gloves +1",
		legs		= "Homam Cosciales",
		feet		= "Homam Gambieras",
		neck		= "Justice Torque",
		waist		= "Velocious Belt",
		left_ear	= "Brutal Earring",
		right_ear	= "Ethereal Earring",
		left_ring	= "Toreador's Ring", -- dyna sandy mega boss drop
		right_ring	= "Blitz Ring",
		back		= "Cerb. Mantle +1",
	}

	-- ~419 acc, 1 STP needed for 7 hit but have 6, for Catastrophe Haste aftermath
	sets.meleeScytheAM = {
		ammo		= "Bomb Core",
		head		= "Ace's Helm",
		body		= "Askar Korazin",
		hands		= "Dusk Gloves +1",
		legs		= "Askar Dirs", -- dyn qufim drop
		feet		= "Homam Gambieras",
		neck		= "Justice Torque",
		waist		= "Velocious Belt",
		left_ear	= "Brutal Earring",
		right_ear	= "Ethereal Earring",
		left_ring	= "Toreador's Ring",
		right_ring	= "Blitz Ring",
		back		= "Cerb. Mantle +1",
	}

	-- ~447 acc, 1 STP needed for 7 hit
	sets.meleeScytheAcc = {
		ammo		= "Fire Bomblet",
		head		= "Walahra Turban",
		body		= "Nocturnus Mail", -- DL drop
		hands		= "Dusk Gloves +1",
		legs		= "Homam Cosciales",
		feet		= "Homam Gambieras",
		neck		= "Ancient Torque",
		waist		= "Velocious Belt",
		left_ear	= "Brutal Earring",
		right_ear	= "Ethereal Earring",
		left_ring	= "Toreador's Ring",
		right_ring	= "Blitz Ring",
		back		= "Cuchulain's Mantle",
	}

	-- ~449 acc, 1 STP needed for 7 hit
	sets.meleeScytheAccAM = {
		ammo		= "Bomb Core",
		head		= "Ace's Helm",
		body		= "Nocturnus Mail",
		hands		= "Homam Manopolas",
		legs		= "Askar Dirs",
		feet		= "Aurum Sabatons",
		neck		= "Ancient Torque",
		waist		= "Velocious Belt",
		left_ear	= "Brutal Earring",
		right_ear	= "Ethereal Earring",
		left_ring	= "Strigoi Ring",
		right_ring	= "Blitz Ring",
		back		= "Cerb. Mantle +1",
	}

	-- ~464 acc, 1 STP needed for 7 hit
	sets.meleeScytheMaxAcc = {
		ammo		= "Fire Bomblet",
		head		= "Ace's Helm",
		body		= "Armada Hauberk",
		hands		= "Homam Manopolas",
		legs		= "Homam Cosciales",
		feet		= "Aurum Sabatons",
		neck		= "Ancient Torque",
		waist		= "Velocious Belt",
		left_ear	= "Brutal Earring",
		right_ear	= "Ethereal Earring",
		left_ring	= "Toreador's Ring",
		right_ring	= "Blitz Ring",
		back		= "Cuchulain's Mantle",
	}

	-- ~469 acc, 1 STP needed for 7 hit
	sets.meleeScytheMaxAccAM = {
		ammo		= "Fire Bomblet",
		head		= "Ace's Helm",
		body		= "Armada Hauberk",
		hands		= "Homam Manopolas",
		legs		= "Askar Dirs",
		feet		= "Aurum Sabatons",
		neck		= "Ancient Torque",
		waist		= "Velocious Belt",
		left_ear	= "Brutal Earring",
		right_ear	= "Ethereal Earring",
		left_ring	= "Toreador's Ring",
		right_ring	= "Blitz Ring",
		back		= "Cuchulain's Mantle",
	}

	-- ~398 + 10 acc
	sets.wsScythe = {
		ammo		= "Bomb Core",
		head		= "Hecatomb Cap +1",
		body		= "Nocturnus Mail",
		hands		= "Alkyoneus's Brc.",
		legs		= "Onyx Cuisses",
		feet		= "Hct. Leggings +1",
		neck		= "Fotia Gorget",
		waist		= "Warwolf Belt",
		left_ear	= "Brutal Earring",
		right_ear	= "Harmonius Earring",
		left_ring	= "Strigoi Ring",
		right_ring	= "Flame Ring", -- Make
		back		= "Cerb. Mantle +1",
	}

	-- ~437 + 10 acc
	sets.wsScytheAcc = {
		ammo		= "Fire Bomblet",
		head		= "Hecatomb Cap +1",
		body		= "Armada Hauberk",
		hands		= "Hct. Mittens +1",
		legs		= "Hct. Subligar +1",
		feet		= "Hct. Leggings +1",
		neck		= "Fotia Gorget",
		waist		= "Warwolf Belt",
		left_ear	= "Brutal Earring",
		right_ear	= "Ethereal Earring",
		left_ring	= "Strigoi Ring",
		right_ring	= "Flame Ring",
		back		= "Cuchulain's Mantle",
	}

	-- ~452 + 17 acc
	sets.wsScytheMaxAcc = {
		ammo		= "Fire Bomblet",
		head		= "Hecatomb Cap +1",
		body		= "Armada Hauberk",
		hands		= "Hct. Mittens +1",
		legs		= "Hct. Subligar +1",
		feet		= "Hct. Leggings +1",
		neck		= "Fotia Gorget",
		waist		= "Virtuoso Belt",
		left_ear	= "Brutal Earring",
		right_ear	= "Ethereal Earring",
		left_ring	= "Strigoi Ring",
		right_ring	= "Blitz Ring",
		back		= "Abyss Cape",
	}

	-- sub out fire bomblet for bomb core while Hasso is active or are /DRG
	sets.meleeGS = {
		ammo		= "Fire Bomblet",
		head		= "Walahra Turban",
		body		= "Askar Korazin",
		hands		= "Dusk Gloves +1",
		legs		= "Homam Cosciales",
		feet		= "Homam Gambieras",
		neck		= "Ancient Torque",
		waist		= "Velocious belt",
		left_ear	= "Brutal Earring",
		right_ear	= "Assault Earring",
		left_ring	= "Toreador's Ring",
		right_ring	= "Blitz Ring",
		back		= "Cuchulain's Mantle",
	}

	-- ~440 acc, not enough extra acc to warrant a mid acc set
	sets.meleeGSMaxAcc = {
		ammo		= "Fire Bomblet",
		head		= "Ace's Helm",
		body		= "Armada Hauberk",
		hands		= "Homam Manopolas",
		legs		= "Homam Cosciales",
		feet		= "Aurum Sabatons",
		neck		= "Ancient Torque",
		waist		= "Velocious Belt",
		left_ear	= "Brutal Earring",
		right_ear	= "Assault Earring",
		left_ring	= "Toreador's Ring",
		right_ring	= "Blitz Ring",
		back		= "Cuchulain's Mantle",
	}

	-- ~396 + 10 acc
	sets.wsGS = {
		ammo		= "Fire Bomblet",
		head		= "Hecatomb Cap +1",
		body		= "Nocturnus Mail",
		hands		= "Hct. Mittens +1",
		legs		= "Onyx Cuisses",
		feet		= "Hct. Leggings +1",
		neck		= "Fotia Gorget",
		waist		= "Potent Belt",
		left_ear	= "Brutal Earring",
		right_ear	= "Harmonius Earring",
		left_ring	= "Strigoi Ring",
		right_ring	= "Flame Ring",
		back		= "Cuchulain's Mantle",
	}
	
	-- ~416 + 17 acc
	sets.wsGSMaxAcc = {
		ammo		= "Fire Bomblet",
		head		= "Hecatomb Cap +1",
		body		= "Armada Hauberk",
		hands		= "Hct. Mittens +1",
		legs		= "Oily Trousers",
		feet		= "Hct. Leggings +1",
		neck		= "Fotia Gorget",
		waist		= "Potent Belt",
		left_ear	= "Brutal Earring",
		right_ear	= "Harmonius Earring",
		left_ring	= "Strigoi Ring",
		right_ring	= "Flame Ring",
		back		= "Abyss Cape",
	}

	-- sets for weapons
	sets.scythe = {
		main		= "Apocalypse",
		sub			= "Pole Grip",
	}

	-- /SAM needs +3 stp, and unfortunately rose strap is what will have to be used for it
	sets.scytheSAMAcc = {
		main		= "Apocalypse",
		sub			= "Rose Strap", -- overlord bakgodek drop
	}

	-- GS needs +3 stp for both /SAM and not
	sets.GS = {
		main		= "Ragnarok",
		sub			= "Pole Grip",
	}

	-- not using Askar meand rose strap
	sets.GSacc = {
		main		= "Ragnarok",
		sub			= "Rose Strap",
	}

	-- enfeebling magic set, geared for accuracy
	sets.enfeebling = {
		ammo		= "Phtm. Tathlum",
		head		= "Homam Zucchetto",
		body		= "Corselet +1",
		hands		= "Abs. Gauntlets +1",
		legs		= "Jet Seraweels",
		feet		= "Custom M Boots",
		neck		= "Enfeebling Torque",
		waist		= "Ocean Rope",
		left_ear	= "Enfeebling Earring",
		right_ear	= "Incubus Earring +1",
		left_ring	= "Omega Ring",
		right_ring	= "Balrahn's Ring",
		back		= "Abyss Cape",
	}

	-- maximize dark magic skill for damage
	sets.drainAspir = {
		ammo		= "Phtm. Tathlum",
		head		= "Chs. Burgeonet +1",
		body		= "Dmn. Harness +1",
		hands		= "Blood Fng. Gnt.",
		legs		= "Abs. Flanchard +1",
		feet		= "Custom M Boots",
		neck		= "Dark Torque",
		waist		= "Crimson Belt", -- overlord bakgodek drop
		left_ear	= "Hirudinea Earring", -- dyna jeuno mega boss drop
		right_ear	= "Ethereal Earring",
		left_ring	= "Omega Ring",
		right_ring	= "Balrahn's Ring",
		back		= "Merciful Cape",
	}

	-- max out accuracy, enhances absorb equips besides mythic don't work...
	sets.absorb = {
		ammo		= "Phtm. Tathlum",
		head		= "Chs. Burgeonet +1",
		body		= "Corselet +1",
		hands		= "Abs. Gauntlets +1",
		legs		= "Abs. Flanchard +1",
		feet		= "Custom M Boots",
		neck		= "Dark Torque",
		waist		= "Crimson Belt",
		left_ear	= "Dark Earring",
		right_ear	= "Ethereal Earring",
		left_ring	= "Omega Ring",
		right_ring	= "Balrahn's Ring",
		back		= "Abyss Cape",
	}

	-- haste and acc on stun
	sets.stun = {
		ammo		= "Phtm. Tathlum",
		head		= "Walahra Turban",
		body		= "Corselet +1",
		hands		= "Dusk Gloves +1",
		legs		= "Homam Cosciales",
		feet		= "Homam Gambieras",
		neck		= "Dark Torque",
		waist		= "Velocious Belt",
		left_ear	= "Dark Earring",
		right_ear	= "Ethereal Earring",
		left_ring	= "Omega Ring",
		right_ring	= "Balrahn's Ring",
		back		= "Abyss Cape",
	}

	-- haste + max HP increase, spikes absorb amount is half max HP when it's casted
	sets.dread = {
		ammo		= "White Tathlum",
		head		= "Walahra Turban",
		body		= "Blood Scale Mail",
		hands		= "Dusk Gloves +1",
		legs		= "Homam Cosciales",
		feet		= "Homam Gambieras",
		neck		= "Bloodbead Gorget",
		waist		= "Velocious Belt",
		left_ear	= "Cassie Earring",
		right_ear	= "Harmonius Earring",
		left_ring	= "Bomb Queen Ring",
		right_ring	= "Bloodbead Ring",
		back		= "Gigant Mantle",
	}

	-- this is stupid but might as well have a nuking set
	sets.nuke = {
		ammo		= "Phtm. Tathlum",
		head		= "Demon Helm +1",
		body		= "Corselet +1",
		hands		= "Abs. Gauntlets +1",
		legs		= "Jet Seraweels",
		feet		= "Shrewd Pumps",
		neck		= "Lmg. Medallion +1",
		waist		= "Ocean Rope",
		left_ear	= "Novio Earring",
		right_ear	= "Moldavite Earring",
		left_ring	= "Galdr Ring",
		right_ring	= "Tamas Ring",
		back		= "Abyss Cape",
	}

	-- max recast reduction while filling the rest with evasion
	sets.shadows = {
		ammo		= "Fenrir's Stone",
		head		= "Walahra Turban",
		body		= "Antares Harness",
		hands		= "Dusk Gloves +1",
		legs		= "Homam Cosciales",
		feet		= "Homam Gambieras",
		neck		= "Evasion Torque",
		waist		= "Velocious Belt",
		left_ear	= "Loquac. Earring",
		right_ear	= "Novia Earring",
		left_ring	= "Wivre Ring +1",
		right_ring	= "Wivre Ring +1",
		back		= "Boxer's Mantle",
	}

	-- CHR and VIT for waltz heals; not particularly optimized
	sets.waltz = {
		ammo		= "Fenrir's Stone",
		head		= "Ree's Headgear", -- Tiamat drop
		body		= "Antares Harness",
		hands		= "Feronia's Bangles",
		legs		= "Homam Cosciales",
		feet		= "Homam Gambieras",
		neck		= "Temp. Torque",
		waist		= "Corsette +1",
		left_ear	= "Merman's Earring",
		right_ear	= "Merman's Earring",
		left_ring	= "Heavens Ring +1",
		right_ring	= "Heavens Ring +1",
		back		= "Shadow Mantle",
	}
end
 
 --[[ ******************************************************
  Functions - Handle the logic for equipping the gearsets
****************************************************** --]]
 
 -- equip our idle set
function determineIdle()
	if pdt then -- PDT-% set
		equip(sets.pdt)
		windower.add_to_chat(8,'[PDT-%]')
	elseif mdt then -- MDT-% set
		if buffactive['shell'] then -- safe to assume shell buff is Shell IV
			equip(sets.mdt,{left_ring= "Shadow Ring"})
			windower.add_to_chat(8,'[MDT-% w/ Shell IV]')
		else
			equip(sets.mdt)
			windower.add_to_chat(8,'[MDT-%]')
		end
	elseif player.status == "Engaged" then
		determineMelee()
	elseif move then -- normal idle set with move+
		equip(sets.idle)
		windower.add_to_chat(8,'[Move/Regen]')
	else -- this shouldn't happen
		add_to_chat(122,'Idle set determination failure.')
	end
end

 -- equip melee set depending on weapon type, acc requirement, and Catastrophe aftermath
function determineMelee()
	meleeSet = sets.meleeGS
	if scytheMode then -- pick TP set depending on weapon type and whether or not Catastrophe AM is active
		if buffactive ['aftermath'] then -- less gear haste needed when Catastrophe AM is active
			if accMode then
				meleeSet = sets.meleeScytheAccAM
				windower.add_to_chat(8,'[TP acc AM]')
			elseif maxAccMode then
				meleeSet = sets.meleeScytheMaxAccAM
				windower.add_to_chat(8,'[TP max acc AM]')
			else
				meleeSet = sets.meleeScytheAM
				windower.add_to_chat(8,'[TP atk AM]')
			end
		else
			if accMode then
				meleeSet = sets.meleeScytheAcc
				windower.add_to_chat(8,'[TP acc]')
			elseif maxAccMode then
				meleeSet = sets.meleeScytheMaxAcc
				windower.add_to_chat(8,'[TP max acc]')
			else
				meleeSet = sets.meleeScythe
				windower.add_to_chat(8,'[TP atk]')
			end
		end
	else
		if maxAccMode then
			meleeSet = sets.meleeGSMaxAcc
			windower.add_to_chat(8,'[TP acc]')
		else
			meleeSet = sets.meleeGS
			windower.add_to_chat(8,'[TP atk]')
		end
	end
	if buffactive ['souleater'] then -- equip souleater bonus damage gear
		if scytheMode and buffactive ['aftermath'] then -- use SE pants because haste pants are not needed
			meleeSet = set_combine(meleeSet, {legs= "Sable Cuisses"})
		else --otherwise SE body
			meleeSet = set_combine(meleeSet, {body= "Gloom Breastplate"})
		end
		windower.add_to_chat(8,'[...with Souleater]')
	end
	equip(meleeSet)
end

function handleMidcast(spell) -- this exists solely as a way for equipping midcast gear outside of the midcast function
	if spell.skill == 'Dark Magic' then
		if spell.english == 'Stun' then
			equip(sets.stun)
			windower.add_to_chat(8,'[Stun]')
		elseif spell.english == 'Dread Spikes' then
			equip(sets.dread)
			windower.add_to_chat(8,'[Dread Spikes]')
		elseif spell.english:startswith 'Drain' or spell.english == 'Aspir' or spell.english:startswith 'Bio' then
			local suckSet = sets.drainAspir
			windower.add_to_chat(8,'[Drain/Aspir]')
			if world.moon_pct <= 5 or (world.moon_pct <= 10 and world.moon == 'Waning Crescent') then -- extra dark magic skill during new moon, GS/topaz mismatch somewhere making the direct phase check for new moon not work
				suckSet = set_combine(suckSet, {feet= "Inferno Sabots +1"})
				windower.add_to_chat(8,'[New moon dark skill boost]')
			end
			if spell.english:startswith 'Bio' then -- dark skill for bio, and make it not work with the check for obi
				suckSet = set_combine(suckSet, {left_ear= "Dark Earring"})
			elseif obi_check(spell) then
				suckSet = set_combine(suckSet, {waist= "Hachirin-no-Obi"})
			end
			equip(suckSet)
		else
			equip(sets.absorb)
			windower.add_to_chat(8,'[Absorb]')
		end
	elseif spell.skill == 'Elemental Magic' then
		if obi_check(spell) then
			equip(sets.nuke, {waist= "Hachirin-no-Obi"})
		else
			equip(sets.nuke)
		end
		windower.add_to_chat(8,'[Nuke]')
	elseif spell.english:startswith 'Utsusemi' then
		equip(sets.shadows)
		windower.add_to_chat(8,'[Shadow cast]')
	end
end

function handleWS(spell)
	wsSet = sets.wsGS
	if scytheMode then -- pick WS set depending on weapon type
		if (not accMode and not maxAccMode) or buffactive ['sneak attack'] then -- don't need acc set if doing SAWS
			wsSet = sets.wsScythe
			windower.add_to_chat(8,'[WS atk]')
		elseif maxAccMode then
			wsSet = sets.wsScytheMaxAcc
			windower.add_to_chat(8,'[WS max acc]')
		else
			wsSet = sets.wsScytheAcc
			windower.add_to_chat(8,'[WS acc]')
		end
	else
		if not maxAccMode or buffactive ['sneak attack'] then
			wsSet = sets.wsGS
			windower.add_to_chat(8,'[WS atk]')
		else
			wsSet = sets.wsGSMaxAcc
			windower.add_to_chat(8,'[WS acc]')
		end
	end
	if buffactive ['souleater'] then -- equip souleater bonus damage gear
		wsSet = set_combine(wsSet, {head= "Chs. Burgeonet"})
		windower.add_to_chat(8,'[...with Souleater]')
	end
	equip(wsSet)
end

function obi_check(spell) -- function to handle equipping obis
	local weak_to_element = { -- There is no function for weak to element so we need an array to check for it
	Dark= "Light",
	Light= "Dark",
	Ice= "Fire",
	Wind= "Ice",
	Earth= "Wind",
	Lightning= "Earth",
	Water= "Lightning",
	Fire= "Water",}

	local weakEle = weak_to_element[spell.element]
	if world.weather_element == spell.element or (world.day_element == spell.element and world.weather_element ~= weakEle) then -- equip obi for nukes. Since we're using the all-in-one obi, we don't want to it to equip if weather penalizes while days gives bonus, since it's net 0 bonus. But we do for the opposite, because Iridescence trait makes a single weather bonus stronger than day penalty.
		windower.add_to_chat(8,'[Day/Weather bonus]')
		return true
	else
		--windower.add_to_chat(8,'[No obi bonus]')
		return false
	end
end

--[[ ******************************************************
 Casting functions - these functions run automatically when
 we cast a spell, use a job ability, rest for MP, and so on
****************************************************** --]]
 
 -- equip spell cast time reduction stuff
function precast(spell)
	if spell.action_type == 'Magic' then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		if spell_recasts[spell.recast_id] > 30 then -- 1/2 second margin
			add_to_chat(167,spell.english .. ' is still on cooldown.')
			cancel_spell()
		else
			if buffactive['hasso'] then
				cast_delay(0.2)
				send_command('cancel hasso')
			elseif buffactive['seigan'] then
				cast_delay(0.2)
				send_command('cancel seigan')
			end
			if spell.cast_time <= 1 then -- skip right to midcast for spells with a casting time that's fast enough
				handleMidcast(spell)
			else
				if spell.english == 'Utsusemi: Ichi' and niShadows then -- cancel copy image if it's from Ni
					send_command('@wait 3.8;cancel copy image,copy image (2),copy image (3),copy image (4+)') -- Ichi casting time is base 4.5s
				elseif spell.english == 'Sneak' and spell.target.type == 'SELF' and buffactive['sneak'] then		
					send_command('cancel sneak')
				elseif spell.english:startswith('Monomi') and buffactive['sneak'] then
					send_command('cancel sneak')
				end
			end
		end
	elseif spell.type == 'WeaponSkill' then -- equip WS set
		handleWS(spell)
	elseif spell.english == 'Spectral Jig' and buffactive['sneak'] then -- some sneak cancelling automation
		cast_delay(0.2)
		send_command('cancel sneak')
	elseif spell.english == "Arcane Circle" then
		equip({feet = "Chaos Sollerets"})
	elseif spell.english == 'Third Eye' and (buffactive['third eye'] or not buffactive['seigan']) then -- ensure you don't waste Third Eye
		add_to_chat(122,'Seigan inactive or Third Eye already active.')
		cancel_spell()
	elseif spell.english:contains('Waltz') then
		equip(sets.waltz)
		windower.add_to_chat(8,'[Waltz]')
	elseif spell.english:contains("Roll") or spell.name == "Double-Up" then
		equip({left_ring = "Luzaf's Ring"})
	end
end
 
 -- determine set to equip based off of spell type
function midcast(spell)
	if spell.cast_time == nil or spell.cast_time > 1 then -- we already equipped the midcast set if the base cast time is 1s or less, nil check is for non-spells
		handleMidcast(spell)
	end
end
 
-- return to idle set as determined by commands
function aftercast(spell)
	if spell.english:startswith 'Utsusemi' and not spell.interrupted then
		if spell.english == 'Utsusemi: Ni' then -- setup the variable for determining whether or not copy image will have to be cancelled for Ichi
			niShadows = true
		else
			niShadows = false
		end
	end
	determineIdle()
end

-- mostly for checking if shell was gained/lost while in MDT-% mode
function buff_change(name,gain)
	if (mdt == true and name == "Shell") or name == "Aftermath" or name == "Souleater" then -- handle MDT-% mode change/SA/TA
		determineIdle()
	end
end

-- automatically equip melee set while engaged
function status_change(new,old)
	determineIdle()
end
 
function sub_job_change(new,old) -- reset everything
	enable('main','sub','range','head','body','hands','legs','feet','neck','waist','left_ear','right_ear','left_ring','right_ring','back')
	move = true
	pdt = false
	mdt = false
	niShadows = false
	accMode = false
	maxAccMode = false
	scytheMode = false
	send_command('wait 1;gs equip idle;wait 1;')
end
 
  --[[ ******************************************************
  Commands - Handle manually-entered commands for GS
****************************************************** --]]

function self_command(m)
	if m == "move" then
		move = true
		pdt = false
		mdt = false
		accMode = false
		maxAccMode = false
		--windower.add_to_chat(8,"Move/Regen set.")
	elseif m == "pdt" or m == "eva" then
		if m == "eva" then
			windower.add_to_chat(122,"No evasion set for DRK. Using PDT-% set instead.")
		end
		move = false
		pdt = true
		mdt = false
		accMode = false
		maxAccMode = false
		--windower.add_to_chat(8,"PDT-% set.")
	elseif m == "mdt" then
		move = false
		pdt = false
		mdt = true
		accMode = false
		maxAccMode = false
		--windower.add_to_chat(8,"MDT-% set.")
	elseif m == "melee" then
		windower.add_to_chat(122,"Valid melee commands: atk, acc, maxacc.")
	elseif m == "atk" then
		move = true
		pdt = false
		mdt = false
		accMode = false
		maxAccMode = false
		if scytheMode then
			equip(sets.scythe)
		else
			equip(sets.GS)
		end
	elseif m == "acc" then
		move = true
		pdt = false
		mdt = false
		if not scytheMode then
			accMode = false
			maxAccMode = true
			equip(sets.GSacc)
		else
			accMode = true
			maxAccMode = false
			if player.sub_job == 'SAM' then
				equip(sets.scytheSAMAcc)
			else
				equip(sets.scythe)
			end
		end
	elseif m == "maxacc" then
		move = true
		pdt = false
		mdt = false
		accMode = false
		maxAccMode = true
		if scytheMode then
			if player.sub_job == 'SAM' then
				equip(sets.scytheSAMAcc)
			else
				equip(sets.scythe)
			end
		else
			equip(sets.GSacc)
		end
	elseif m == "scythe" then
		scytheMode = true
		if (accMode or maxAccMode) and player.sub_job == 'SAM' then
			equip(sets.scytheSAMAcc)
		else
			equip(sets.scythe)
		end
	elseif m == "gs" then
		scytheMode = false
		if accMode then -- no mid acc set for GS, so change over to max acc mode
			accMode = false
			maxAccMode = true
		end
		if maxAccMode then
			equip(sets.GSacc)
		else
			equip(sets.GS)
		end
	elseif m == "relicWS" then
		if scytheMode then
			send_command('input /ws "Catastrophe" <t>')
		else
			send_command('input /ws "Scourge" <t>')
		end
		return
	elseif m == "help" then
		windower.add_to_chat(8,"Valid commands for this DRK script:")
		windower.add_to_chat(8,"move - Equips movement + regen set while not using other sets")
		windower.add_to_chat(8,"pdt - Equips PDT-% set while not using other sets")
		windower.add_to_chat(8,"mdt - Equips MDT-% set while not using other sets")
		windower.add_to_chat(8,"atk - Uses high attack/sufficient acc set for TP and WS")
		windower.add_to_chat(8,"acc - Uses mid level acc for TP and WS")
		windower.add_to_chat(8,"maxacc - Uses max level acc for TP and WS")
		windower.add_to_chat(8,"scythe - Changes to scythe mode")
		windower.add_to_chat(8,"gs - Changes to GS mode")
		windower.add_to_chat(8,"help - You know what this does")
	else
		windower.add_to_chat(8,"Valid commands: move, pdt, mdt, atk, acc, maxacc, scythe, gs, help")
	end
	determineIdle()
end
 
 --[[ ******************************************************
  Code that runs once, when we first swap to our DRK job
****************************************************** --]]

-- initialize global variables
enable('main','sub','range','head','body','hands','legs','feet','neck','waist','left_ear','right_ear','left_ring','right_ring','back')
move = true
pdt = false
mdt = false
accMode = false
maxAccMode = false
scytheMode = false -- defaulting to GS because of that weird bug where WAR augmented relics cause inventories to unsort when zoning, and I have augmented scythe but not GS
niShadows = false

windower.add_to_chat(8,"Valid commands: move, pdt, mdt, atk, acc, maxacc, scythe, gs, help")
send_command('gs validate')
 
-- lockstyles then equips idle set.
send_command('wait 1;gs equip pdt; wait 2;input /lockstyleset 13; wait 1; input /macro book 19; wait 2; input /macro set 1')
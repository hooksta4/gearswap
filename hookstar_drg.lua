

function get_sets()

	------- out of battle sets
	
	sets.idle = {
	
	main = "Gungnir", sub ="Pole Grip", ammo="Bibiki Seashell", head="Ace's Helm", neck="Orochi Nodowa +1", lear="Merman's Earring",
   	body="Nocturnus Mail", hands="homam manopolas", ring1="Rajas Ring", rear="Merman's Earring",
   	waist="Velocious Belt", ring2="Serket Ring", back="Cerb. Mantle +1", legs="Blood Cuisses",
   	feet="Askar Gambieras"
	}
	
	------- melee sets (stats are /blu)
	
	sets.melee = {}
	sets.melee.easy = {
	-- 399 acc, 22/21% Haste
	-- 465 attack, STR+26
	-- +11 Store TP, +9% Double Attack
	-- 267 defense, 298 evasion
		head		="Ace's Helm",
		body		="Nocturnus Mail",
        ammo        ="White Tathlum",		
		hands		="Homam Manopolas",
		legs		="Homam Cosciales",
		feet		="Homam Gambieras",
		neck		="Ancient Torque",
		waist		="Velocious Belt",
		left_ear	="Ethereal Earring",
		right_ear	="Brutal Earring",
		left_ring	="Rajas Ring",
		right_ring	="Blitz Ring",
		back		="Cerb. Mantle +1",
    }
	
	sets.melee.colibri = set_combine(sets.melee.easy,{ -- Greater Colibri
	-- 407 acc, 21/20% haste
	-- 505 attack, STR+31
	-- +12d Store TP, +9% Double Attack
	-- 295 defense, 291 evasion
		head		="Ace's Helm",
	-- (acc cap: 398 on lv81, 407 on lv82)
    })
	
	sets.melee.medium = set_combine(sets.melee.easy,{
	-- 428/421 acc, 20% haste
	-- 463 attack, STR+23
	-- +11 Store TP, +9% Double Attack
	-- 296 defense, 291 evasion
		head		="Ace's Helm",
		neck		="Ire Torque +1",
		right_ring	="Toreador's Ring",
	})
	
	sets.melee.hard = set_combine(sets.melee.medium,{
	-- 440/437 acc, 19% haste
	-- 440 attack, STR+23
	-- +11 Store TP, +9% Double Attack
	-- 286 defense, 291 evasion
		back		="Cuchulain's Mantle",
		hands		="Homam Manopolas",
	})
	
	sets.melee.acc = set_combine(sets.melee.hard,{
	-- 475/468 acc, 9% haste
	-- 416 attack, STR+9
	-- +1 Store TP, +7% Double Attack
	-- 260 defense, 308 evasion
		head		="Optical Hat",
		body		="Hydra Mail +1",
		left_ring	="Toreador's Ring",
	})
	
	------- ranged sets
	
	sets.ranged = {
	}
	
	------- WS sets
	
	sets.ws = {}
	sets.ws.acc = {}
	sets.ws.acc.easy = set_combine(sets.melee.easy,{
	    head		="Hecatomb Cap +1",
		body		="Nocturnus Mail",
		hands		="Hct. Mittens +1",
		legs		="Hct. Subligar +1",
		feet		="Hct. Leggings +1",
		neck		="Fotia Gorget",
		waist		="Warwolf Belt", 
		left_ear	="Harmonius Earring",
		right_ear	="Brutal Earring",
		left_ring	="Rajas Ring",
		right_ring	="Strigoi Ring",
		back		="Cerb. Mantle +1",
	})
	
	sets.ws.acc.colibri = sets.melee.acc.easy
	
	sets.ws.acc.medium = set_combine(sets.melee.medium,{
		head		="Hecatomb Cap +1",
		body		="Hct. Harness +1",
		hands		="Hct. Mittens +1",
		legs		="Hct. Subligar +1",
		feet		="Hct. Leggings +1",
		neck		="Fotia Gorget",
		waist		="Virtuoso Belt",
		left_ear	="Assault Earring",
		right_ear	="Harmonius Earring",
		left_ring	="Rajas Ring",
		right_ring	="Toreador's Ring",
		back		="Cerb. Mantle +1",
	})
	
	sets.ws.acc.hard = set_combine(sets.ws.medium,{
		left_ring	="Toreador's Ring",
	})
	
	sets.ws.acc.acc = set_combine(sets.ws.hard,{
		head		= "Optical Hat",
		back		= "Cuchulain's Mantle",
	})
	
	sets.ws.str = {
		head		="Hecatomb Cap +1",
		body		="Nocturnus Mail",
		hands		="Alkyoneus's Bracelets",
		legs		="Hct. Subligar +1",
		feet		="Hct. Leggings +1",
		neck		="Fotia Gorget",
		waist		="Warwolf Belt",
		left_ear	="Harmonius Earring",
		right_ear	="Harmonius Earring",
		left_ring	="Rajas Ring",
		right_ring	="Strigoi Ring",
		back		="Cerb. Mantle +1",
	}
	
	------- ability sets
	
	sets.hp = { -- HP+ used in Breath triggering and Spirit Link HP given
		head		= "Wyvern Helm +1",
		body		= "Blood Scale Mail",
		ammo        = "White Tathlum",
		hands		= "Alkyoneus's Bracelets",
		legs		= "Dusk Trousers +1",
		feet		= "Homam Gambieras",
	--	neck		= "Bloodbead Gorget",--get Tethra
		waist		= "Ocean Sash", --
		left_ear	= "Harmonius Earring",
		left_ring	= "Bomb Queen Ring",
		right_ring	= "Bloodbead Ring",--get Bloodsucker_(NM)
		back		= "Gigant Mantle",
		right_ear	= "Cassie Earring",
	}
	
	sets.breath = set_combine(sets.hp,{
		head		= "Drachen Armet +1", -- for higher trigger treshold
	})
		
	sets.spirit = set_combine(sets.hp,{ -- HP+
	})
	
	sets.breathpotency = { -- Wym. Armet +1 and Wyvern HP+ here
		head		= "Wym. Armet +1",
		legs        = "Drachen Brais +1",
		body		= "Wyvern Mail",
		hands 		= "Ostreger Mitts",
		feet		= "Homam Gambieras",
		left_ear	= "Dragoon's Earring",
		neck        = "Chanoix's Gorget",
	}
	
	sets.jump = { -- STR/Accuracy/VIT/Attack + Drachen Greaves
		head		="Hecatomb Cap +1",
		body		="Nocturnus Mail",
		hands		="Alkyoneus's bracelets",
		legs		="Conte cosciales",
		feet 		="Skanda Boots",
		--feet		="Drachen Greaves",
		neck		="Ancient Torque",
		waist		="Warwolf Belt",
		left_ear	="Harmonius Earring",
		right_ear	="Brutal Earring",
		left_ring	="Strigoi Ring",
		right_ring	="Toreador's Ring",
		back		="Cerb. Mantle +1",
	}
	
	sets.highjump = set_combine(sets.jump,{ -- Wym. Brais +1 +DA
		legs		= "Wym. Brais +1"
		
	})
	
	sets.steps = set_combine(sets.melee.acc,{
	})
	
	sets.circle = {
		legs		= "Drn. Brais +1"
	}
	
	sets.callwyvern = {
		body		= "Wym. Mail +1"
	}
	
	sets.angon = {
	left_ear		= "Dragoon's Earring",
	}
	
	------- other sets
	
	sets.eva = { -- never used on its own
	    head		="Wivre Mask +1",
		body		="Hydra Mail +1",
		hands		="River Gauntlets",
		legs		="Raven Hose",
		feet		="Askar Gambieras",
		neck		="Evasion Torque",
		waist		="Warwolf Belt",
		left_ear	="Triton Earring",
		right_ear	="Novia Earring",
		left_ring	="Succor Ring",
		right_ring	="Defending Ring",
		back		="Boxer's Mantle",
	}

	sets.fcast = {
		right_ear   = "Loquac. Earring",
    }
	
	sets.fcasthaste = {
		head		= "Walahra Turban",
		body		= "Wym. Mail +1",
		hands		= "Dusk Gloves +1",
		feet		= "Homam Gambieras",
		waist		= "Velocious Belt",
		right_ring	= "Blitz Ring",
		right_ear   = "Loquac. Earring",
    }
	
	sets.rest = {
		head		="Sol Cap",
	}
	
	------- weapons
	
	sets.weapons = {}
	sets.weapons.main = {
		main		= "Gungnir",
		sub			= "Pole Grip",
		ammo		= "Black Tathlum",
	}
	
	sets.weapons.angon = {
		ammo 		= "Angon",
	}
		
end

-------- MAIN -----------------------------------------------------------------------------------------------------------------

function precast(spell, spellMap, action)
	if spell.type:contains('Step') then
		equip(sets.steps)	
	elseif spell.name == 'Angon' then
		equip(sets.angon,sets.weapons.angon)
		windower.add_to_chat(80,"Angon set")
	elseif spell.type == 'WeaponSkill' then
		if spell.name == 'Penta Thrust' then
			equip(sets.ws.str[mode])
			windower.add_to_chat(80,"WS (acc) in " .. mode .. " mode")
		elseif spell.name == 'Geirskogul' then --Geirskogul
			equip(sets.ws.str)
		end
	elseif spell.action_type == 'Ranged Attack' then
		equip(sets.ranged)		
	elseif spell.name == 'Ancient Circle' then
        equip(sets.circle)
    elseif spell.name == 'Spirit Link' then
        equip(sets.spirit)
	elseif spell.name == 'Jump' then
		equip(sets.jump)
	elseif spell.name == 'High Jump' then
		equip(sets.highjump)
	elseif spell.name == 'Call Wyvern' then
		equip(sets.callwyvern)
	elseif spell.name:contains('Utsusemi') then
		equip(sets.eva,sets.fcast)
	elseif spell.type:contains('Magic') then
		equip(sets.fcast)
	end		
end

function midcast(spell)
	if spell.name:contains('Utsusemi') then
		equip(sets.eva,sets.fcasthaste)
	end
	
	-- equip breath gear when casting magic
	if spell.type:contains('Magic') then
		equip(sets.breath)
	end
	
	-- cancellations for your pleasure
	if spell.name == "Sneak" or spell.name == "Spectral Jig" then send_command("cancel sneak") end
	if spell.name == "Stoneskin" then send_command("wait 4;cancel stoneskin"); end
	if spell.name == "Reraise" then send_command("cancel reraise"); end
	if spell.name == "Blink" then send_command("wait 4;cancel blink"); end
	if spell.name == "Aquaveil" then send_command("wait 4;cancel aquaveil"); end
	if spell.name == "Ice Spikes" then send_command("cancel Ice spikes"); end
	if spell.name == "Shock Spikes" then send_command("cancel shock spikes"); end
	if spell.name == "Phalanx" then send_command("cancel phalanx"); end
end

function pet_midcast(spell)
	-- breath potency when pet uses Breath
	if spell.name:contains('Breath') then
		equip(sets.breath,sets.breathpotency)
	end
end
	
function aftercast(spell)
	
	-- de-equip Angon
	if spell.name == "Angon" then
		equip(sets.weapons.main)
	end

	-- return to previous state
	if player.status == 'Engaged' then
		equip_Attackmode(mode)
	else
		equip_idle()
	end
end

function pet_aftercast(spell)
	if spell.name:contains('Breath') then
		-- return to previous state
		if player.status == 'Engaged' then
			equip_Attackmode(mode)
		else
			equip_idle()
		end
	end
end

function status_change(new,old)
	if new == 'Engaged' then
		equip_Attackmode(mode)
	elseif new == 'Resting' then
		equip_rest()
	else
		equip_idle()
	end
 end

-------- EQUIP AFTER STATUS CHANGE ----------------------------------------------------------------------------------------------

function equip_Attackmode()
	equip(sets.melee[mode])
	if dring then equip({right_ring="Defending Ring"}) end
end	 
	
function equip_idle()
	equip(sets.idle)
end

function equip_rest()
	equip(sets.rest)
end

-------- CUSTOM -----------------------------------------------------------------------------------------------------------------
 
function self_command(command)
	if command == 'easy'
	or command == 'colibri'
	or command == 'medium' 
	or command == 'hard'
	or command == 'acc' then
		mode = command
		if player.status == "Engaged" then
			equip_Attackmode(mode) -- if engaged, switch immediately
		end
		windower.add_to_chat(80,'Engaged mode: ' .. mode)
	elseif command == 'dring' then
		if dring == false then
			dring = true
			equip({right_ring="Defending Ring"}) -- use immediately
			windower.add_to_chat(80,'Using Defending Ring in melee set.')
		else
			dring = false
			windower.add_to_chat(80,'Using ring from melee set.')
		end
	end
end

-------- INITIALIZATION----------------------------------------------------------------------------------------------------------
 
mode = "colibri"
dring = false
 
send_command('input /macro book 8; wait 0.1; input /macro set 1')
windower.add_to_chat(80,'Not using Dring - Colibri mode')
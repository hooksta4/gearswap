--[[*********************************************
Enriquez_MNK

Handles pre-cast and macro book change-to on load

********************************************* --]]
 
 --[[ **********
  Gearsets 
************ --]]
 
 function get_sets()
 
     -- lockstyle set 

    sets.lockstyle = {
        main        = "Spharai",
        sub         = "",
        ammo        = "Black Tathlum",
        head        = "",
        body        = "Hachiryu Haramaki",
        hands       = "Ochiudo's Kote",
        legs        = "Byakko's Haidate",
        feet        = "Fuma Sune-Ate"
    }
 
     -- idle set 
		sets.idle = {
		main=		"Spharai",
		ammo=		"Black Tathlum",
		head=		"Melee Crown +1",
		body=		"Mel. Cyclas +1",
		hands=		"Mel. Gloves +1",
		legs=		"Mel. Hose +1",
		feet=		"Hermes' Sandals +1",
		neck=		"Evasion Torque",
		waist=		"Black Belt",
		left_ear=	"Novia Earring",
		right_ear=	"Triton Earring",
		left_ring=	"Succor Ring",
		right_ring=	"Defending Ring",
		back=		"Shadow Mantle",
}
 
     -- normal hasted attack set 
    sets.Attack = {
        main        = "Spharai",
        ammo        = "Black Tathlum",
        head        = "Walahra Turban",
        neck        = "Faith Torque",
        left_ear    = "Merman's Earring",
        right_ear   = "Brutal Earring",
        body        = "Hachiryu Haramaki",
        hands       = "Ochiudo's Kote",
        left_ring   = "Rajas Ring",
        right_ring  = "Toreador's Ring",
        back        = "Cerb. Mantle +1",
        waist       = "Black Belt",
        legs        = "Byakko's Haidate",
        feet        = "Fuma Sune-Ate"
    }
  
     -- Accuracy attack set 
    sets.Accuracy = {
        main        = "Spharai",
        ammo        = "Black Tathlum",
        head        = "Optical Hat",
        neck        = "Faith Torque",
        left_ear    = "Merman's Earring",
        right_ear   = "Brutal Earring",
        body        = "Hachiryu Haramaki",
        hands       = "Ochiudo's Kote",
        left_ring   = "Toreador's Ring",
        right_ring  = "Strigoi Ring",
        back        = "Cuchulain's Mantle",
        waist       = "Black Belt",
        legs        = "Byakko's Haidate",
        feet        = "Fuma Sune-Ate"
    }
 
     -- Evasion set 
    sets.Evasion = {
        main        = "Spharai",
        ammo        = "Fenrir's Stone",
        head        = "Gnole Crown",
        neck        = "Evasion Torque",
        left_ear    = "Triton Earring",
        right_ear   = "Novia Earring",
        body        = "Antares Harness",
        hands       = "Denali Wristbands",
        left_ring   = "Succor Ring",
        right_ring  = "Defending Ring",
        back        = "Boxer's Mantle",
        waist       = "Black Belt",
        legs        = "Temple Hose",
        feet        = "Temple Gaiters"
    }
 	
     -- fast cast set 
    sets.fc         = {
		left_ear    = "Loquac. Earring",
        back        = "Warlock's Mantle",
		legs        = "",
        feet        = ""
    }
      
	 -- white enfeebling set
    sets.whiteenfeebling = {
        head        = "Temple Crown",
        neck        = "Enfeebling Torque",
        left_ear    = "Enfeebling Earring",
		right_ear   = "Celestial Earring",
        body        = "Kirin's Osode",
        hands       = "Dusk Gloves +1",
		left_ring   = "Celestial Ring",
        right_ring  = "Celestial Ring",
        back        = "Altruistic Cape",
		waist       = "Sonic Belt +1",
        legs        = "Homam Cosciales",
        feet        = "Homam Gambieras"
    }

     -- Normal Enhancing Magic set (Extra MND for Stoneskin handled in Casting Function section)
    sets.enhancing = {
        main        = "Kirin's Pole",
        sub         = "Reign Grip",
		ammo        = "White Tathlum",
        head        = "Temple Crown",
        neck        = "Faith Torque",
        left_ear    = "Celestial Earring",
        right_ear   = "Celestial Earring",
        body        = "Kirin's Osode",
        hands       = "Denali Wristbands",
        left_ring   = "Celestial Ring",
        right_ring  = "Celestial Ring",
        back        = "Melee Cape",
        waist       = "Pythia Sash +1",
        legs        = "Temple Hose",
        feet        = "Temple Gaiters"
    }
       
     -- Healing Magic Potency set
    sets.heal = {
        main        = "",
		sub         = "",
		ammo        = "White Tathlum",
        head        = "Temple Crown",
        neck        = "Faith Torque",
        left_ear    = "Roundel Earring",
        right_ear   = "Celestial Earring",
        body        = "Kirin's Osode",
        left_ring   = "Celestial Ring",
        right_ring  = "Celestial Ring",
        back        = "Altruistic Cape",
        waist       = "Pythia Sash +1",
        legs        = "Clr. Pantaln. +1",
        feet        = "Blessed Pumps +1"
    }
	
     -- Raise recast reduction set
    sets.raise = {
        main        = "",
		sub         = "",
		ammo        = "Hedgehog Bomb",
        head        = "Walahra Turban",
		neck		= "Tiercel Necklace",
        left_ear    = "Loquac. Earring",
        right_ear   = "Novia Earring",
        body        = "",
        hands       = "",
        left_ring   = "Celestial Ring",
        right_ring  = "Defending Ring",
        back        = "Altruistic Cape",
        waist       = "Black Belt",
        legs        = "Byakko's Haidate",
        feet        = "Fuma Sune-Ate"
    }
 
     -- HMP+ set for resting
    sets.rest = {
		ammo		= "White Tathlum",
		head        = "Genbu's Kabuto",
        neck        = "Bloodbead Gorget",
        left_ear    = "Relaxing Earring",
        right_ear   = "Cassie Earring",
        body        = "Mel. Cyclas +1",
        hands       = "Mel. Gloves +1",
        left_ring   = "Bloodbead Ring",
        right_ring  = "Bomb Queen Ring",
        back        = "Melee Cape",
        waist       = "Ocean Sash",
        legs        = "Mel. Hose +1",
        feet        = "Marine M Boots" 
	}
	
	-- Shoulder Tackle WS set
    sets.ST = {
		ammo		= "Black Tathlum",
		head        = "Maat's Cap",
        neck        = "Fotia Gorget",
        left_ear    = "Merman's Earring",
        right_ear   = "Brutal Earring",
        body        = "Hachiryu Haramaki",
        hands       = "Ochiudo's Kote",
        left_ring   = "Rajas Ring",
        right_ring  = "Strigoi Ring",
        back        = "Cerb. Mantle +1",
        waist       = "Virtuoso Belt",
        legs        = "Hachiryu Haidate",
        feet        = "Denali Gamashes"
    }
			
	-- Raging Fists WS set
    sets.RF = {
		ammo		= "Black Tathlum",
		head        = "Gnadbhod's Helm",
        neck        = "Fotia Gorget",
        left_ear    = "Merman's Earring",
        right_ear   = "Brutal Earring",
        body        = "Hachiryu Haramaki",
        hands       = "Ochiudo's Kote",
        left_ring   = "Rajas Ring",
        right_ring  = "Strigoi Ring",
        back        = "Cerb. Mantle +1",
        waist       = "Virtuoso Belt",
        legs        = "Hachiryu Haidate",
        feet        = "Denali Gamashes"
    }
					
	-- Howling Fist WS set
    sets.HF = {
		ammo		= "Black Tathlum",
		head        = "Gnadbhod's Helm",
        neck        = "Fotia Gorget",
        left_ear    = "Merman's Earring",
        right_ear   = "Brutal Earring",
        body        = "Kirin's Osode",
        hands       = "Ochiudo's Kote",
        left_ring   = "Rajas Ring",
        right_ring  = "Strigoi Ring",
        back        = "Cerb. Mantle +1",
        waist       = "Warwolf Belt",
        legs        = "Hachiryu Haidate",
        feet        = "Denali Gamashes"
    }
		
	-- Dragon Kick WS set
    sets.DK = {
		ammo		= "Black Tathlum",
		head        = "Gnadbhod's Helm",
        neck        = "Fotia Gorget",
        left_ear    = "Harmonius Earring",
        right_ear   = "Brutal Earring",
        body        = "Kirin's Osode",
        hands       = "Ochiudo's Kote",
        left_ring   = "Rajas Ring",
        right_ring  = "Strigoi Ring",
        back        = "Cerb. Mantle +1",
        waist       = "Black Belt",
        legs        = "Hachiryu Haidate",
        feet        = "Denali Gamashes"
    }
	
	-- Asuran Fists WS set
    sets.AF = {
		ammo		= "Black Tathlum",
		head        = "Gnadbhod's Helm",
        neck        = "Fotia Gorget",
        left_ear    = "Merman's Earring",
        right_ear   = "Pixie Earring",
        body        = "Hachiryu Haramaki",
        hands       = "Ochiudo's Kote",
        left_ring   = "Rajas Ring",
        right_ring  = "Strigoi Ring",
        back        = "Cerb. Mantle +1",
        waist       = "Virtuoso Belt",
        legs        = "Shura Haidate +1",
        feet        = "Denali Gamashes"
    }

		-- Final Heaven WS set
    sets.FH = {
		ammo		= "Black Tathlum",
		head        = "Gnadbhod's Helm",
        neck        = "Fotia Gorget",
        left_ear    = "Harmonius Earring",
        right_ear   = "Brutal Earring",
        body        = "Kirin's Osode",
        hands       = "Alkyoneus's Brc.",
        left_ring   = "Rajas Ring",
        right_ring  = "Strigoi Ring",
        back        = "Cerb. Mantle +1",
        waist       = "Black Belt",
        legs        = "Shura Haidate +1",
        feet        = "Denali Gamashes"
    }

	-- Chakra set
    sets.Chakra = {
		ammo		= "Bibiki Seashell",
		head        = "Genbu's Kabuto",
        neck        = "Fortitude Torque",
        left_ear    = "Robust Earring +1",
        right_ear   = "Robust Earring +1",
        body        = "Temple Cyclas",
        hands       = "Mel. Gloves +1",
        left_ring   = "Robust Ring +1",
        right_ring  = "Robust Ring +1",
        back        = "Melee Cape",
        waist       = "Warwolf Belt",
        legs        = "Kensei Sitabaki",
        feet        = "Fuma Sune-Ate"
    }
	
	-- Waltz set
    sets.Waltz = {
		ammo		= "Tsar's Egg",
		head        = "Maat's Cap",
        neck        = "Temp. Torque",
        left_ear    = "Melody Earring +1",
        right_ear   = "Melody Earring +1",
        body        = "Kirin's Osode",
        hands       = "Marine M Gloves",
        left_ring   = "Heavens Ring +1",
        right_ring  = "Heavens Ring +1",
        back        = "Melee Cape",
        waist       = "Corsette +1",
        legs        = "Custom Slacks",
        feet        = "Fuma Sune-Ate"
    }
	
	-- Chi Blast set
    sets.ChiBlast = {
		ammo		= "White Tathlum",
		head        = "Temple Crown",
        neck        = "Faith Torque",
        left_ear    = "Celestial Earring",
        right_ear   = "Novia Earring",
        body        = "Kirin's Osode",
        hands       = "Denali Wristbands",
        left_ring   = "Celestial Ring",
        right_ring  = "Celestial Ring",
        back        = "Melee Cape",
        waist       = "Pythia Sash +1",
        legs        = "Temple Hose",
        feet        = "Suzaku's Sune-Ate"
    }

	-- Boost set
    sets.Boost = {
		hands        = "Temple Gloves",
    }
	
	-- Dodge set
    sets.Dodge = {
        feet        = "Temple Gaiters"
    }
		
	-- Focus set
    sets.Focus = {
		head        = "Temple Crown",
    }
	
	-- MP down set for job-change or GS-load initialization
	sets.mpdown = {        
		left_ear	= "Cassie Earring",
		right_ear	= "Intruder Earring",
		left_ring	= "Bloodbead Ring"
    }
	
 end
 
 --[[ *************
  Equip functions
*************** --]]
 
 -- equip idle set
 function equip_idle()
    if world.time <= 1080 and world.time >= 360 and player.hpp < 96 then
		windower.add_to_chat(8,'[Idle Fists with +7 HP/tic restored]')
		equip(sets.idle,{head="Sol Cap",neck="Orochi Nodowa +1",body="Mel. Cyclas +1",hands="Feronia's Bangles",waist="Lycopodium Sash"})
		
		elseif player.hpp < 96 then
			windower.add_to_chat(8,'[Idle Fists with +3 HP/tic restored]')
			equip(sets.idle,{head="Sol Cap",neck="Orochi Nodowa +1",body="Mel. Cyclas +1"})
		
		else
			windower.add_to_chat(8,'[Idle Fists]')
			equip(sets.idle)
	end

	if world.zone == "Bastok Mines" or world.zone == "Bastok Markets" or world.zone == "Metalworks" or world.zone == "Port Bastok" then
		equip(sets.idle,{body="Republic Aketon"})
		windower.add_to_chat(8,"[National Aketon is aket-on!]")
	else end	
end

-- equip attack/haste set
function equip_Attackmode(spell)
	if world.time <= 1080 and world.time >= 360 and player.equipment.main == "Spharai" and mode == 'Attack' then
		 windower.add_to_chat(8,"[Spharai in the daytime: [" .. mode .. "] mode is selected!]")
		 equip(sets[mode],{left_ear="Fenrir's Earring",waist="Black Belt"})
		 
	elseif player.equipment.main == "Spharai" and mode == 'Attack' then
			 windower.add_to_chat(8,"[Spharai at night: [" .. mode .. "] mode is selected!]")
			 equip(sets[mode])
		 
	else	 
		windower.add_to_chat(8,"[Monk's [" .. mode .. "] mode is selected!]")
		equip(sets[mode])
	end
end

-- equip  White Enfeebling Magic set
function equip_whiteenfeebling(spell)
    windower.add_to_chat(8,'[Casting ' .. spell.english .. ' with ' .. player.mp .. ' MP remaining]')
    equip(sets.whiteenfeebling)
end

-- equip Enfeebling Magic set
function equip_enfeebling(spell)
    windower.add_to_chat(8,'[Casting ' .. spell.english .. ' with ' .. player.mp .. ' MP remaining]')
    equip(sets.enfeebling)
end

-- equip Standard Enhancing Magic set
function equip_enhancing(spell)
	if spell.english == "Stoneskin" then
			 windower.add_to_chat(8,'[Casting ' .. spell.english .. ' with ' .. player.mp .. ' MP remaining]')
			 equip(sets.enhancing,{head="Maat's Cap",neck="Stone Gorget",body="Kirin's Osode"})
	else		 
		windower.add_to_chat(8,'[Casting ' .. spell.english .. ' with ' .. player.mp .. ' MP remaining]')
		equip(sets.enhancing)
	end
end

-- equip Healing Magic set
function equip_heal(spell)
	if  spell.english:contains('Raise') then 
		windower.add_to_chat(8,'[Casting ' .. spell.english .. ', in low-recast-mode, with ' .. player.mp .. ' MP remaining]')
		equip(sets.raise)
				
			elseif  spell.english:contains('Reraise') then 
					windower.add_to_chat(8,'[Casting ' .. spell.english .. ', in low-recast-mode, with ' .. player.mp .. ' MP remaining]')
					equip(sets.raise)
					
		elseif  player.hpp > 76 and spell.element == world.weather_element or spell.element == world.day_element then
				windower.add_to_chat(8,'[Casting ' .. spell.english .. ', boosted by Hachirin-no-Obi, with ' .. player.mp .. ' MP remaining]')
				equip(sets.heal,{waist="Hachirin-no-Obi"})
		
	else
		windower.add_to_chat(8,'[Casting ' .. spell.english .. ' with ' .. player.mp .. ' MP remaining]')
		equip(sets.heal)
	end
end

-- equip HP resting set
function equip_rest()
    if player.hpp < 95 and world.time <= 1080 and world.time >= 360  then
		windower.add_to_chat(8,"[Resting Monk... + 7 Regen]")
		equip(sets.rest,{head="Sol Cap",neck="Orochi Nodowa +1",waist="Lycopodium Sash"})
	elseif player.hpp < 95 then
			windower.add_to_chat(8,"[Resting Monk... + 3 Regen]")
			equip(sets.rest,{head="Sol Cap",neck="Orochi Nodowa +1"})	
	else
		windower.add_to_chat(8,"[Resting Monk...]")
		equip(sets.rest)
	end
end

--[[ **************
 Casting functions 
******************* --]]
 
 -- Pre-Cast section for Magic and Abilities
 function precast(spell, spellMap, action)
	 if spell.type:contains('Magic') then
			windower.add_to_chat(8,'[- Pre-Cast Set Active -]')
			equip(sets.fc)
		elseif spell.type:contains('Ninjutsu') then
			windower.add_to_chat(8,'[- Pre-Cast Set Active -]')
			equip(sets.fc,{back="Shadow Mantle"})
		end

	if world.day_element == 'Dark' and spell.type:contains('Waltz') then
		windower.add_to_chat(8,"[- " .. spell.name .. " with " .. player.tp .. "TP -]")
		equip(sets.Waltz,{Back="Shadow Mantle"})
		elseif spell.type:contains('Waltz') then
			 windower.add_to_chat(8,"[- " .. spell.name .. " with " .. player.tp .. "TP -]")
			 equip(sets.Waltz)
	end	
	
	if spell.type:contains('Step') then
		windower.add_to_chat(8,"[- Best get to Steppin'! " .. spell.name .. " with " .. player.tp .. "TP -]")
		equip(sets.Accuracy)
	end	
		
	if spell.name == 'Shoulder Tackle' and world.time <= 1080 and world.time >= 360 then
		windower.add_to_chat(8,"[- " .. spell.name .. " with Fenrir's Earring using " .. player.tp .. "TP -]")
		equip(sets.ST,{left_ear="Fenrir's Earring"})
		 elseif spell.name == 'Shoulder Tackle' then
			 windower.add_to_chat(8,"[- " .. spell.name .. " using " .. player.tp .. "TP -]")
			 equip(sets.ST)
		end	
					
	if spell.name == 'Raging Fists' and world.time <= 1080 and world.time >= 360 then
		windower.add_to_chat(8,"[- " .. spell.name .. " with Fenrir's Earring using " .. player.tp .. "TP -]")
		equip(sets.RF,{left_ear="Fenrir's Earring"})
		 elseif spell.name == 'Raging Fists' then
			 windower.add_to_chat(8,"[- " .. spell.name .. " using " .. player.tp .. "TP -]")
			 equip(sets.RF)
		end	
									
	if spell.name == 'Howling Fist' and world.time <= 1080 and world.time >= 360 then
		windower.add_to_chat(8,"[- " .. spell.name .. " with Fenrir's Earring using " .. player.tp .. "TP -]")
		equip(sets.HF,{left_ear="Fenrir's Earring"})
		 elseif spell.name == 'Howling Fist' then
			 windower.add_to_chat(8,"[- " .. spell.name .. " using " .. player.tp .. "TP -]")
			 equip(sets.HF)
		end	
				
	if spell.name == 'Dragon Kick' and world.time <= 1080 and world.time >= 360 then
		windower.add_to_chat(8,"[- " .. spell.name .. " with Fenrir's Earring using " .. player.tp .. "TP -]")
		equip(sets.DK,{left_ear="Fenrir's Earring"})
		 elseif spell.name == 'Dragon Kick' then
			 windower.add_to_chat(8,"[- " .. spell.name .. " using " .. player.tp .. "TP -]")
			 equip(sets.DK)
		end	
				
	if spell.name == 'Asuran Fists' and world.time <= 1080 and world.time >= 360 then
		windower.add_to_chat(8,"[- " .. spell.name .. " with Fenrir's Earring using " .. player.tp .. "TP -]")
		equip(sets.AF,{left_ear="Fenrir's Earring"})
		 elseif spell.name == 'Asuran Fists' then
			 windower.add_to_chat(8,"[- " .. spell.name .. " using " .. player.tp .. "TP -]")
			 equip(sets.AF)
		end	
				
	if spell.name == 'Final Heaven' and world.time <= 1080 and world.time >= 360 then
		windower.add_to_chat(8,"[- " .. spell.name .. " with Fenrir's Earring using " .. player.tp .. "TP -]")
		equip(sets.FH,{left_ear="Fenrir's Earring"})
		 elseif spell.name == 'Final Heaven' then
			 windower.add_to_chat(8,"[- " .. spell.name .. " using " .. player.tp .. "TP -]")
			 equip(sets.FH)
		end

	if spell.name == 'Dodge' then
		windower.add_to_chat(8,'[- Fancy Feet +1 -]')
		equip(sets.Dodge)
		end
	
	if spell.name == 'Focus' then
		windower.add_to_chat(8,'[- Free... your Mind. -]')
		equip(sets.Focus)
		end
	
	if world.day_element == 'Dark' and spell.name == 'Chakra' then
		windower.add_to_chat(8,'[- MEGA-Chakra Ommm... Ommm... Omnomnom... -]')
		equip(sets.Chakra,{back="Shadow Mantle"})
		elseif spell.name == 'Chakra' then
				windower.add_to_chat(8,'[- Chakra Ommm... Ommm... Omnomnom... -]')
				equip(sets.Chakra)
		end
		
	if spell.name == 'Boost' then
		windower.add_to_chat(8,'[- HNNNGHHH! -]')
		equip(sets.Boost)
		end
		
	if spell.name == 'Chi Blast' then
		windower.add_to_chat(8,'[- Pa-pa-pa-POWWWWERRR! -]')
		equip(sets.ChiBlast)
		else
		
    end
end
 
 -- Midcast section
 function midcast(spell)
    if spell.type:contains('Ninjutsu') then
		windower.add_to_chat(8,'[Hasted Cast Set Active]')
		equip(sets.recast,{back="Shadow Mantle"})
		
	elseif  spell.skill == 'Healing Magic' then
			equip_heal(spell)
	
	elseif  spell.skill == 'Enhancing Magic' then
			equip_enhancing(spell)
		
	elseif  spell.english == ("Slow") then
			equip_whiteenfeebling(spell)
	elseif  spell.english == ("Paralyze") then
			equip_whiteenfeebling(spell)
	elseif  spell.english == ("Silence") then
			equip_whiteenfeebling(spell)
	elseif  spell.english == ("Dia") then
			equip_whiteenfeebling(spell)
	elseif  spell.english == ("Dia II") then
			equip_whiteenfeebling(spell)
		
		elseif  spell.skill == 'Enfeebling Magic' then
				equip_enfeebling(spell) 
    end
 end
 
 -- post-cast, return to idle
 function aftercast()
    if player.status == 'Engaged' then
        equip_Attackmode()
    else
         equip_idle()
    end
end

-- the status_change function runs automatically whenever a
-- engage, disengage, kneel, or stand event happens.  As a WHM we use this
-- to equip +hMP gear when we /heal, and return to idle gear when standing.
function status_change(new,old)
    if new == 'Engaged' then
        equip_Attackmode()
    elseif new == 'Resting' then
		equip_rest()
	else
         equip_idle()
    end
 end
 
 -- self_command function
 -- set up macro as:
 -- /console gs c Y
 --
 function self_command(m)
     if m == "Y" then
        equip_yellow()
    elseif m == "M+" then
        if mode == "Attack" then
            mode = "Accuracy"
        elseif
            mode == "Accuracy" then
			 mode = "Evasion"
			 else
			  mode = "Attack"
        end
         windower.add_to_chat(8,'[Attack mode: ' .. mode .. ']')
    end
 end
 
 function buff_change(name,gain,eventArgs)

	if name == "Silence" and gain =="True" then
		send_command('@input /item "Echo Drops" <me>')
	end

end
 
 --[[ *************
  Run once
*************** --]]
 
 -- Mode signifies which melee set the MNK will attack in. Default setting is Attack.
 mode = "Attack"
 
 -- Puts on lockstyle set, then switch to idle set.
 send_command('wait 1;gs equip lockstyle;wait 1;input /lockstyle on;wait1;gs equip mpdown;wait 0.5;gs equip idle')
 send_command('input /macro book 17; wait 0.1; input /macro set 1')

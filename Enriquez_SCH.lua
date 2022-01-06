--[[***************************************************
Enriquez_SCH

New and Improved, with Superior Sublimation Automation!

*************************************************** --]]
 
 --[[ ********
  Gearsets 
********* --]]
 
 function get_sets()
 
     -- lockstyle set 

    sets.lockstyle = {
        main        = "Claustrum",
        sub         = "Magic Strap",
        ammo        = "Phtm. Tathlum",
        head        = "Maat's Cap",
        body        = "Argute Gown +1",
        hands       = "Argute Bracers +1",
        legs        = "Argute Pants +1",
        feet        = "Argute Loafers +1"
    }
 
     -- damage mitigation idle set 
    sets.idleEvasion = {
        main        = "Claustrum",
        sub         = "Magic Strap",
        ammo        = "Fenrir's Stone",
        head        = "Optical Hat",
        neck        = "Evasion Torque",
        left_ear    = "Musical Earring",
        right_ear   = "Novia Earring",
        body        = "Hydra Doublet",
        hands       = "Hydra Gloves",
        left_ring   = "Succor Ring",
        right_ring  = "Defending Ring",
        back        = "Umbra Cape",
        waist       = "Argute Belt",
        legs        = "Hydra Brais",
        feet        = "Herald's Gaiters"
    }

	sets.idleHPMP = {
        main        = "Claustrum",
        sub         = "Magic Strap",
        ammo        = "Hedgehog Bomb",
        head        = "",
        neck        = "Uggalepih Pendant",
        left_ear    = "Celestial Earring",
        right_ear   = "Celestial Earring",
        body        = "Royal Cloak",
        hands       = "Marine M Gloves",		-- Argute Bracers +1
        left_ring   = "Succor Ring",
        right_ring  = "Defending Ring",
        back        = "Intensifying Cape",
        waist       = "Argute Belt",
        legs        = "Goliard Trews",
        feet        = "Herald's Gaiters"
    }
 
     -- fast cast set 
    sets.fc         = {
        main        = "Claustrum",
        sub         = "Vivid Strap +1",
		ammo        = "White Tathlum",
		head        = "Argute M.board +1",
		left_ear    = "Loquac. Earring",
		body		= "Scholar's Gown +1",
		left_ring   = "Succor Ring",
		legs        = "Scholar's Pants +1",
		back        = "Veela Cape",
        feet        = "Rostrum Pumps"
    }
 
     -- damage set 
    sets.damage = {
        main        = "Claustrum",
        sub         = "Vivid Strap +1",
		ammo        = "Phtm. Tathlum",
        head        = "Maat's Cap",
		neck		= "Lmg. Medallion +1",
        left_ear    = "Novio Earring",
		right_ear   = "Moldavite Earring",
        body        = "Mahatma Hpl.",		-- Mrgn. Cotehardie
        hands       = "Mahatma Cuffs",
		left_ring   = "Galdr Ring",
        right_ring  = "Omn. Ring +1",
        back        = "Hecate's Cape",
		waist       = "Argute Belt",
        legs        = "Mahatma Slops",
        feet        = "Shrewd Pumps"
    }
 
     -- accuracy set 
    sets.accuracy = {
        main        = "Claustrum",
        sub         = "Vivid Strap +1",
		ammo        = "Phtm. Tathlum",
        head        = "Argute M.board +1",
		neck		= "Lmg. Medallion +1",
        left_ear    = "Elemental Earring",
		right_ear   = "Moldavite Earring",
        body        = "Scholar's Gown +1",
        hands       = "Goliard Cuffs",
		left_ring   = "Galdr Ring",
        right_ring  = "Omn. Ring +1",
        back        = "Merciful Cape",
		waist       = "Argute Belt",
        legs        = "Mahatma Slops",
        feet        = "Shrewd Pumps"
    }
 
     -- low-tier set 
    sets.lowtier = {
        main        = "Claustrum",
        sub         = "Vivid Strap +1",
		ammo        = "Phtm. Tathlum",
        head        = "Maat's Cap",
		neck		= "Lmg. Medallion +1",
        left_ear    = "Novio Earring",
		right_ear   = "Moldavite Earring",
        body        = "Mahatma Hpl.",
        hands       = "Goliard Cuffs",
		left_ring   = "Galdr Ring",
        right_ring  = "Omn. Ring +1",
        back        = "Hecate's Cape",
		waist       = "Argute Belt",
        legs        = "Mahatma Slops",
        feet        = "Shrewd Pumps"
    }
  
     -- Helix set 	
    sets.helix = {
        main        = "Claustrum",
        sub         = "Vivid Strap +1",
		ammo        = "Phtm. Tathlum",
        head        = "Maat's Cap",
		neck		= "Lmg. Medallion +1",
        left_ear    = "Novio Earring",
		right_ear   = "Moldavite Earring",
        body        = "Mahatma Hpl.",
        hands       = "Goliard Cuffs",
		left_ring   = "Galdr Ring",
        right_ring  = "Omn. Ring +1",
        back        = "Hecate's Cape",
		waist       = "Argute Belt",
        legs        = "Mahatma Slops",
        feet        = "Shrewd Pumps"
    }
 
     -- dark set 
    sets.dark = {
        main        = "Claustrum",
        sub         = "Dark Grip",
		ammo        = "Phtm. Tathlum",
        head        = "Maat's Cap",
        neck        = "Dark Torque",
        left_ear    = "Dark Earring",
		right_ear   = "Abyssal Earring",
        body        = "Goliard Saio",
		hands       = "Bricta's Cuffs",
		left_ring   = "Galdr Ring",
        right_ring  = "Omn. Ring +1",
        back        = "Merciful Cape",
		waist       = "Crimson Belt",
        legs        = "Argute Pants +1",
        feet        = "Goliard Clogs"
    }
     
	 -- white enfeebling set 
    sets.whiteenfeebling = {
        main        = "Claustrum",
        sub         = "Reign Grip",
		ammo        = "Jasper Tathlum",
        head        = "Maat's Cap",
        neck        = "Enfeebling Torque",
        left_ear    = "Enfeebling Earring",
		right_ear   = "Celestial Earring",
        body        = "Mahatma Hpl.",
        hands       = "Argute Bracers +1",
		left_ring   = "Celestial Ring",
        right_ring  = "Celestial Ring",
        back        = "Altruistic Cape",
		waist       = "Argute Belt",
        legs        = "Mahatma Slops",
        feet        = "Goliard Clogs"
    }
	
     -- (black) enfeebling set 
    sets.enfeebling = {
        main        = "Claustrum",
        sub         = "Dark Grip",
		ammo        = "Phtm. Tathlum",
        head        = "Maat's Cap",
        neck        = "Enfeebling Torque",
        left_ear    = "Enfeebling Earring",
		right_ear   = "Abyssal Earring",
        body        = "Mahatma Hpl.",
        hands       = "Argute Bracers +1",
		left_ring   = "Galdr Ring",
        right_ring  = "Omn. Ring +1",
        back        = "Altruistic Cape",
		waist       = "Argute Belt",
        legs        = "Mahatma Slops",
        feet        = "Goliard Clogs"
    }
     
     -- enhancing set (Extra MND for Stoneskin is handled by Casting functions below)
    sets.enhancing = {
        main        = "Seveneyes",
		sub         = "Legion Scutum",
		ammo        = "Hedgehog Bomb",
        head        = "Walahra Turban",
        neck        = "Enhancing Torque",
        left_ear    = "Celestial Earring",
        right_ear   = "Celestial Earring",
        body        = "Argute Gown +1",
        hands       = "Scholar's Bracers +1",
        left_ring   = "Succor Ring",
        right_ring  = "Celestial Ring",
        back        = "Merciful Cape",
        waist       = "Pythia Sash +1",
        legs        = "Goliard Trews",
        feet        = "Shrewd Pumps"
    }

     -- Healing Magic Set
    sets.heal = {
        main        = "Claustrum",				-- Chatostaff provides 579 HP on a Cure IV compared to Claustrum's 594, with this build.
		sub         = "Reign Grip",
		ammo        = "Jasper Tathlum",
        head        = "Maat's Cap",				-- Goliard Chapeau / Maat's Cap
        neck        = "Fylgja Torque +1",
        left_ear    = "Celestial Earring",
        right_ear   = "Celestial Earring",
        body        = "Mahatma Hpl.",			-- Mahatma Hpl. will provide 1 more HP on Cure III, 2 more HP on Cure IV but gives 10 less Evasion, 5 less Enmity Reduction, and 40 less MP, not to mention the Stat negatives.
        hands       = "Sch. Bracers +1",
        left_ring   = "Celestial Ring",
        right_ring  = "Celestial Ring",
        back        = "Dew Silk Cape +1",
        waist       = "Pythia Sash +1",
        legs        = "Mahatma Slops",
        feet        = "Argute Loafers +1"
    }
      
     -- Raise & Etc. lowered recast set
    sets.raise = {
        main        = "Seveneyes",
		sub         = "Legion Scutum",
		ammo        = "Hedgehog Bomb",
        head        = "Walahra Turban",
        neck        = "Uggalepih Pendant",
        left_ear    = "Loquac. Earring",
        right_ear   = "Novia Earring",
        body        = "Goliard Saio",
        hands       = "Scholar's Bracers +1",
        left_ring   = "Succor Ring",
        right_ring  = "Celestial Ring",
        back        = "Altruistic Cape",
        waist       = "Pythia Sash +1",
        legs        = "Goliard Trews",
        feet        = "Shrewd Pumps"
    }
        
    -- HMP+ set
    sets.rest = {
		main        = "Claustrum",
        sub         = "Ariesian Grip",
		ammo		= "Hedgehog Bomb",
        neck        = "Gnole Torque",
        head		= "Goliard Chapeau",
		left_ear    = "Relaxing Earring",
        right_ear   = "Antivenom Earring",
        body        = "Mahatma Hpl.",
        hands       = "Hydra Gloves",
        left_ring   = "Celestial Ring",
        right_ring  = "Celestial Ring",
        back        = "Invigorating Cape",
        waist       = "Qiqirn Sash +1",
        legs        = "Hydra Brais",
        feet        = "Goliard Clogs"
    }
	
	-- Hasted melee set 
    sets.Hasted = {
        main        = "Claustrum",
        sub         = "Pole Grip",
        ammo        = "White Tathlum",
        head        = "Walahra Turban",
        neck        = "Temp. Torque",
        left_ear    = "Merman's Earring",
        right_ear   = "Brutal Earring",
        body        = "Goliard Saio",
        hands       = "Goliard Cuffs",
        left_ring   = "Rajas Ring",
        right_ring  = "Mars's Ring",
        back        = "Bellicose Mantle",
        waist       = "Ninurta's Sash",
        legs        = "Hydra Brais",
        feet        = "Hydra Gaiters"
    }
 
	-- Accurate Melee set 
    sets.Accurate = {
        main        = "Claustrum",
        sub         = "Pole Grip",
        ammo        = "Tiphia Sting",
        head        = "Optical Hat",
        neck        = "Temp. Torque",
        left_ear    = "Merman's Earring",
        right_ear   = "Brutal Earring",
        body        = "Hydra Doublet",
        hands       = "Hydra Gloves",
        left_ring   = "Toreador's Ring",
        right_ring  = "Mars's Ring",
        back        = "Bellicose Mantle",
        waist       = "Virtuoso Belt",
        legs        = "Hydra Brais",
        feet        = "Hydra Gaiters"
    }
 
	-- Evasive melee set 
    sets.Evasive = {
        main        = "Claustrum",
        sub         = "Pole Grip",
        ammo        = "Fenrir's Stone",
        head        = "Optical Hat",
        neck        = "Evasion Torque",
        left_ear    = "Musical Earring",
        right_ear   = "Novia Earring",
        body        = "Hydra Doublet",
        hands       = "Hydra Gloves",
        left_ring   = "Succor Ring",
        right_ring  = "Defending Ring",
        back        = "Boxer's Mantle",
        waist       = "Virtuoso Belt",
        legs        = "Hydra Brais",
        feet        = "Hydra Gaiters"
    }

	-- Spirit Taker set 
    sets.SpiritTaker = {
        main        = "",
        sub         = "",
        ammo        = "Tiphia Sting",
        head        = "Maat's Cap",
        neck        = "Temp. Torque",
        left_ear    = "Abyssal Earring",
        right_ear   = "Brutal Earring",
        body        = "Hydra Doublet",
        hands       = "Goliard Cuffs",
        left_ring   = "Flame Ring",
        right_ring  = "Strigoi Ring",
        back        = "Ryl. Army Mantle",
        waist       = "Virtuoso Belt",
        legs        = "Hydra Brais",
        feet        = "Hydra Gaiters"
    }
   	
	-- Gate of Tartarus set 
    sets.Gate = {
        main        = "",
        sub         = "",
        ammo        = "Tiphia Sting",
        head        = "Maat's Cap",
        neck        = "Fotia Gorget",
        left_ear    = "Abyssal Earring",
        right_ear   = "Brutal Earring",
        body        = "Hydra Doublet",
        hands       = "Goliard Cuffs",
        left_ring   = "Flame Ring",
        right_ring  = "Strigoi Ring",
        back        = "Ryl. Army Mantle",
        waist       = "Virtuoso Belt",
        legs        = "Hydra Brais",
        feet        = "Hydra Gaiters"
    }
   	
 end
 
 --[[ ****************************
  Equip functions with messaging
****************************** --]]
 
 -- equip idle set
 function equip_idle(spell,action,eventArgs)
    if buffactive ['Sublimation: Activated'] and world.time <= 1080 and world.time >= 360 and player.hpp > 71 and player.mp < 625 then
		equip(sets.idleHPMP,{main="Seveneyes",sub="Ptr.Prt. Shield",ammo="White Tathlum",head="Sch. M.board +1",ammo="Fenrir's Stone",neck='Bloodbead Gorget',
							left_ear="Harmonius Earring",right_ear="Cassie Earring",body= "Argute Gown +1",hands="Feronia's Bangles",
							left_ring="Bloodbead Ring",right_ring="Bomb Queen Ring",back="Amity Cape",waist="Ocean Sash",legs="Prince's Slops"}) 
		
	elseif buffactive ['Sublimation: Activated'] and world.time <= 1080 and world.time >= 360 and player.hpp > 71 then
		equip(sets.idleHPMP,{sub="Magic Strap",head="Sch. M.board +1",ammo="Fenrir's Stone",neck='Bloodbead Gorget',
							 body= "Argute Gown +1",hands="Feronia's Bangles",legs="Prince's Slops"})	
		
		elseif world.time <= 1080 and world.time >= 360 and player.hpp > 71 and buffactive ['Sublimation: Complete'] 
			or world.time <= 1080 and world.time >= 360 and player.hpp > 71 then
				equip(sets.idleHPMP)				
	
	elseif buffactive ['Sublimation: Activated'] and player.hpp > 71 and player.mp < 625 then
			equip(sets.idleHPMP,{main="Seveneyes",sub="Ptr.Prt. Shield",ammo="White Tathlum",head="Sch. M.board +1",neck='Bloodbead Gorget',
								left_ear="Harmonius Earring",right_ear="Cassie Earring",body= "Argute Gown +1",hands="Feronia's Bangles",
								left_ring="Bloodbead Ring",right_ring="Bomb Queen Ring",back="Amity Cape",waist="Ocean Sash",legs="Prince's Slops"})
	
	elseif buffactive ['Sublimation: Activated'] and player.hpp > 71 then
			equip(sets.idleHPMP,{sub="Magic Strap",ammo="White Tathlum",head="Sch. M.board +1",
								 neck='Bloodbead Gorget',body= "Argute Gown +1",legs="Prince's Slops"})	
			
			elseif player.hpp > 71 and buffactive ['Sublimation: Complete']
				or player.hpp > 71 then
					equip(sets.idleHPMP)
			
			else 
				equip(sets.idleEvasion)
	end

	if world.zone == "Bastok Mines" or world.zone == "Bastok Markets" or world.zone == "Metalworks" or world.zone == "Port Bastok" then
			equip(sets.idle,{body="Republic Aketon"})
			windower.add_to_chat(8,"[National Aketon is aket-on!]")
	else end	
end

-- equip auto-attacking mode sets (Fenrir's Earring equips during daytime)
function equip_Attack()
	if world.time <= 1080 and world.time >= 360 then
		windower.add_to_chat(8,"[ (" .. player.equipment.main .. ") / (" .. player.equipment.sub .. ") [[- " .. auto .. " -]] mode is selected - Fenrir's Earring Activated!]")
		equip(sets[auto],{left_ear="Fenrir's Earring"})

	else	 
		windower.add_to_chat(8,"[ (" .. player.equipment.main .. ") / (" .. player.equipment.sub .. ") - [[- " .. auto .. " -]] mode is selected!]")
		equip(sets[auto])
	end
end

-- equip Elemental attack set(s), plus Hachirin-no-Obi and/or Uggalepih Pendant when appropriate

function equip_nuke(spell)
    if spell.english:contains('helix') and player.mp - spell.mp_cost < 0.45 * player.max_mp then
		windower.add_to_chat(8,"[Casting " .. spell.english .. " on " .. world.day_element .. "sday at " .. player.mpp .. "% MP with Uggalepih Pendant]")
		equip(sets.helix,{neck="Uggalepih Pendant"})
		
		elseif spell.english:contains('helix') then
		windower.add_to_chat(8,"[Casting " .. spell.english .. " on " .. world.day_element .. "sday at " .. player.mpp .. "% MP]")
		equip(sets.helix)
		
	elseif spell.element == world.day_element and spell.skill == 'Elemental Magic' and player.mp - spell.mp_cost < 0.45 * player.max_mp then
			windower.add_to_chat(8,"[Casting " .. spell.english .. " in " .. mode .. " mode on " .. world.day_element .. "sday at " .. player.mpp .. "% MP with Uggalepih Pendant]")
			equip(sets[mode],{neck="Uggalepih Pendant",hands="Mahatma Cuffs",waist="Hachirin-no-Obi"})
	elseif spell.element == world.day_element and spell.skill == 'Elemental Magic' then
			windower.add_to_chat(8,"[Casting " .. spell.english .. " in " .. mode .. " mode with " .. world.day_element .. "sday power]")
			equip(sets[mode],{hands="Mahatma Cuffs",waist="Hachirin-no-Obi"})
			
    elseif spell.element == world.weather_element and spell.skill == 'Elemental Magic' and player.mp - spell.mp_cost < 0.45 * player.max_mp then
			windower.add_to_chat(8,"[Casting " .. spell.english .. " in " .. mode .. " mode with the " .. world.weather_element .. " weather at " .. player.mpp .. "% MP with Uggalepih Pendant]")
			equip(sets[mode],{hands="Mahatma Cuffs",neck="Uggalepih Pendant",waist="Hachirin-no-Obi"})
	elseif spell.element == world.weather_element and spell.skill == 'Elemental Magic' then
			windower.add_to_chat(8,'[Casting ' .. spell.english .. ' in ' .. mode .. ' mode with ' .. world.weather_element .. ' weather power]')
			equip(sets[mode],{hands="Mahatma Cuffs",waist="Hachirin-no-Obi"})
	
	elseif spell.skill == 'Elemental Magic' and player.mp - spell.mp_cost < 0.45 * player.max_mp then
			windower.add_to_chat(8,'[Casting ' .. spell.english .. ' in ' .. mode .. 'mode at ' .. player.mpp .. '% MP with Uggalepih Pendant]')
			equip(sets[mode],{sub="Wise Strap",neck="Uggalepih Pendant"})
    else
         windower.add_to_chat(8,'[Casting ' .. spell.english .. ' in regular ' .. mode .. ' mode at ' .. player.mpp .. '% MP]')
        equip(sets[mode],{sub="Wise Strap"})
    end
 end

 -- equip Dark Magic set (with Thunder Grip section for Stun)
 function equip_dark(spell)
 
 --		Diabolos' Pole only works while Dark Weather is present 	-- 
 
	if buffactive ['Dark Arts'] and spell.element == world.weather_element and spell.element == world.day_element and player.mpp < 90 and spell.english == 'Drain' 
	or buffactive ['Addendum: Black'] and spell.element == world.weather_element and spell.element == world.day_element and player.mpp < 90 and spell.english == 'Drain'
	or buffactive ['Dark Arts'] and spell.element == world.weather_element and spell.element == world.day_element and player.mpp < 90 and spell.english == 'Aspir'
	or buffactive ['Addendum: Black'] and spell.element == world.weather_element and spell.element == world.day_element and player.mpp < 90 and spell.english == 'Aspir' then
		windower.add_to_chat(8,"[Casting Expert " .. spell.english .. " with Diabolos' Ring and Hachirin-no-Obi]")
		equip(sets.dark,{body="Scholar's Gown +1",left_ring="Diabolos's Ring",waist="Hachirin-no-Obi"})
	elseif spell.element == world.weather_element and spell.element == world.day_element and player.mpp < 90 and spell.english == 'Drain' 
		or spell.element == world.weather_element and spell.element == world.day_element and player.mpp < 90 and spell.english == 'Aspir' then
			windower.add_to_chat(8,"[Casting " .. spell.english .. " with Diabolos' Ring and Hachirin-no-Obi]")
			equip(sets.dark,{left_ring="Diabolos's Ring",waist="Hachirin-no-Obi"})	
		
		elseif buffactive ['Dark Arts'] and spell.element == world.day_element and player.mpp < 90
			or buffactive ['Addendum: Black'] and spell.element == world.day_element and player.mpp < 90 then
			windower.add_to_chat(8,"[Casting Expert " .. spell.english .. " with Diabolos' Ring and Hachirin-no-Obi]")
			equip(sets.dark,{body="Scholar's Gown +1",left_ring="Diabolos's Ring",waist="Hachirin-no-Obi"})
		elseif spell.element == world.day_element and player.mpp < 90 then
			windower.add_to_chat(8,"[Casting " .. spell.english .. " with Diabolos' Ring and Hachirin-no-Obi]")
			equip(sets.dark,{left_ring="Diabolos's Ring",waist="Hachirin-no-Obi"})
		
	elseif buffactive ['Dark Arts'] and spell.element == world.weather_element and spell.english == 'Drain' 
		or buffactive ['Addendum: Black'] and spell.element == world.weather_element and spell.english == 'Drain'
		or buffactive ['Dark Arts'] and spell.element == world.weather_element and spell.english == 'Aspir'
		or buffactive ['Addendum: Black'] and spell.element == world.weather_element and spell.english == 'Aspir' then
			windower.add_to_chat(8,"[Casting Expert " .. spell.english .. " with Hachirin-no-Obi]")
			equip(sets.dark,{body="Scholar's Gown +1",waist="Hachirin-no-Obi"})
	elseif spell.element == world.weather_element and spell.english == 'Drain' 
		or spell.element == world.weather_element and spell.english == 'Aspir' then
			windower.add_to_chat(8,"[Casting " .. spell.english .. " with Hachirin-no-Obi]")
			equip(sets.dark,{waist="Hachirin-no-Obi"})		

		elseif buffactive ['Dark Arts'] and spell.element == world.day_element
			or buffactive ['Addendum: Black'] and spell.element == world.day_element then
			windower.add_to_chat(8,'[Casting Expert ' .. spell.english .. ' with Hachirin-no-Obi]')
			equip(sets.dark,{body="Scholar's Gown +1",waist="Hachirin-no-Obi"})
		elseif spell.element == world.day_element then
			windower.add_to_chat(8,'[Casting ' .. spell.english .. ' with Hachirin-no-Obi]')
			equip(sets.dark,{waist="Hachirin-no-Obi"})	
			
	elseif buffactive ['Dark Arts'] and spell.english == 'Stun' and world.day_element == 'Dark' and player.mpp < 90
		or buffactive ['Addendum: Black'] and spell.english == 'Stun' and world.day_element == 'Dark' and player.mpp < 90 then
		windower.add_to_chat(8,'[Casting Expert Ring-Boosted Stun with Thunder Grip]')
		equip(sets.dark,{sub="Thunder Grip",body="Scholar's Gown +1",left_ring="Diabolos's Ring"})
	elseif spell.english == 'Stun' and world.day_element == 'Dark' and player.mpp < 90 then
		windower.add_to_chat(8,'[Casting Ring-Boosted Stun with Thunder Grip]')
		equip(sets.dark,{sub="Thunder Grip",left_ring="Diabolos's Ring"})		

	elseif buffactive ['Dark Arts'] and spell.english == 'Stun'
		or buffactive ['Addendum: Black'] and spell.english == 'Stun' then
		windower.add_to_chat(8,'[Casting Expert Stun with Thunder Grip]')
		equip(sets.dark,{sub="Thunder Grip",body="Scholar's Gown +1"})
	elseif spell.english == 'Stun' then
		windower.add_to_chat(8,'[Casting Stun with Thunder Grip]')
		equip(sets.dark,{sub="Thunder Grip"})	

	elseif buffactive ['Dark Arts'] 
		or buffactive ['Addendum: Black'] then
        windower.add_to_chat(8,'[Casting Expert ' .. spell.english .. ' with ' .. player.mp .. ' MP remaining]')
		equip(sets.dark,{body="Scholar's Gown +1"})
	else
		windower.add_to_chat(8,'[Casting ' .. spell.english .. ' with ' .. player.mp .. ' MP remaining]')
		equip(sets.dark)
	end
	
	if spell.english == "Klimaform" then
			 windower.add_to_chat(8,'[Casting ' .. spell.english .. ' with ' .. player.mp .. ' MP remaining]')
			 equip(sets.dark,{main="Seveneyes",sub="Legion Scutum",head="Walahra Turban",body="Goliard Saio",
								left_ear="Loquac. Earring",waist="Ninurta's Sash",feet="Rostrum Pumps"})			 
	end						
end

-- equip White Enfeebling Magic set
function equip_whiteenfeebling(spell)
    if buffactive ['Light Arts'] 
	or buffactive ['Addendum: White'] then
		windower.add_to_chat(8,'[Casting Expert ' .. spell.english .. ' with ' .. player.mp .. ' MP remaining]')
		equip(sets.whiteenfeebling,{legs="Scholar's Pants +1"})
	else
		windower.add_to_chat(8,'[Casting ' .. spell.english .. ' with ' .. player.mp .. ' MP remaining]')
		equip(sets.whiteenfeebling)
	end	
end

-- equip Enfeebling Magic set
function equip_enfeebling(spell)
    if buffactive ['Dark Arts'] 
	or buffactive ['Addendum: Black'] then
		windower.add_to_chat(8,'[Casting Expert ' .. spell.english .. ' with ' .. player.mp .. ' MP remaining]')
		equip(sets.enfeebling,{body="Scholar's Gown +1"})
	else
		windower.add_to_chat(8,'[Casting ' .. spell.english .. ' with ' .. player.mp .. ' MP remaining]')
		equip(sets.enfeebling)
	end	
end

-- equip Barspell Magic set
function equip_barspell(spell)
    if buffactive ['Light Arts'] 
	or buffactive ['Addendum: White'] then
		windower.add_to_chat(8,'[Casting Expert ' .. spell.english .. ' with ' .. player.mp .. ' MP remaining]')
		equip(sets.barspell,{legs="Scholar's Pants +1"})
	else
		windower.add_to_chat(8,'[Casting ' .. spell.english .. ' with ' .. player.mp .. ' MP remaining]')
		equip(sets.barspell)
	end	
end

-- equip Regen Magic set
function equip_regen(spell)
    if buffactive ['Light Arts'] 
	or buffactive ['Addendum: White'] then
		windower.add_to_chat(8,'[Casting Expert' .. spell.english .. ' with ' .. player.mp .. ' MP remaining]')
		equip(sets.regen,{legs="Scholar's Pants +1"})
	else
		windower.add_to_chat(8,'[Casting ' .. spell.english .. ' with ' .. player.mp .. ' MP remaining]')
		equip(sets.regen)
	end	
end

-- equip Standard Enhancing Magic set
function equip_enhancing(spell)
	if spell.english == "Stoneskin" then
			 windower.add_to_chat(8,'[Casting ' .. spell.english .. ' with ' .. player.mp .. ' MP remaining]')
			 equip(sets.enhancing,{main="Claustrum",sub="Reign Grip",ammo="Jasper Tathlum",head="Maat's Cap",neck="Stone Gorget",left_ear="Celestial Earring",
									body="Mahatma Hpl.",hands="Sch. Bracers +1",left_ring="Celestial Ring",back="Dew Silk Cape +1",legs="Mahatma Slops",feet="Goliard Clogs"})		 
	
	elseif spell.english:contains('Bar') or spell.english == "Phalanx" then
			 windower.add_to_chat(8,'[Casting ' .. spell.english .. ' with ' .. player.mp .. ' MP remaining]')
			 equip(sets.enhancing,{main="Claustrum",sub="Magic Strap",body="Argute Gown +1"})			 
	
	elseif spell.english == "Blink" then
			 windower.add_to_chat(8,'[Casting ' .. spell.english .. ' with ' .. player.mp .. ' MP remaining]')
			 equip(sets.enhancing,{main="Seveneyes",sub="Genbu's Shield",right_ear="Triton Earring",back="Shadow Mantle"})
	
	else		 
		windower.add_to_chat(8,'[Casting ' .. spell.english .. ' with ' .. player.mp .. ' MP remaining]')
		equip(sets.enhancing)
	end	
		
	if buffactive ['Light Arts'] or buffactive ['Addendum: White'] then
		if spell.english == "Stoneskin" or spell.english:contains('Bar') or spell.english == "Phalanx" or spell.english == "Blink" then
			equip({legs="Scholar's Pants +1"}) 
		end
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
	
	elseif buffactive ['Light Arts'] and spell.element == world.weather_element
		or buffactive ['Addendum: White'] and spell.element == world.weather_element
		or buffactive ['Light Arts'] and spell.element == world.day_element
		or buffactive ['Addendum: White'] and spell.element == world.day_element then
			windower.add_to_chat(8,'[Casting Expert ' .. spell.english .. ' with Hachirin-no-Obi and ' .. player.mp .. ' MP remaining]')
			equip(sets.heal,{waist="Hachirin-no-Obi",legs="Scholar's Pants +1"})
		elseif spell.element == world.weather_element or spell.element == world.day_element then
			windower.add_to_chat(8,'[Casting ' .. spell.english .. ' with Hachirin-no-Obi and ' .. player.mp .. ' MP remaining]')
			equip(sets.heal,{waist="Hachirin-no-Obi"})		
	elseif buffactive ['Light Arts']
		or buffactive ['Addendum: White'] then
		windower.add_to_chat(8,'[Casting Expert ' .. spell.english .. ' with ' .. player.mp .. ' MP remaining]')
		equip(sets.heal,{legs="Scholar's Pants +1"})
		else
			windower.add_to_chat(8,'[Casting ' .. spell.english .. ' with ' .. player.mp .. ' MP remaining]')
			equip(sets.heal)
	end
end

-- equip hMP set
function equip_rest()
    windower.add_to_chat(8,"[Scholar's Resting Set]")
    equip(sets.rest)
end


--[[ *****************
 Casting functions 
******************* --]]
 
 -- Precast use
 function precast(spell)
     if spell.type:contains('Magic') and player.status == 'Engaged' then
--			windower.add_to_chat(8,'[Pre-Cast Set Active]')
			equip(sets.fc,{main='',sub=''})
	elseif spell.type:contains('Magic') and player.tp > 200 then
--			windower.add_to_chat(8,'[Pre-Cast Set Active]')
			equip(sets.fc,{main='',sub=''})
	elseif spell.type:contains('Magic') then
--			windower.add_to_chat(8,'[Pre-Cast Set Active]')
			equip(sets.fc)				
    end
											--	WS Section --
		
	if spell.name == 'Spirit Taker' and world.time <= 1080 and world.time >= 360 then
		windower.add_to_chat(8,"[- " .. spell.name .. " with Fenrir's Earring using " .. player.tp .. "TP -]")
		equip(sets.SpiritTaker,{left_ear="Fenrir's Earring"})
		 elseif spell.name == 'Spirit Taker' then
			 windower.add_to_chat(8,"[- " .. spell.name .. " using " .. player.tp .. "TP -]")
			 equip(sets.SpiritTaker)
		end		
			
	if auto == 'Accurate' and spell.name == 'Gate of Tartarus' and world.time <= 1080 and world.time >= 360 then
		windower.add_to_chat(8,"[- " .. spell.name .. " with Fenrir's Earring using " .. player.tp .. "TP -]")
		equip(sets.Gate,{head="Optical Hat",left_ear="Fenrir's Earring",left_ring="Toreador's Ring",right_ring="Mars's Ring"})
		elseif spell.name == 'Gate of Tartarus' and world.time <= 1080 and world.time >= 360 then
				windower.add_to_chat(8,"[- " .. spell.name .. " with Fenrir's Earring using " .. player.tp .. "TP -]")
				equip(sets.Gate,{left_ear="Fenrir's Earring"})
				
		elseif auto == 'Accurate' and spell.name == 'Gate of Tartarus' then
			 windower.add_to_chat(8,"[- " .. spell.name .. " using " .. player.tp .. "TP -]")
			 equip(sets.Gate,{head="Optical Hat",left_ring="Toreador's Ring",right_ring="Mars's Ring"})
		 elseif spell.name == 'Gate of Tartarus' then
			 windower.add_to_chat(8,"[- " .. spell.name .. " using " .. player.tp .. "TP -]")
			 equip(sets.Gate)
		end		
 end
 
 -- Midcast section
 function midcast(spell)
    if player.status == 'Engaged' and spell.type:contains('Ninjutsu') then
		windower.add_to_chat(8,'[- Hasted Mid-Cast Set Active - ' .. player.mpp .. '% MP remaining -]')
		equip(sets.raise,{main='',sub='',ammo="Fenrir's Stone",neck="Evasion Torque",left_ear="Musical Earring",
						  right_ear="Novia Earring",left_ring="Succor Ring",right_ring="Defending Ring",back="Boxer's Mantle",waist="Ninurta's Sash"})
		elseif player.tp > 200 and spell.type:contains('Ninjutsu') then
			windower.add_to_chat(8,'[- Hasted Mid-Cast Set Active - ' .. player.mpp .. '% MP remaining -]')
			equip(sets.raise,{main='',sub='',ammo="Fenrir's Stone",neck="Evasion Torque",left_ear="Musical Earring",
							  right_ear="Novia Earring",left_ring="Succor Ring",right_ring="Defending Ring",back="Boxer's Mantle",waist="Ninurta's Sash"})
		elseif spell.type:contains('Ninjutsu') then
			windower.add_to_chat(8,'[- Hasted Mid-Cast Set Active - ' .. player.mpp .. '% MP remaining -]')
			equip(sets.raise,{back="Boxer's Mantle"})

	elseif player.status == 'Engaged' and spell.english:contains('raise') then
				equip(sets.raise,{main='',sub=''})
			elseif player.tp > 200 and spell.english:contains('raise') then
				equip(sets.raise,{main='',sub=''})	
			elseif spell.english:contains('raise') then
				equip_heal(spell)	
	
		elseif player.status == 'Engaged' and spell.english:contains('reraise') then
					equip(sets.raise,{main='',sub=''})
				elseif player.tp > 200 and spell.english:contains('reraise') then
					equip(sets.raise,{main='',sub=''})	
				elseif spell.english:contains('reraise') then
					equip_heal(spell)
					
	elseif player.status == 'Engaged' and spell.skill == 'Healing Magic' then
		equip(sets.heal,{main='',sub=''})
		elseif player.tp > 200 and spell.skill == 'Healing Magic' then
			equip(sets.heal,{main='',sub=''})
		elseif spell.skill == 'Healing Magic' then
			equip_heal(spell)
			
	elseif player.status == 'Engaged' and spell.skill == 'Enhancing Magic' then
			equip(sets.enhancing,{main='',sub=''})
		elseif player.tp > 200 and spell.skill == 'Enhancing Magic' then
				equip(sets.enhancing,{main='',sub=''})
		elseif spell.skill == 'Enhancing Magic' then
				equip_enhancing(spell)	
		
	elseif player.status == 'Engaged' and spell.english == ("Slow")
		or player.status == 'Engaged' and spell.english == ("Paralyze")
		or player.status == 'Engaged' and spell.english == ("Silence")
		or player.status == 'Engaged' and spell.english:contains("Dia") then
			equip(sets.whiteenfeebling,{main='',sub=''})
		elseif player.tp > 200 and spell.english == ("Slow")
			or player.tp > 200 and spell.english == ("Paralyze")
			or player.tp > 200 and spell.english == ("Silence")
			or player.tp > 200 and spell.english:contains("Dia") then
				equip(sets.whiteenfeebling,{main='',sub=''})	
		elseif spell.english == ("Slow") 
			or spell.english == ("Paralyze")
			or spell.english == ("Silence")
			or spell.english:contains("Dia") then
				equip_whiteenfeebling(spell)
		
	elseif player.status == 'Engaged' and spell.skill == 'Enfeebling Magic' then
				equip(sets.enfeebling,{main='',sub=''})
			elseif player.tp > 200 and spell.skill == 'Enfeebling Magic' then
				equip(sets.enfeebling,{main='',sub=''}) 
			elseif spell.skill == 'Enfeebling Magic' then
				equip_enfeebling(spell) 
	
	elseif player.status == 'Engaged' and spell.skill == 'Dark Magic' then
				equip_(sets.dark,{main='',sub=''})
			elseif player.tp > 200 and spell.skill == 'Dark Magic' then
				equip_(sets.dark,{main='',sub=''}) 
			elseif spell.skill == 'Dark Magic' then
				equip_dark(spell) 	

	elseif player.status == 'Engaged' and spell.english:contains("helix") then
			equip(sets.helix,{main='',sub=''})
		elseif player.tp > 200 and spell.english:contains("helix") then
				equip(sets.helix,{main='',sub=''})	
			elseif spell.english:contains("helix") then
					equip(sets.helix)				
	
		elseif player.status == 'Engaged' and spell.skill == 'Elemental Magic' then
					equip(sets.damage,{main='',sub=''})
				elseif player.tp > 200 and spell.skill == 'Dark Magic' then
					equip(sets.damage,{main='',sub=''}) 
				elseif spell.skill == 'Elemental Magic' then
					equip_nuke(spell) 			
    end
 end
  
 -- Aftercast /return to idle -- Auto-use Sublimation if current MP is below stated value
 function aftercast(spell,action,eventArgs)
	if buffactive ['Sublimation: Complete'] and player.mp < 400 then
		send_command('input /echo • • • • • MP is getting low, using Sublimation! • • • • •;wait 1;input /ja Sublimation <me>')
		equip_idle()
		else
	end	
		
	if player.status == 'Engaged' then
			equip_Attack()
			
		elseif player.tp > 107 then
				equip(sets.idleHPMP,{main='',sub=''})
				windower.add_to_chat(8,'[- Saving TP - Claustrum will stay equipped. -]')
			else
			
		equip_idle()
	end	
end
 
-- status change function handling idle, engaging, resting, etc.
function status_change(new,old)
    if new == 'Resting' then
        equip_rest();
		send_command('wait 0.2;input /equip ring1 "Celestial Ring";wait 0.2;input /equip ring2 "Celestial Ring"')
	elseif new == 'Engaged' then
        equip_Attack();	
    elseif player.tp > 107 then
         equip(sets.idleHPMP,{main='',sub=''});
		 send_command('wait 0.2;input /equip ear1 "Celestial Earring";wait 0.2;input /equip ear2 "Celestial Earring"')
	else
         equip_idle()	 
    end
 end

-- command function will handle Elemental attack mode
 function self_command(m)
    if m == "M+" then
        if mode == "damage" then
            mode = "accuracy"
        elseif
            mode == "accuracy" then
			 mode = "lowtier"
			 else
			  mode = "damage"
        end
         windower.add_to_chat(8,'[Magic mode: ' .. mode .. ']')
    end
		
		if m == "A+" then
		if auto == "Hasted" then
			auto = "Accurate"
		elseif auto == "Accurate" then
			auto = "Evasive"
		else
			auto = "Hasted"
		 
		 end
         windower.add_to_chat(8,'[Melee mode: ' .. auto .. ']')
    end
 end
 
 function buff_change(name,gain,eventArgs)

	if name == "Silence" and gain =="True" then
		send_command('@input /item "Echo Drops" <me>')
	end

end
 
 --[[ *****************************
  Run once @ job change to SCH
********************************* --]]
 
  -- Mode signifies which attack set WHM will cast Divine spells in - Damage, Resist, or Low-tier
 mode = "damage"
 auto = "Hasted"
 
 
 -- Puts on lockstle and switch to idle set.
 -- Lockstyle included due to Claustrum + SCH issue
 send_command('wait 1;input /lockstyleset 99;wait 1;gs equip idleHPMP')
 send_command('input /macro book 8; wait 0.1; input /macro set 1')
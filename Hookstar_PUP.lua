--[[ *************************************************************
 BASED OF Wren's THF gearswap .lua for SuperNova FFXI
 Save as windower/addons/GearSwap/data/PUP.lua

 REVISED BY ACROSS
************************************************************* --]]
 --[[ ******************************************************
  Gearsets - define the various sets of gear we'll wear.
****************************************************** --]] 
 function get_sets()
-- fashion set is for looking nice while lockstyled.
-- make sure you include your top-row equipment,
-- especially if you use a ranged or throwing weapon.
    sets.fashion = {
        main        = "Spharai",
        sub         = empty,
        range       = "Turbo Animator",
        head        = "Sheep cap",
        body        = "Hydra Doublet",
        hands       = "Pantin Dastanas +1",
        legs        = "Martial Slacks",
        feet        = "Puppetry Babouches"
    }
-- idle set is worn when we're standing around doing
-- nothing.  we want movement speed and evasion.
    sets.idle = {
--        main        = "Hades Sainti +1",
		range		= "Turbo Animator",
		ammo		= "Automat. Oil +2",
        head        = "Spurrer Beret",
        neck        = "Shepherd's Chain", --mix coast bird
        left_ear    = "Triton Earring",
        right_ear   = "Triton Earring",
        body        = "Pantin Tobe +1",
        hands       = "Pantin Dastanas +1",
        left_ring   = "Wivre Ring +1",
        right_ring  = "Wivre Ring +1",
        back        = "Pantin Cape",
        waist       = "Selemnus Belt",
        legs        = "Raven Hose",
        feet        = "Hermes' Sandals +1"
    }  
-- our basic engaged set replaces some of our idle
-- evasion slots with haste, dual wield, accuracy.
    sets.engaged = {
		ammo		= "Automat. Oil +2",
        head        = "Spurrer Beret",
        neck        = "Faith Torque",
        left_ear    = "Diabolos's Earring",
        right_ear   = "Pixie Earring",
--        body        = "Pantin Tobe +1",
        body        = "Enkidu's Harness",
        hands       = "Pantin Dastanas +1",
        left_ring   = "Rajas Ring",
        right_ring  = "Toreador's Ring",
        back        = "Pantin Cape",
        waist       = "Velocious Belt", -- V belt?!
        legs        = "Enkidu's Subligar",--storage
        feet        = "Setanta's Led." --get
    }
-- our evasion set, when dodging is all that matters.
-- this is very similar to our idle set, excapt we
-- sacrifice movement speed for even more evasion.
    sets.eva = {
        head        = "Optical Hat",
        neck        = "Evasion Torque",
        body        = "Antares Harness",
        hands       = "Raven Bracers",
        left_ear    = "Triton Earring",
        right_ear   = "Triton Earring",
        left_ring   = "Wivre Ring +1",
        right_ring  = "Wivre Ring +1",
        waist       = "Mithran Stone",
        legs        = "raven Hose",
        back        = "Boxer's Mantle",
        feet        = "Dance Shoes +1"
    }
-- REPAIR set
	sets.repair = {
		ammo		= "Automat. Oil +2",
		right_ear   = "Guignol Earring",
        feet        = "Puppetry Babouches"
    }
-- MANEUVERS set focuses on AGI+ since I mostly use Wind Maneuvers for ranger Bot
    sets.maneuver = {
        neck        = "Buffoon's Collar +1",
        hands       = "Puppetry Dastanas",
		ammo		= "Automat. Oil +2",
        head        = "Maat's Cap"
    }
    sets.wind = {
        neck        = "Buffoon's Collar +1",
        hands       = "Puppetry Dastanas",
		ammo		= "Automat. Oil +2",
        head        = "Empress Hairpin",
        left_ear    = "Drone Earring",
        right_ear   = "Drone Earring",
        body        = "Antares Harness",
        left_ring   = "Nimble Ring +1",
        right_ring  = "Nimble Ring +1",
        feet        = "Enkidu's Leggings"
    }	
    sets.thunder = {
        neck        = "Buffoon's Collar +1",
        hands       = "Puppetry Dastanas",
		ammo		= "Automat. Oil +2",
        head        = "Empress Hairpin",
        body        = "Antares Harness",
        left_ear    = "Adroit Earring",
        right_ear   = "Adroit Earring",
        left_ring   = "Adroit Ring +1",
        right_ring  = "Adroit Ring +1",
        legs		= "Enkidu's Subligar",
        feet        = "Enkidu's Leggings"
    }
    sets.water = {
        neck        = "Buffoon's Collar +1",
        hands       = "Puppetry Dastanas",
		ammo		= "Automat. Oil +2",
        head        = "Mahatma Hat",
        body        = "Mahatma Hpl.",
        left_ear    = "Celestial Earring",
        right_ear   = "Celestial Earring",
        left_ring   = "Celestial Ring",
        right_ring  = "Celestial Ring",
        legs		= "Mahatma Slops",
        back		= "Prism Cape",
        feet        = "Mahatma Pigaches"
    }
    sets.ice = {
        neck        = "Buffoon's Collar +1",
        hands       = "Puppetry Dastanas",
		ammo		= "Automat. Oil +2",
        head        = "Mahatma Hat",
        body        = "Mahatma Hpl.",
        left_ear    = "Morion Earring +1",
        right_ear   = "Morion Earring +1",
        left_ring   = "Omn. Ring +1",
        right_ring  = "Omn. Ring +1",
        legs		= "Mahatma Slops",
        back		= "Prism Cape",
        feet        = "Wood F Ledelsens"
    }
    sets.light = {
        neck        = "Buffoon's Collar +1",
        hands       = "Puppetry Dastanas",
		ammo		= "Automat. Oil +2",
        body        = "Mahatma Hpl.",
        left_ring   = "Heaven's Ring +1",
        right_ring  = "Heaven's Ring +1",
        legs		= "Mahatma Slops",
        back		= "Jester's Cape +1",
		waist		= "Corsette +1",
        feet        = "Dance Shoes +1"
    }
    sets.earth = {
        neck        = "Buffoon's Collar +1",
        hands       = "Puppetry Dastanas",
		ammo		= "Automat. Oil +2",
        body        = "Avalon Breastplate",
		waist		= "Mrc.Cpt. Belt"
    }
    sets.fire = {
        neck        = "Buffoon's Collar +1",
        hands       = "Puppetry Dastanas",
		ammo		= "Automat. Oil +2",
        left_ear    = "Harmonius Earring",
        right_ear   = "Harmonius Earring",
        left_ring   = "Harmonius Ring",
        right_ring  = "Harmonius Ring",
        legs		= "Enkidu's Subligar",
		waist		= "Grenadier Belt",
        feet        = "Puppetry Babouches"
    }
-- FINAL HEAVEN set with max STR
    sets.final = {
        head        = "Gnadbhod's Helm",
        neck        = "Fotia Gorget",
        left_ear    = "Brutal Earring",
        right_ear   = "Harmonius Earring",
        body        = "Enkidu's Harness",
        hands       = "Enkidu's Mittens",
        left_ring   = "Rajas Ring",
        right_ring  = "Harmonius Ring",
        back        = "Pantin Cape",
        waist       = "Potent Belt",
        legs        = "Enkidu's Subligar",
        feet        = "Setanta's Led."
    }
-- STRINGING PUMMEL set with max STR and acc cause VIT as a mod sucks
    sets.pummel = {
        head        = "Maat's Cap",
        neck        = "Fotia Gorget",
        left_ear    = "Brutal Earring",
        right_ear   = "Harmonius Earring",
        body        = "Enkidu's Harness",
        hands       = "Creek F Mitts",
        left_ring   = "Rajas Ring",
        right_ring  = "Harmonius Ring",
        back        = "Pantin Cape",
        waist       = "Potent Belt",
        legs        = "Enkidu's Subligar",
        feet        = "Creek F Clomps"
    }
-- ASURAN FISTS set with max :::
    sets.asuran = {
        head        = "Gnadbhod's Helm",
        neck        = "Fotia Gorget",
        left_ear    = "Brutal Earring",
        right_ear   = "Harmonius Earring",
        body        = "Antares Harness",
        hands       = "Enkidu's Mittens",
        left_ring   = "Lava's Ring",
        right_ring  = "Kusha's Ring",
        back        = "Pantin Cape",
        waist       = "Virtuoso Belt",
        legs        = "Enkidu's Subligar",
        feet        = "Setanta's Led."
    }
-- DRAGON KICK set with max :::
    sets.kick = {
        head        = "Gnadbhod's Helm",
        neck        = "Fotia Gorget",
        left_ear    = "Brutal Earring",
        right_ear   = "Harmonius Earring",
        body        = "Antares Harness",
        hands       = "Enkidu's Mittens",
        left_ring   = "Harmonius Ring",
        right_ring  = "Harmonius Ring",
        back        = "Pantin Cape",
        waist       = "Potent Belt",
        legs        = "Enkidu's Subligar",
        feet        = "Setanta's Led."
    }
-- fast cast for ninjutsu
    sets.fc = {
        head        = "Walahra Turban",
        right_ear   = "Loquac. Earring",
        left_ear   	= "Celestial Earring",
        body        = "Goliard Saio",
		neck		= "Beak Necklace +1",
        hands       = "Pantin Dastanas +1",
        left_ring   = "Succor Ring",
        right_ring  = "Shadow Ring",
        back        = "Veela Cape",
        waist       = "Headlong Belt",
        legs        = "Goliard Trews",
        feet        = "Rostrum Pumps"
    }
-- Curing Waltz set filled with CHR for the heals.
    sets.waltz = {
        head        = "Maat's Cap",
        body        = "Avalon Breastplate",
        hands       = "Pantin Dastanas +1",
        left_ring   = "Roundel Earring",
        left_ring   = "Heavens Ring +1",
        right_ring  = "Heavens Ring +1",
        feet        = "Dance Shoes +1"
    }
-- Stoneskin SET
    sets.skin = {
        head        = "Maat's Cap",
		neck		= "Stone Gorget",
        left_ear    = "Celestial Earring",
        right_ear   = "Celestial Earring",
        body        = "Mahatma Hpl.",
        hands       = "Devotee's Mitts +1",
        left_ring   = "Celestial Ring",
        right_ring  = "Celestial Ring",
        back        = "Dew Silk Cape +1",
        waist       = "Pythia Sash +1",
        legs        = "Mahatma Slops",
        feet        = "Mahatma Pigaches"
    }
-- CURES SET
    sets.cures = {
        head        = "Goliard chapeau",
		neck		= "Fylgja Torque +1",
        left_ear    = "Roundel Earring",
        right_ear   = "Loquac. Earring",
        body        = "Mahatma Hpl.",
        hands       = "Devotee's Mitts +1",
        left_ring   = "Celestial Ring",
        right_ring  = "Celestial Ring",
        back        = "Dew Silk Cape +1",
        waist       = "Pythia Sash +1",
        legs        = "Mahatma Slops",
        feet        = "Rostrum Pumps"
    }
-- ACCURACY SET FOR STEPS
    sets.acc = {
        head        = "Optical Hat",
		neck		= "Ancient Torque",
        left_ear    = "Diabolos's Earring",
        right_ear   = "Pixie Earring",
        body        = "Antares Harness",
        hands       = "Enkidu's Mittens",
        left_ring   = "Lava's Ring",
        right_ring  = "Kusha's Ring",
        back        = "Pantin Cape",
        waist       = "Virtuoso Belt",
        legs        = "Surge Subligar",
        feet        = "Setanta's led."
    }
end

 function debugMsg(txt)
    local s = txt
    if(pupswap.debug) then windower.add_to_chat(8, s) end
	end	
function isDayElement(element)
   local result = false
    
   if world.day_element == element then
       result = true
		
    end
    
    return result
 end
 function isDayTime()
    local result = true
    if world.time > (18*60) or world.time <= (6*60) then
	result = false
    end
	return result
 end 
 --[[ ******************************************************
  Equip functions - put on the sets we defined above, and
 echo a note to our chat log so we know it worked.
****************************************************** --]]
-- equip our idle set
 function equip_idle()
		local debug_info = ''
	if heal 
		then equip(set_combine(sets.idle,{legs="Puppetry Churidars +1"}))
			debug_info = debug_info .. '[Heal Bot]'
	elseif mage 
		then equip(set_combine(sets.idle,{legs="Pantin Churidars +1" ; feet="Pantin Babouches +1"}))
			debug_info = debug_info .. '[Mage Bot]'
	elseif (buffactive['Thunder Maneuver']) then equip(set_combine(sets.idle,{back="Pantin Cape"}))
			debug_info = debug_info .. '[Pantin Cape]'
	else equip(sets.idle)
			debug_info = debug_info .. '[Idle]'
--	windower.add_to_chat(8,'[Idle]')
	end
debugMsg(debug_info)
end
-- equip our engaged set
function equip_engaged()
    local debug_info = '[Engaged'
	if eva and heals 
		then equip(set_combine(sets.eva,{legs="Puppetry Churidars"}))
			debug_info = debug_info .. ' on Evasion & Heal Bot]'
	elseif eva 
		then equip(sets.eva)
			debug_info = debug_info .. ' on Evasion set]'
	elseif mage 
		then equip(set_combine(sets.engaged,{legs="Pantin Churidars +1" ; feet="Pantin Babouches +1"}))
			debug_info = debug_info .. ' w/ Mage Bot]'
	elseif acc 
		then equip(set_combine(sets.engaged,{left_ring="Lava's Ring" ; right_ring="Kusha's Ring" ; waist="Virtuoso Belt"; neck="Ancient Torque"}))
			debug_info = debug_info .. ' w/ mandi rings]'
	elseif world.weather_element == 'Dark' then equip(set_combine(sets.engaged,{left_ear="Accurate Earring"}))
			debug_info = debug_info .. ' on Dark Weather]'
	elseif world.time <= (18*60) or world.time >= (6*60) 
		then equip(set_combine(sets.engaged,{right_ear="Fenrir's Earring"}))
			debug_info = debug_info .. ' - Day Time]'
	else equip(sets.engaged)
			debug_info = debug_info .. ']'
	end
debugMsg(debug_info)
end
-- Function to get the propper WS set depending on WS
 function equip_ws(spell)
 		local debug_info = ''
	if player.target.distance > 5 then add_to_chat(122,'You are too far to WS.')
	cancel_spell() -- if we're too far, cancel the WS to prevent TP loss
	end
	if spell.name == 'Final Heaven'
		then equip(sets.final)
			debug_info = debug_info .. '[Final Heaven]'
	elseif spell.name == 'Stringing Pummel' 
		then equip(sets.pummel)
			debug_info = debug_info .. '[Stringing Camels]'
	elseif spell.name == 'Asuran Fists' or spell.name == 'Raging Fists' 
		then equip(sets.asuran)
			debug_info = debug_info .. '[Multi Hit WS]'
	else equip(sets.kick)
		debug_info = debug_info .. '[STR/DEX WS]'
    end
debugMsg(debug_info)
 end
-- equip our waltz set
function equip_waltz()
	equip(sets.waltz)
end 
-- function to precast equip propper sets for each MANEUVER TYPE
 function equip_maneuvers(spell)
 		local debug_info = ''
    if spell.name == 'Wind Maneuver' then equip(sets.wind)
debug_info = debug_info .. '[Wind Maneuver]'
	elseif spell.name == 'Thunder Maneuver' then equip(sets.thunder)
debug_info = debug_info .. '[Thunder Maneuver]'
	elseif spell.name == 'Water Maneuver' then equip(sets.water)
debug_info = debug_info .. '[Water Maneuver]'
	elseif spell.name == 'Light Maneuver' then equip(sets.light)
debug_info = debug_info .. '[Light Maneuver]'
	elseif spell.name == 'Earth Maneuver' then equip(sets.earth)
debug_info = debug_info .. '[Earth Maneuver]'
	elseif spell.name == 'Fire Maneuver' then equip(sets.fire)
debug_info = debug_info .. '[Fire Maneuver]'
	elseif spell.name == 'Ice Maneuver' then equip(sets.ice)
debug_info = debug_info .. '[Ice Maneuver]'
	elseif string.find(spell.english,'Maneuver') then equip(sets.maneuver)
debug_info = debug_info .. '[General Maneuvers]'
end
debugMsg(debug_info)
 end
-- the choose_set function figures out whether we're engaged with a
-- mob or not, and passes control to the relevant function above.
 function choose_set()
 if player.status == "Engaged" then equip_engaged()
    elseif player.status == "Resting" then equip(set_combine(sets.idle,{head="Pantin Taj +1"}))
	windower.add_to_chat(8,'[Bot Regen head]')
	else equip_idle()
 end
end
 --[[ ******************************************************
  Casting functions - these functions run automatically when
 we cast a spell, use a job ability, rest for MP, and so on
****************************************************** --]]
-- the precast function runs automatically BEFORE we
-- begin casting a spell or job ability.  For our THF,
-- we want to equip ws gear for weapon skills, and flee
-- duration gear when fleeing.
 function precast(spell)
  		local debug_info = ''
	if spell.english == 'Spectral Jig' and buffactive.sneak 
	then	cast_delay(0.2)
			send_command('cancel sneak')
    elseif spell.english == 'Sneak' and spell.target.type == 'SELF' and buffactive.sneak 
	then send_command('cancel sneak')
    elseif spell.english:startswith('Monomi') and spell.target.type == 'SELF' and buffactive.sneak 
		then send_command('@wait 1.4;cancel sneak')
    elseif spell.english == 'Utsusemi: Ichi' then send_command('@wait 1.7;cancel copy image,copy image (2)')
	end
	if spell.type == 'Ninjutsu' then equip(sets.fc)
    elseif spell.name == 'Stoneskin' then 
	equip(sets.skin)
	send_command('@wait 6.0;cancel stoneskin')
	debug_info = debug_info .. '[Stoneskin]'
    elseif spell.type == 'WeaponSkill' then equip_ws(spell)
    elseif spell.name == 'Repair' then equip(sets.repair)
	elseif string.find(spell.english,'Maneuver') then equip_maneuvers(spell)
    elseif string.find(spell.english,'Waltz') then equip(sets.waltz)
debug_info = debug_info .. '[Waltzing]'
    elseif spell.name:startswith('Cur') then equip(sets.cures)
debug_info = debug_info .. '[Cures]'
	elseif (spell.type:contains('Magic')) then equip(sets.fc)
debug_info = debug_info .. '[Magics]'
    end
	if spell.name == 'Box Step' or spell.name == 'Quickstep'
	then 	equip(sets.acc)
			debug_info = debug_info .. '[Steps]'
	end
debugMsg(debug_info)
 end
-- equip haste gear for ninjutsu
 function midcast(spell)
    if spell.type == 'Ninjutsu' then equip(sets.fc)
    end
 end
-- after we JA or WS, we want to return either to our
-- engaged gear or our idle gear.  The choose_set function
-- handles that for us.
 function aftercast(spell)
     choose_set()
	 end
-- status_change also calls the choose_set function, which
-- handles engaging and disengaging from combat.
function status_change(new,old)
    choose_set()
end

-- Finally, SELF COMMAND functions to toggle TH4, EVA, ACC modes by turning
-- those modes on, through a Toggle check
-- PRESS the macro twice in game to turn the toggle/mode off
-- Ex: a macro in game [/console gs m TH]
function self_command(m)
  		local debug_info = ''
	if m == "EVA" then
        if eva == false then
           eva = true
debug_info = debug_info .. '[Eva mode ON]'
        else eva = false
debug_info = debug_info .. '[Eva mode OFF]'
		end
	elseif m == "HEAL" then
        if heal == false then
           heal = true
debug_info = debug_info .. '[HEAL mode ON]'
        else heal = false
debug_info = debug_info .. '[HEAL mode OFF]'
		end
	elseif m == "MAGE" then
        if mage == false then
           mage = true
debug_info = debug_info .. '[MAGE mode ON]'
		choose_set()
        else mage = false 
debug_info = debug_info .. '[MAGE mode OFF]'
		choose_set()
		end
	elseif m == "acc" then
        if acc == false then
           acc = true
debug_info = debug_info .. '[Mandi rings ON]'
        else acc = false
debug_info = debug_info .. '[Mandi Rings OFF]'
		end
	elseif m == "banes" then
        if banes == false then
            banes = true
		debug_info = debug_info .. '[Birdbanes: ON]'
            equip({main="Birdbanes"})
            disable('main')
            choose_set()
        else banes = false
            enable('main')
			equip({main="Hades Sainti +1"})
            choose_set()
		debug_info = debug_info .. '[Birdbanes: OFF]'
        end
	end
debugMsg(debug_info)	
 end
 --[[ ******************************************************
  Code that runs once, when we first swap to our THF job
****************************************************** --]]
 pupswap = {}
 pupswap.debug = true;
 pupswap.ws = "Final Heaven"
-- FOR TOGGLE IF USING WHM/HEALING BOTs
 heal = false
 -- FOR TOGGLE IF USING BLM OR RDM BOTs
 mage = false
-- FOR TOGGLE whether we should wear our evasion gear in combat
 eva = false
 acc = false
 banes = false
-- Finally, puts on our fashion set, lockstyle it, then switch to our idle set. 
 send_command('wait 1; input /equipset 020; wait 1; input /lockstyleset 020; wait 1; gs equip idle; wait 1; input /macro book 9; wait 1; input //lua l autocontrol;  wait 1; input //lua l pointwatch; wait 1; input //lua l PetTP; wait 1; input //ac hide')
 -- equipset 20 is the original wedding dress lockstyle
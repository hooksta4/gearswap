--[[ *************************************************************
 PLD gearswap .lua for SuperNova FFXI
 Save as windower/addons/GearSwap/data/PLD.lua
 Revised by Laerion
 
  2016-07-27 OC  - First version. Commented to help newbies. :)
  2016-08-03 OC  - Relaxing earring
 2016-08-25 OC  - Shadow Mantle
 2016-12-02 OC  - Loquac. Earring, Boxer's Mantle
************************************************************* --]]
 
 --[[ ******************************************************
  Gearsets - define the various sets of gear we'll wear.
****************************************************** --]]
 
function get_sets()

     -- fashion set is for looking nice while lockstyled.
    -- make sure you include your top-row equipment,
    -- especially if you use a ranged or throwing weapon.
    -- I like how the Hydra armor looks.
    sets.fashion = {
        main        = "Excalibur",
        sub         = "Aegis",
        ammo        = "empty",
        head        = "Maat's cap",
        body        = "Valkyrie's breastplate",
        hands       = "Homam Manopolas",
        legs        = "Homam Cosciales",
        feet        = "Askar Gambieras",
		}
 
     -- idle set is worn when we're standing around doing
    -- nothing.  we want auto-refresh, movement
    sets.idle = {
        main        = "Excalibur",
        sub         = "Aegis",
        range       = "Lamian Kaman +1",
        ammo        = "",
        head        = "Blood Mask",
        neck        = "Parade Gorget",
        left_ear    = "Knightly earring",
        right_ear   = "Ethereal Earring",
        body        = "Hydra haubert",
        hands       = "Homam Manopolas",
        left_ring   = "Patronus Ring",
        right_ring  = "Shadow Ring",
        back        = "Boxer's Mantle",
        waist       = "Warwolf belt",
        legs        = "Blood Cuisses",
        feet        = "Askar Gambieras"}
 
 
    sets.att = {}
     -- we throw on our engaged set when we engage a mob
    -- adds defense and shield skill
    sets.att.engaged = {
        head        = "Nocturnus Helm",
        neck        = "Fortitude torque",
		left_ear    = "Buckler Earring",
        right_ear   = "Ethereal Earring",
        body        = "Nocturnus mail",
		hands       = "Homam Manopolas",
		left_ring   = "Patronus Ring",
        right_ring  = "Shadow Ring",
		waist       = "Warwolf Belt",
        back        = "Boxer's Mantle",
        legs        = "Homam Cosciales",
		feet        = "Askar Gambieras"}
		
		  -- Less Magic Damage, Physical Damage and Defense up
    sets.att.magicdef = {
	    sub         = "Lamian Kaman +1",
        head        = "Valhalla Helm",
        neck        = "Shield torque",
		left_ear    = "Merman's Earring",    
        right_ear   = "Ethereal Earring",
        body        = "Valhalla Breastplate",       -- Valhalla Breastplate
		hands       = "Iron Ram Dastanas",
		left_ring   = "Minerva's Ring",
        right_ring  = "Succor Ring",               -- Shadow Ring in Darksday -10Magic Def Bonus
        waist       = "Resolute Belt",		
        back        = "Lamia Mantle +1",
        legs        = "Iron Ram Hose",
		feet        = "Iron Ram Greaves"}
     
	   -- Breath Damage
    sets.att.breath = {
	    range       = "Lamian Kaman +1",
        head        = "Valhalla Helm",             --Valhala Helm
        neck        = "Shield Torque",
		left_ear    = "Harmonius Earring",
        right_ear   = "Ethereal Earring",
        body        = "Blood Scale Mail",
		hands       = "Kaiser Handschuhs",
		left_ring   = "Shadow Ring",
        right_ring  = "Succor Ring",           -- Shadow Ring in Darksday
		waist       = "Resolute Belt",
        back        = "Boxer's Mantle",
        legs        = "Iron ram hose",
		feet        = "Askar Gambieras"}
		
	sets.att.damage = {
	    
        head        = "Nocturnus helm",
        neck        = "Fortitude Torque",
		left_ear    = "Brutal Earring",
        right_ear   = "Ethereal Earring",
        body        = "Nocturnus Mail",
		hands       = "Homam Manopolas",
		left_ring   = "Rajas Ring",
        right_ring  = "Toreador's ring",
        back        = "Cerb. Mantle +1",
		waist       = "Warwolf belt",
        legs        = "Homam Cosciales",
		feet        = "Homam Gambieras"}
 
     -- stacking heat for Atonement 
     -- our enmity set stacks enmity
    sets.enmity = {
        head        = "Aegishjalmr",
        neck        = "Ritter gorget",
        left_ear    = "Hades Earring +1",
        right_ear   = "Hades Earring +1",
        body        = "Hydra Haubert",
        hands       = "Hydra Moufles",
        left_ring   = "Mermaid Ring",
        right_ring  = "Hercules' Ring",
        back        = "Cerb. Mantle +1",
        waist       = "Trance Belt",
        legs        = "Hydra Brayettes",
        feet        = "Hydra Sollerets"}
     
     -- stacking STR and MND for Knights of Round
    sets.kor = {
        head        = "Maat's cap",
        neck        = "Fotia gorget",
        left_ear    = "Celestial Earring",
        right_ear   = "Celestial Earring",
        body        = "Hct. Harness +1",
        hands       = "Hct. Mittens +1",
        left_ring   = "Rajas Ring",
        right_ring  = "Celestial Ring",
        back        = "Cuchulain's Mantle",
        waist       = "Warwolf Belt",
        legs        = "Hct. Subligar +1",
        feet        = "Hct. Leggings +1"}
 
     -- stacking STR for multi WS
    sets.str = {
        head        = "Hct. Cap +1",
        neck        = "Fotia gorget",
        left_ear    = "Harmonius Earring",
        right_ear   = "Cassie earring",
        body        = "Hct. Harness +1",
        hands       = "Hct. Mittens +1",
        left_ring   = "Harmonius Ring",
        right_ring  = "Rajas Ring",
        back        = "Cuchulain's Mantle",
        waist       = "Warwolf Belt",
        legs        = "Hct. Subligar +1",
        feet        = "Hct. Leggings +1"}
		
		 -- Parade Gorget set
    sets.parade = {neck = "Parade Gorget"}
		
    -- Hachirin no Obi set
	sets.obi = {waist = "Hachirin-no-Obi"}
 
     -- our base haste set for flash and utsu
    sets.haste = {
        head        = "Walahra Turban",
        hands       = "Dusk Gloves +1",
        waist       = "Velocious Belt",
        legs        = "Homam Cosciales",
        feet        = "Dusk Ledelsens +1"}
     
     -- for utsu, we sacrifice some enmity for shield
    -- skill because shield blocks prevent interruption.
    sets.utsu = {
        neck        = "Shield Torque",
        left_ear    = "Buckler Earring",
        right_ear   = "Knightly Earring",
		legs        = "Valor Breeches +1",    
		back        = "Boxer's Mantle"}
		
     -- Fast Cast set
     sets.fc = {
        right_ear   = "Loquac. Earring",
        legs        = "Homam Cosciales"}
		
	 -- Interrupt down set for low HP
	sets.interrupt = {left_ear="Guardian Earring"}
		
		   -- our resting set is for hMP.
    sets.rest = {
	   ammo        = "",
	   head        = "Blood Mask",
        neck        = "Gnole torque",
        left_ear    = "Relaxing earring",
        right_ear   = "antivenom earring",
        left_ring   = "Celestial Ring",
        right_ring  = "Celestial Ring",
        waist       = "Hierarch Belt"}
		
		 -- for Healing Magic
	sets.healing = {
	    head        = "Valor Coronet +1",
	    left_ear    = "Hospitaler Earring",
		right_ear   = "Knightly Earring",
        neck        = "Healing Torque",
		waist       = "Velocious Belt",
		legs        = "Valor Breeches +1",
        left_ring   = "Patronus Ring",
        right_ring  = "Celestial Ring",
        back        = "Altruistic Cape"}
 
     -- for Divine Magic
	sets.divine = {
	    head        = "Walahra Turban",
        hands       = "Dusk Gloves +1",
        waist       = "Velocious Belt",
        legs        = "Homam Cosciales",
	    left_ear    = "Divine Earring",
		body        = "Gallant Surcoat +1",
		neck        = "Divine Torque",
        back        = "Altruistic Cape",
		feet        = "Templar Sabatons"}    --Dusk Ledelsens +1
		   
     -- Shield Bash set
    sets.bash = {
        right_ear   = "Knightly Earring",
		left_ear    = "Buckler Earring",
        left_ring   = "Fenian Ring",
        hands       = "Vlr. Gauntlets +1"}
 
     -- Sentinel set
    sets.sentinel = {feet = "Vlr. Leggings +1"}
 
     -- Rampart set
    sets.rampart = {head = "Vlr. Coronet +1"}
	
	 -- Holy Circle set
	sets.holycircle = {feet	= "Gallant Leggings +1"}
		
	 -- Cover set
	sets.cover = {
	    head        = "Gallant Coronet",
		body        = "Valor Surcoat +1"}
		
	 -- Chivalry MND set
	sets.chivalry = { 
		head		= "Maat's Cape",
		body		= "Blood Scale Mail",
		legs		= "",
		feet		= "Vlr. Leggings +1",
		neck		= "Faith Torque",
		waist		= "Pythia Sash +1",
		left_ear	= "Celestial Earring",
		right_ear	= "Celestial Earring",
		left_ring	= "Celestial Ring",
		right_ring	= "Celestial Ring"}
		
	--Reprisal Set
		sets.reprisal = { -- Haste/FC > HP+
		head		= "Walahra Turban",
		body		= "Blood Scale Mail",
		hands		= "Dusk Gloves +1",
		legs		= "Homam Cosciales",
		feet		= "Homam Gambieras",
		neck		= "Tempered Chain",          --Bloodbead Gorget
		waist		= "Velocious Belt",
		left_ear	= "Harmonius Earring",
		right_ear   = "Loquac. Earring",
		left_ring	= "Patronus Ring",
		right_ring  = "Harmonius Ring",
		back		= "Gigant Mantle",}
		
	 -- Steps set
	sets.steps = {
	    head        = "Optical Hat",
	    body	    = "Nocturnus mail",
        hands       = "Hydra Moufles",
		legs       = "Homam cosciales",
        feet		= "Homam Gambieras",
        neck        = "Peacock Amulet",
		waist       = "Virtuoso Belt",
        left_ear    = "Diabolos's Earring",   -- Change it in Darksday
        right_ear   = "Pixie Earring",
        left_ring   = "Toreador's Ring",
        right_ring  = "Rajas Ring",
        back        = "Cuchulain's Mantle"}

	 -- GS Set
	sets.gs = {
	    head        = "Optical Hat",
	    body	    = "Nocturnus mail",
        hands       = "Hydra Moufles",
		legs        = "Homam cosciales",
        feet		= "Homam Gambieras",
        neck        = "Peacock Amulet",
		waist       = "Velocious Belt",
        left_ear    = "Diabolos's Earring",
        right_ear   = "Pixie Earring",
        left_ring   = "Toreador's Ring",
        right_ring  = "Rajas Ring",
        back        = "Cuchulain's Mantle"}
	
	
 end
 
 --[[ ******************************************************
  Equip functions - put on the sets we defined above, and
 echo a note to our chat log so we know it worked.
****************************************************** --]]
 
 -- equip our idle set for standing around
 function equip_idle()
    if world.time >= (360) and world.time <= (1080) and player.hpp >= 85 and player.mpp <= 99 then
	    equip(set_combine(sets.idle,{waist="Lycopodium Sash",neck="Parade Gorget"}))
		windower.add_to_chat(8,'[Idle Day Regen with Parade Gorget]')
	elseif world.time >= (360) and world.time <= (1080) then
		equip(set_combine(sets.idle,{waist="Lycopodium Sash"}))
	    windower.add_to_chat(8,'[Idle Day Regen]')
    elseif player.hpp <=50 then
	   equip(sets.idle,{right_ring="Hercules' Ring"})
	   windower.add_to_chat(8,'[Hercules Ring On]')
	elseif player.hpp >= 85 and player.mpp <= 99 then
        equip(sets.idle,{neck="Parade Gorget"})
		windower.add_to_chat(8,'[Idle Parade Gorget]')
	else
	   equip(sets.idle)
	   windower.add_to_chat(8,'[Idle]')
	end
end

-- equip our engaged set. If the parade gorget latent is
-- procced and we need mp, throw that on as well.
 function equip_Attackmode()
	if player.hpp >= 85 and player.mpp <= 99 then
        equip(sets.att[mode],sets.parade)			 
	else
		equip(sets.att[mode])
	end
end
 -- equip this set to fight Fafnir, Nidhogg and HNM with Breath Damage
  function equip_breath(spell)
    if player.hpp >= 85 and player.mpp <= 99 and world.day_element == 'Dark' then
	    equip(sets.breath,{neck="Parade Gorget",right_ring="Shadow Ring"})
	    windower.add_to_chat(8,'[Breath Set with Parade Gorget and Shadow Ring]')
    elseif player.hpp >= 85 and player.mpp <= 99 then
        equip(set_combine(sets.breath,sets.parade))
		windower.add_to_chat(8,'[Breath Set with Parade Gorget]')
	elseif world.day_element == 'Dark' then
			windower.add_to_chat(8,'[Breath Set with Shadow Ring]')
			equip(sets.breath,{right_ring="Shadow Ring"}) 
	else
	windower.add_to_chat(8,'[Breath Set]')
    equip(sets.breath)
	end
end

 
 -- equip our WS set
 function equip_ws(spell)
    if spell.name == 'Knights of Round' then
        equip(sets.kor)
		windower.add_to_chat(8,'[Knights of Round]')
	elseif spell.name == 'Atonement' then
	    equip(sets.enmity)
		windower.add_to_chat(8,'[Atonement with Enmity]')
    else
         equip(sets.str)
		windower.add_to_chat(8,'[Multi WS Set]')
    end
 end
 
 -- equip our hMP set
 function equip_rest()
    if player.hpp >= 85 and player.mpp <= 99 then
	equip(sets.rest,{neck="Parade Gorget"})
	windower.add_to_chat(8,'[Resting with Parade Gorget]')
	else
    windower.add_to_chat(8,'[Resting]')
    equip(sets.rest)
	end
end

-- equip this to cast Flash and Divine Magic
 function equip_divine()
    equip(sets.divine)
end

 function equip_healing(spell)
    if player.hpp < 26 and player.tp <= 1000 then
	equip(sets.healing,{left_ear="Guardian Earring"})
	-- Matching day
	elseif spell.element == world.day_element and spell.element == world.weather_element then
			addedmagicinfo = "on matching day and weather"
			equip(sets.obi) 
	-- Matching day and weather
	elseif spell.element == world.day_element then
			addedmagicinfo = "on matching day"
			equip(sets.obi)
	-- Matching weather
	elseif spell.element == world.weather_element then
			addedmagicinfo = "on matching weather"
			 equip(sets.obi)
	else
    equip(sets.healing)
	end
end

 function equip_magicdef(spell)
	if player.hpp >= 85 and player.mpp <= 99 and world.day_element == 'Dark' then
	    equip(sets.magicdef,{neck="Parade Gorget",right_ring="Shadow Ring"})
	    windower.add_to_chat(8,'[Magic Defense Set with Parade Gorget and Shadow Ring]')
	elseif world.day_element == 'Dark' then
			windower.add_to_chat(8,'[Magic Defense Set with Shadow Ring]')
			equip(sets.magicdef,{right_ring="Shadow Ring"})
	elseif player.hpp >= 85 and player.mpp <= 99 then
        equip(set_combine(sets.magicdef,sets.parade))
		windower.add_to_chat(8,'[Magic Defense Set with Parade Gorget]')		
	else
	windower.add_to_chat(8,'[Magic Defense Set]')
    equip(sets.magicdef)
	end
end

function equip_enhancing(spell) 
    --Reprisal
	if spell.name == 'Reprisal' then
		equip(sets.reprisal)
	end
end

 function equip_steps(spell)
	-- Darksday
	if world.day_element == 'Dark' then
			windower.add_to_chat(8,'[Set Steps on Darksday]')
			equip(sets.steps,{left_ear="Assault Earring"}) 
	else
	windower.add_to_chat(8,'[Set Steps]')
    equip(sets.steps)
	end
end

 function equip_cover()
    equip(sets.cover)
end

-- Main function that decides whether to equip engaged/idle/resting gear
function choose_set()
    if player.status == "Engaged" then
        equip_Attackmode()
    else
         equip_idle()
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
 
 --[[ ******************************************************
  Casting functions - these functions run automatically when
 we cast a spell, use a job ability, rest for MP, and so on
****************************************************** --]]
 
 -- the precast function runs automatically BEFORE we
 -- begin casting a spell or job ability.
 function precast(spell)
     if spell.type == 'WeaponSkill' then
        equip_ws(spell)
	elseif spell.name == 'Shield Bash' and player.hpp <=(75) and player.tp <=(1000) then
	    windower.add_to_chat(8,'[Shield Bash with Guardian Earring]')
		equip(set_combine(sets.enmity,sets.bash,{right_ring="Guardian's Ring"}))
    elseif spell.name == 'Shield Bash' then
        windower.add_to_chat(8,'[Shield Bash]')
        equip(set_combine(sets.enmity,sets.bash))
    elseif spell.name == 'Sentinel' then
        windower.add_to_chat(8,'[Sentinel]')
        equip(set_combine(sets.enmity,sets.sentinel))
    elseif spell.name == 'Rampart' then
        windower.add_to_chat(8,'[Rampart]')
        equip(set_combine(sets.enmity,sets.rampart))
	elseif spell.name == 'Chivalry' then equip(sets.chivalry)
	elseif spell.name == 'Holy Circle' then equip(set_combine(sets.enmity,sets.holycircle))
	elseif spell.name == 'Provoke' or spell.name == 'Fealty' then equip(sets.enmity)
	elseif spell.type:contains('Step') then equip(sets.steps)	
    else
        equip(sets.fc)
    end
 end
 
 -- most of our abilities are either insta-cast or require
 -- gearswaps at the start, so we don't do much mid-cast.
 function midcast(spell)
     if spell.name == 'Flash' then
        windower.add_to_chat(8,'[Flash]')
        equip(set_combine(sets.enmity,sets.divine))
    elseif spell.name == 'Utsusemi: Ni' or spell.name == 'Utsusemi: Ichi' then
        windower.add_to_chat(8,'[Utsu]')
        equip(set_combine(sets.haste,sets.utsu))
	elseif spell.skill == 'Healing Magic' then
	    equip_healing(spell)
	elseif spell.skill == 'Enhancing Magic' then
        equip_enhancing(spell)
	elseif spell.action_type == 'Magic' and player.hpp < 26 then
		equip(sets.interrupt)
		windower.add_to_chat(122,'Extra interrupt earring.')
    else
         equip(sets.fc)
    end
 end
 
 -- when we're done with our spell or ability, return to either
 -- our idle or engaged gear.
 function aftercast(spell)
     	if player.status == 'Engaged' then
		equip_Attackmode(mode)
	else
		equip_idle()
	end
end
 
  -- this posts into chatlog what buffs are added to and removed 
 -- from you
 
function buff_change(name,gain)
	if gain == true then
		windower.add_to_chat(130, '['.. name ..' Applied!]')
	elseif gain == false then
		windower.add_to_chat(130, '['.. name ..' Lost!]')
	end
end
 
 --[[ ******************************************************
  Code that runs once, when we first swap to our PLD job
****************************************************** --]]



    -- Ingame commands like: counter, haste, tp, evasion

function self_command(command)
	if command == 'damage'
	or command == 'engaged'
	or command == 'breath' 
	or command == 'magicdef'
    then
		mode = command
		if player.status == "Engaged" then
		equip_Attackmode(mode) -- if engaged, switch immediately
		end
		windower.add_to_chat(80,'Engaged mode: ' .. mode)
	end
	-- Chivalry check
	if command == 'chivalry_check' then
		local chivmp
		chivmp = math.floor(player.tp*0.05+player.tp*0.0015*128) -- 128 MND
		windower.add_to_chat(122,'Chivalry MP: ' .. chivmp .. ' / Player is short ' .. player.max_mp-player.mp .. ' MP.')
	end
end
		
		
	mode= "engaged"
		
 -- Puts on our fashion set, lockstyle it, then switch
 -- to our idle set.
 send_command('wait 1;gs equip fashion;wait 2;input /lockstyle on;wait 1;gs equip idle;wait 2; input !myth')
 
 -------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function update_defense_mode() 
    if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
        if player.equipment.sub and not player.equipment.sub:contains('Shield') and
           player.equipment.sub ~= 'Aegis' then
            state.CombatForm:set('DW')
        else
            state.CombatForm:reset()
        end
    end
end

--[[ *************************************************************
 Wren's RDM gearswap .lua for SuperNova FFXI
 Save as windower/addons/GearSwap/data/RDM.lua
 
  2016-07-28 OC  - First version. Commented to help newbies. :)
  2016-08-01 OC  - Hachirin-no-Obi
 2016-08-06 OC  - Melee (RDM/nin), Shadow Mantle
 2016-08-25 OC  - Sea Capes, added Dark Magic gearset
 2016-10-09 OC  - Hachirin-no-Obi is now situational
 2016-12-02 OC  - Loquac. Earring, Stone Gorget
************************************************************* --]]
 
 --[[ ******************************************************
  Gearsets - define the various sets of gear we'll wear.
****************************************************** --]]
 
 function get_sets()
 
     -- idle set is worn when we're standing around doing
    -- nothing.  auto-refresh, movement, MP, -PDT
    -- for RDM this doubles as my fashion set!
    sets.idle = {
        main        = "Terra's Staff",
        sub         = "Vivid Strap +1",
        ammo        = "Hedgehog Bomb",
        head        = "Dls. Chapeau +1",
        neck        = "Orochi Nodowa +1",
        left_ear    = "Loquac. Earring",
        right_ear   = "Celestial Earring",
        body        = "Dalmatica +1",
        hands       = "Duelist's Gloves +1",
        left_ring   = "Succor Ring",
        right_ring  = "Shadow Ring",
        back        = "Umbra Cape",
        waist       = "Pythia Sash +1",
        legs        = "Blood Cuisses",
        feet        = "Dls. Boots +1"
    }
 
     -- fast cast set is for casting quickly.  We put
    -- this on before the spell is begun, then switch
    -- to one of the other sets during cast.
    sets.fc = {
        sub         = "Vivid Strap +1",
        head        = "Warlock's Chapeau",
        body        = "Dls. Tabard +1",
        left_ear    = "Loquac. Earring",
	}
 
     -- nuke set is for high damage nukes. +MAB and Int.
    -- Note that we only need to specify gear that
    -- differs from our idle set.
    sets.nuke = {
        main        = "Chatoyant Staff",
        sub         = "Wise Strap",
        ammo        = "Phtm. Tathlum",
        head        = "Wlk. Chapeau",
        neck        = "Elemental Torque",
        left_ear    = "Crapaud Earring",
        right_ear   = "Moldavite Earring",
        body        = "Mahatma Hpl.",
        hands       = "Zenith Mitts +1",
        left_ring   = "Omn. Ring +1",
		right_ring  = "Omn. Ring +1",
        back        = "Hecate's Cape",
        waist       = "Witch Sash",
        legs        = "Dls. Tights +1",
        feet        = "Dls. Boots +1"
    }
 
     -- enfeebling set is for sleep, blind, and others.
    -- mostly +Enfeebling Skill and MACC
    sets.enfeebling = {
        main        = "Chatoyant Staff",
        sub         = "Vivid Strap +1",
        ammo        = "Phtm. Tathlum",
        head        = "Dls. Chapeau +1",
        neck        = "Enfeebling Torque",
        right_ear   = "Enfeebling Earring",
        body        = "Warlock's Tabard",
        hands       = "Goliard Cuffs",
        right_ring  = "Omn. Ring +1",
		left_ring   = "Omn. Ring +1",
        back        = "Altruistic Cape",
        waist       = "Witch Sash",
        legs 		= "Mahatma Slops",
		--legs        = "Nashira Seraweels",
        feet        = "Avocat Pigaches"
    }
 
     -- enhancing set is mostly for stoneskin.
    -- mostly +Enhancing Skill and Mind.
    sets.enhancing = {
        main        = "Terra's Staff",
        sub         = "Vivid Strap +1",
        head        = "Goliard Chapeau",
        neck        = "Enhancing Torque",
        right_ear   = "Augment. Earring",
        body        = "Mahatma Hpl.",
        hands       = "Dls. Gloves +1",
        back        = "Merciful Cape",
        legs        = "Warlock's Tights",
        feet        = "Mahatma Pigaches"        
    }
 
     -- heal set for getting the most of our cures.
    -- mostly +Cure Potency and Mind.
    sets.heal = {
        main        = "Chatoyant Staff",
        sub         = "Reign Grip",
        head        = "Goliard Chapeau",
        neck        = "Healing Torque",
        body        = "Dls. Tabard +1",
        hands       = "Wise Gloves +1",
        left_ring   = "Celestial Ring",
		right_ring  = "Celestial Ring",
        back        = "Dew silk cape +1",
        waist       = "Pythia Sash +1",
        legs        = "Warlock's Tights",
        feet        = "Mahatma Pigaches",
		right_ear	= "Roundel Earring",
		right_ring  = "Celestial Ring"
    }
 
     -- dark set is for drain, aspir, and other dark magic
    -- mostly +Dark Skill, MACC, and Int.
    sets.dark = {
        sub         = "Dark Grip",
        head        = "Ree's Headgear",
        neck        = "Dark Torque",
        right_ear   = "Dark Earring",
        hands       = "Blood Fng. Gnt.",
        back        = "Merciful Cape",
        waist       = "Witch Sash",
        legs        = "Nashira Seraweels",
        feet        = "Goliard Clogs"
    }
 
     -- resting set is for recovering MP while /heal.
    -- as much +hMP as possible.
    sets.rest = {
        main        = "Imperial Wand",
        sub         = "Legion Scutum",
        head        = "Mirror Tiara",
        neck        = "Beak Necklace +1",
        left_ear    = "Antivenom Earring",
        right_ear   = "Relaxing Earring",
        body        = "Mahatma Hpl.",
        hands       = "Genie Gages",
        left_ring   = "Celestial Ring",
		back        = "Invigorating Cape",
		right_ring  = "Celestial Ring",
        waist       = "Duelist's Belt",
        legs        = "Hydra Brais",
        feet        = "Goliard Clogs"
    }
 
     -- our convert set swaps a lot of HP for MP, to
    -- get our max HP and MP as close as possible, so
    -- we get the most MP out of convert.
    sets.convert = {
        ammo        = "Hedgehog Bomb",
        head        = "Zenith Crown +1",
        body        = "Dalmatica +1",
        hands       = "Zenith Mitts +1",
        left_ring   = "Celestial Ring",
        right_ring  = "Celestial Ring",
        legs        = "Mahatma Slops",
        feet        = "Zenith Pumps +1"
    }
     
     -- weapons for RDM/NIN melee stance
    sets.melee = {
        main        = "Excalibur",
        sub         = "Mandau"
    }
     
     -- gear for melee as RDM/nin.
    -- haste, accuracy, attack
    sets.engaged = {

		head 		= "Walahra Turban",
        neck        = "Fortitude Torque",
        right_ear   = "Brutal Earring",
		left_ear 	= "suppanomimi",
		body		= "Goliard Saio",
        hands       = "Dusk Gloves +1",
        left_ring   = "Rajas Ring",
        right_ring  = "Toreador's Ring",
        back        = "Cerberus Mantle +1",
        waist       = "Velocious Belt",
        legs        = "Goliard Trews",
        feet        = "Dusk ledelsens +1",
		ammo        = "White Tathlum"
    }
     
     sets.ws = {
        head        = "Optical Hat",
        neck        = "Fotia Gorget",
        left_ear    = "Harmonius Earring",
		right_ear   = "Brutal Earring",
        body        = "Antares Harness",
		hands       = "Alkyoneus's's Brc.",
		left_ring   = "Strigoi Ring",
		right_ring  = "Toreador's Ring",
		legs        = "Oily Trousers",
		feet        = "Goliard Clogs",
        waist       = "Warwolf Belt",
		back        = "Cuchulain's Mantle"
    }
     
 end
 
 --[[ ******************************************************
  Equip functions - put on the sets we defined above, and
 echo a note to our chat log so we know it worked.
****************************************************** --]]
 
 -- all of our equip set macros for RDM must consider whether
 -- we have just converted.  we want to keep on our HP-to-MP
 -- gear until we use the extra MP.  Otherwise it's wasted!
 -- this equips our idle set.
 function equip_idle()
     if melee then
        windower.add_to_chat(8,'[Idle - Melee]')
        equip(sets.idle,sets.melee)
    elseif converted then
        windower.add_to_chat(8,'[Idle - Convert]')
        equip(sets.idle,sets.convert)
    else
         windower.add_to_chat(8,'[Idle]')
        equip(sets.idle)
    end
 end
 
 -- equip our hMP set for /heal
 function equip_rest()
     windower.add_to_chat(8,'[Resting]')
    equip(sets.rest)
end

-- equip our fast cast set
function equip_fc()
    if converted then
        equip(sets.fc,sets.convert)
    else
         equip(sets.fc)
    end
 end
 
 -- equip our enhancing set
 function equip_enhancing(spell)
     if converted then
        windower.add_to_chat(8,'[Enhancing - Convert]')
        equip(sets.enhancing,sets.convert)
    else
         windower.add_to_chat(8,'[Enhancing]')
        if spell.name == 'Shock Spikes' then
            equip(sets.enhancing,{legs="Dls. Tights +1"})
        else
             equip(sets.enhancing)
        end
     end
 end
 
 -- equip our enfeebling set
 function equip_enfeebling()
     if converted then
        windower.add_to_chat(8,'[Enfeebling - Convert]')
        equip(sets.enfeebling,sets.convert)
    else
         windower.add_to_chat(8,'[Enfeebling]')
        equip(sets.enfeebling)
    end
 end
 
 -- equip our nuke set. if weather or day matches
 -- the spell element, put on hachirin-no-obi
 function equip_nuke(spell)
     if spell.element == world.day_element then
        windower.add_to_chat(8,'[Nuke - on matching day]')
        equip(sets.nuke,{waist="Hachirin-no-Obi"})
    elseif spell.element == world.weather_element then
        windower.add_to_chat(8,'[Nuke - with matching weather]')
        equip(sets.nuke,{waist="Hachirin-no-Obi"})
    else
         windower.add_to_chat(8,'[Nuke]')
        equip(sets.nuke)
    end
 end
 
 -- equip our healing magic set
 function equip_heal()
     if converted then
        windower.add_to_chat(8,'[Healing - Convert]')
        equip(sets.heal,sets.convert)
    else
         windower.add_to_chat(8,'[Healing]')
        equip(sets.heal)
    end
 end
 
 -- equip our Dark Magic set
 function equip_dark()
     windower.add_to_chat(8,'[Dark]')
    equip(sets.dark)
end

-- equip our engaged set
function equip_engaged()
    windower.add_to_chat(8,'[Engaged]')
    equip(sets.engaged)
end

-- equip our ws set
function equip_ws()
    windower.add_to_chat(8,'[WS]')
    equip(sets.ws)
end

-- a catchall equip function that puts on the correct set
-- whether we are engaged or idle, in melee mode or not
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
 -- begin casting a spell or job ability.  For our RDM,
 -- we use this function primarily to set some status
 -- variables to indicate we've entered "converted" mode,
 -- which will last until we spend the extra MP.
 -- also throws on our fast cast gear for spells.
 function precast(spell)
     if converted and player.mp < 804 then
        converting = false
        converted = false
    end
     if spell.name == 'Convert' then
        if not converting then
            converting = true
            windower.add_to_chat(8,'[Convert]')
            cancel_spell()
            equip(sets.convert)
            send_command('wait .5;input /ja Convert <me>')
        else
             converting = false
            converted = true
        end
     elseif (spell.type:contains('Magic') or spell.type:contains('Ninjutsu')) then
        equip_fc()
    elseif spell.type == 'WeaponSkill' then
        equip_ws()
    end
 end
 
 -- midcast, we put on our potency gear depending on
 -- the type of spell being cast.
 function midcast(spell)
     if spell.skill == 'Healing Magic' then
        equip_heal()
    elseif spell.skill == 'Enfeebling Magic' then
        equip_enfeebling()
    elseif spell.skill == 'Enhancing Magic' then
        equip_enhancing(spell)
    elseif spell.skill == 'Elemental Magic' then
        equip_nuke(spell)
    elseif spell.skill == 'Dark Magic' then
        equip_dark()
    end
	
	if spell.name == "Utsusemi: Ichi" then send_command('input ; wait 1;input //cancel copy image*')end
	if spell.name == "Blink" then send_command('wait 3;cancel blink;input //cancel copy image*') end
	if spell.name == "Sneak" or spell.name == "Spectral Jig" then send_command("cancel sneak") end
	if spell.name == "Stoneskin" then send_command("wait 2;cancel Stoneskin") end		
	
	
 end
 
 -- after we finish our spell or ability, return to our
 -- idle set.
 function aftercast(spell)
     if not converting then
        choose_set()
    end
 end
 
 -- as usual, we use the status_change function to swap in
 -- hMP gear when we rest, and remove it when we stand,
 -- engaged set when engaged, and idle when not.
 function status_change(new,old)
     if new == 'Resting' then
        equip_rest()
    else
         choose_set()
    end
 end
 
 -- the self_command function can be called from
 -- a Yush or in-game macro.  I call this function
 -- from a keybind in my Yush file, to swap into
 -- melee stance.  While in this stance we lock our
 -- weapons so that gearswaps won't cause us to lose
 -- any TP we might have.
 function self_command(m)
     if m == "M" then
        if melee == false then
            melee = true
            choose_set()
            disable('main')
            disable('sub')
			windower.add_to_chat(8,'[Melee Mode]')
        else
             melee = false
            enable('main')
            enable('sub')
            choose_set()
        end
     end
 end
 
 --[[ ******************************************************
  Code that runs once, when we first swap to our RDM job
****************************************************** --]]
 
 -- these variables indicate whether we're in the middle of
 -- converting, or have already converted and need to stay in
 -- our HP to MP gear until we exhaust our extra MP.
 converting = false
 converted = false
 melee = false
 
 -- equip and lockstyle our idle set
 send_command('wait 1;gs equip idle;wait 1;input /lockstyle on')
 send_command('input /macro book 3; wait 0.1; input /macro set 1')

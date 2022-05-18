--[[ *************************************************************
 Kurosaki's RDM gearswap .lua for SuperNova FFXI
 Save as windower/addons/GearSwap/data/RDM.lua
 
 2021-07-28   - First version. Commented to help newbies. :)
 2021-08-01   - Hachirin-no-Obi
 2021-08-06   - Melee (RDM/nin), Shadow Mantle
 2021-08-25   - Sea Capes, added Dark Magic gearset
 2021-10-09   - Hachirin-no-Obi is now situational
 2021-11-02   - Loquac. Earring, Stone Gorget
 2021-11-27   - Added potency sets for enfeebling spells;New midcast and aftercast sections
************************************************************* --]]
 
 --[[ ******************************************************
  Gearsets - define the various sets of gear we'll wear.
****************************************************** --]]
 
 function get_sets()
 
    --fashion set to look good at all times
	sets.fashion = {
	    main        = "Chatoyant Staff",
		sub         = "Staff Strap",
		ammo        = "Hedgehog Bomb",
		head        = "Dls. Chapeau +1",
		body        = "Dalmatica +1",
		hands       = "Duelist's Gloves +1",
		legs        = "Blood Cuisses",
		feet        = "Blood Greaves"
	}
 
     -- idle set is worn when we're standing around doing
    -- nothing.  auto-refresh, movement, MP, -PDT
    sets.idle = {
        main        = "Terra's Staff", 
        sub         = "Bugard Strap +1", 
        ammo        = "Hedgehog Bomb",
        neck        = "Orochi Nodowa",
        left_ear    = "Merman's Earrings", 
        right_ear   = "Celestial Earring",
        body        = "Ixion Cloak", 
        hands       = "Duelist's Gloves", 
        left_ring   = "Krousis Ring +1",
        right_ring  = "Krousis Ring +1",
        back        = "Umbra Cape", 
        waist       = "Resolute Belt", 
        legs        = "Darksteel Subligar +1",
        feet        = "Coral Greaves +1" 
    }
 
     -- fast cast set is for casting quickly.  We put joe
    -- this on before the spell is begun, kthen switch
    -- to one of the other sets during cast.
    sets.fc = {
        sub         = "Vivid Strap",
        head        = "Warlock's Chapeau",
        right_ear   = "Loquac. Earring",
        body        = "Duelist's Tabard +1"
    }
	
	--this set is for spell recast timers; mostly haste+
	sets.recast = {
	head        = "Walahra Turban",
        neck        = "Fortified Chain",
        left_ear    = "Triton Earring", 
        right_ear   = "Loquacious Earring",
        body        = "Antares Harness", 
        hands       = "Dusk Gloves",
        left_ring   = "Wivre Ring +1", 
        right_ring  = "Wivre Ring +1", 
        back        = "Umbra Cape", 
        waist       = "Sonic Belt +1", 
        legs        = "Warlock's Tights",
        feet        = "Dusk Ledelsens +1" 
    }
 
     -- nuke set is for high damage nukes. +MAB and Int.
    -- Note that we only need to specify gear that
    -- differs from our idle set.
    sets.nuke = {
        main        = "Chatoyant Staff", 
        sub         = "Wise Strap", 
        ammo        = "Phtm. Tathlum", 
        head        = "Warlock's Chapeau", 
        neck        = "Lmg. Medallion", 
        left_ear    = "Helenus's Earring", 
        right_ear   = "Cass. Earring", 
        body        = "Mahatma Hpl.", 
        hands       = "Zenith Mitts +1", 
        left_ring   = "Omn. Ring +1", 
        right_ring  = "Omn. Ring +1", 
        back        = "Caloyer Cape", 
        waist       = "Witch Sash", 
        legs        = "Mahatma Slops", 
        feet        = "Duelist's Boots" 
    }
 
    sets.enfeebling = {}
	sets.enfeebling.int = { -- Skill (macc) > INT (potency)
	    main		= "Chatoyant Staff",
		sub	        = "Bugard Strap +1", 
		ammo		= "Phantom Tathlum", 
		head		= "Elite Beret +1", 
		body		= "Warlock's Tabard", 
		hands		= "Mahatma Cuffs", 
		legs		= "Mahatma Slops",
		feet		= "Wise Pigaches +1", 
		neck		= "Spider Torque", 
		waist		= "Witch Sash", 
		left_ear	= "Incubus Earring", 
		right_ear	= "Incubus Earring", 
		left_ring	= "Omn. Ring +1",
		right_ring	= "Omn. Ring +1", 
		back		= "Gramary Cape", 
	}
	sets.enfeebling.intpotency = { -- INT (potency) > Skill (macc)
	        main		= "Chatoyant Staff", 
		sub             = "Bugard Strap +1", 
                ammo		= "Phtm. Tathlum", 
		head		= "Elite Beret +1",
		body		= "Mahatma Hpl.", 
		hands		= "Mahatma Cuffs",
		legs		= "Mahatma Slops", 
		feet		= "Wise Pigaches +1",
		neck		= "Lmg. Medallion +1", 
		waist		= "Witch Sash", 
		left_ear	= "Omn. Earring", 
		right_ear	= "Omn. Earring", 
		left_ring	= "Omn. Ring +1", 
		right_ring	= "Omn. Ring +1", 
		back		= "Prism Cape",
	}
	sets.enfeebling.mnd = { -- Skill (macc) > MND (potency)
	        main		= "Chatoyant Staff", 
		sub		= "Bugard Strag +1", 
		ammo            = "Hedgehog Bomb", 
		head		= "Elite Beret +1", 
		body		= "Warlock's Tabard", 
		hands		= "Dvt. Mitts +1", 
		legs		= "Mahatma Slops", 
		feet		= "Errant Pigaches", 
		neck		= "Enfeebling Torque", 
		waist		= "Witch Sash", 
		left_ear	= "Incubus Earring +1",
		right_ear	= "Incubus Earring +1",
		left_ring	= "Cmn. Ring +1", 
		right_ring	= "Cmn. Ring +1", 
		back		= "Dew Silk Cape", 
	}
	sets.enfeebling.mndpotency = { -- MND (potency) > Skill (macc)
	        main		= "Chatoyant Staff",
		sub		= "Bugard Strap +1",
		ammo		= "Phtm. Tathlum", 
		head		= "Elite Beret +1",
		body		= "Mahatma Hpl.",
		hands		= "Dvt. Mitts +1",
		legs		= "Mahatma Slops", 
		feet		= "Errant Pigaches", 
		neck		= "Enlightened Chain", 
		waist		= "Witch Sash", 
		left_ear	= "Cmn. Earring +1", 
		right_ear	= "Cmn. Earring +1", 
		left_ring	= "Celestial Ring", 
		right_ring	= "Celestial Ring", 
		back		= "Dew Silk Cape", 
	}
 
     -- enhancing set is mostly for stoneskin.
    -- mostly +Enhancing Skill and Mind.
    sets.enhancing = {
        main        = "Chatoyant Staff",
        sub         = "Bugard Strap +1",
        head        = "Mahatma Hat", 
        neck        = "Enhancing Torque", 
        right_ear   = "Augment. Earring", 
	left_ear    = "Celestial Earring +1", 
        body        = "Mahatma Hpl.",
        hands       = "Dvt. Mitts +1", 
	right_ring  = "Celestial Ring", 
	left_ring   = "Celestial Ring", 
        back        = "Dew Silk Cape", 
	waist       = "Pythia Sash", 
        legs        = "Warlock's Tights", 
        feet        = "Errant Pigaches" 
    }
 
     -- heal set for getting the most of our cures.
    -- mostly +Cure Potency and Mind.
    sets.heal = {
        main        = "Chatoyant Staff", 
        sub         = "Bugard Strap +1",
        head        = "Mahatma Hat",
        neck        = "Fylgja Torque", 
	left_ear    = "Celestial Earring +1",
	right_ear   = "Celestial Earring +1",
        body        = "Mahatma Hpl.", 
        hands       = "Dvt. Mitts +1", 
        left_ring   = "Celestial Ring", 
        right_ring  = "Celestial Ring", 
        back        = "Dew Silk Cape", 
        waist       = "Pythia Sash", 
        legs        = "Warlock's Tights", 
        feet        = "Errant Pigaches" 
    } 
 
     -- dark set is for drain, aspir, and other dark magic
    -- mostly +Dark Skill, MACC, and Int.
    sets.dark = {
        sub         = "Dark Grip",
        head        = "Ree's Headgear",
        neck        = "Dark Torque",
        right_ear   = "Dark Earring",
	left_ear    = "Incubus Earring +1",
	body        = "Nashira Manteel",
        hands       = "Blood Fng. Gnt.",
	right_ring  = "Omniscient Ring +1",
	left_ring   = "Omniscient Ring +1",
        back        = "Merciful Cape",
        waist       = "Witch Sash",
        legs        = "Mahatma Slops",
        feet        = "Goliard Clogs"
    }
 
     -- resting set is for recovering MP while /heal.
    -- as much +hMP as possible.
    sets.rest = {
        main        = "Chatoyant Staff",
        head        = "Cobra Hat", 
        neck        = "Beak Necklace +1", 
        left_ear    = "",
        right_ear   = "",
        body        = "Mahatma Hpl.", 
        hands       = "",
        left_ring   = "Celestial Ring", 
        right_ring  = "Celestial Ring", 
        back        = "",
        waist       = "Qiqirn Sash +1", 
        legs        = "Baron's Slops", 
        feet        = "Arborist Nails"
    }
 
     -- our convert set swaps a lot of HP for MP, to
    -- get our max HP and MP as close as possible, so
    -- we get the most MP out of convert.
    sets.convert = {
        sub         = "Bugard Strap +1",
        ammo        = "Hedgehog Bomb", 
        head        = "Zenith Crown",
        left_ear    = "Hades Earring", 
        right_ear   = "Hades Earring", 
        body        = "Blue Cotehard. +1", 
        hands       = "Zenith Mitts +1", 
        left_ring   = "Celestial Ring",
        right_ring  = "Celestial Ring", 
        back        = "Dew Silk Cape", 
        waist       = "Hierarch Belt", 
        legs        = "Duelist's Tights", 
        feet        = "Errant Pigaches" 
    }
     
     -- weapons for RDM/NIN melee stance
    sets.meleedw = {
        main        = "Anelace +1",
        sub         = "Anelace +1"
    }
	
	sets.meleeshield = {
	    main        = "Anelace +1",
	    sub         = "Ice Shield +1",
	}	
     
     -- gear for melee as RDM/nin.
    -- haste, accuracy, attack
    sets.engaged = {
        head        = "Walahra Turban", 
	neck        = "Ancient Torque", 
        right_ear   = "Accurate Earring", 
	--right_ear   = "Novia Earring",	
	left_ear    = "Accurate Earring", 
	body        = "Antares Harness", 
        hands       = "Dusk Gloves", 
        left_ring   = "",
        right_ring  = "",
        back        = "Cuchulain's Mantle",
        waist       = "Sonic Belt +1",
        legs        = "Prince's Slope",
        feet        = "Dusk Ledelsens +1" 
    }
     --gear for weapon skill
     sets.ws = {
        head        = "Ogre Mask +1",
        neck        = "Ancient Torque",
	left_ear    = "Harmonius Earring",
        right_ear   = "Harmonius Earring",
        body        = "Anatares Harness",
	hands       = "Tarasque Mitts +1",
	left_ring   = "Rajas Ring", 
	right_ring  = "Harmonius Ring", 
	back        = "Cuchulain's Mantle",
	waist       = "Ocean Sash",
	legs        = "Dusk Trousers +1", 
	feet        = "Ogre Ledelsens +1"
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
     if meleedw then
        windower.add_to_chat(8,'[Idle - Meleedw]')
        equip(sets.idle,sets.meleedw)
	elseif meleeshield then
        windower.add_to_chat(8,'[Idle - MeleeShield]')
        equip(sets.idle,sets.meleeshield)		
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
        if spell.name == 'Stoneskin' then
           equip(sets.enhancing,{neck="Stone Gorget",hands="Stone Mufflers"})
        elseif spell.name:contains('Utsusemi')
	    or spell.name == 'Refresh'
		or spell.name == 'Haste'
		or spell.name == 'Blink'
		or spell.name == 'Flurry' then
		equip(sets.recast)
		else
             equip(sets.enhancing)
        end
     end
 end
 
 -- equip our enfeebling set
function equip_enfeebling(spell)

	-- INT-based enfeebles
    if spell.name:contains('Poison')
	or spell.name:contains('Dia')
	or spell.name:contains('Sleep')
	or spell.name:contains('Blind')
	or spell.name == 'Dispel' 
	or spell.name == 'Bind'
	or spell.name == 'Gravity' then
		equip(sets.enfeebling.int)
		
	-- MND-based enfeebles
	else
		equip(sets.enfeebling.mnd)
	end
	
		-- INT
	if spell.name:contains('Blind') then
			equip(sets.enfeebling.intpotency)
			
		-- MND
	elseif spell.name:contains('Slow')
	or spell.name:contains('Paralyze')
	or spell.name == 'Distract'
	or spell.name == 'Frazzle' then
		equip(sets.enfeebling.mndpotency)
	end
    
        --Dark
	if spell.name == 'Stun' 
	or spell.name:contains('Bio') then
		equip(sets.dark)
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
 
	mpcost = tostring(spell.mp_cost)
	addedmagicinfo = ""
	showmagicinfo = display_mp_cost
	magicinfocolor = 0
 
	if spell.skill == 'Healing Magic' then
        if not converting then equip_heal(spell) end
		magicinfocolor = 8
    elseif spell.skill == 'Enfeebling Magic' then
        equip_enfeebling(spell)
		magicinfocolor = 7
    elseif spell.skill == 'Enhancing Magic' then
        equip_enhancing(spell)
		magicinfocolor = 50
    elseif spell.skill == 'Elemental Magic' then
		equip_nuke(spell)
		magicinfocolor = 3
    elseif spell.skill == 'Dark Magic' then
        equip_dark(spell)
		magicinfocolor = 207
	elseif spell.skill == 'Divine Magic' then
		equip_divine(spell)
		showmagicinfo = false
    elseif spell.name:contains('Utsusemi')
	    or spell.name == 'Refresh'
		or spell.name == 'Haste'
		or spell.name == 'Blink'
		or spell.name == 'Flurry' then
		equip(sets.recast)
		showmagicinfo = false
	else
		showmagicinfo = true
	end
	
	if showmagicinfo then
	
		-- align text
		if string.len(mpcost) == 1 then
			mpcost = ' *** ' .. mpcost
		elseif string.len(mpcost) == 2 then
			mpcost = ' ** ' .. mpcost
		elseif string.len(mpcost) == 3 then
			mpcost = ' * ' .. mpcost
		end
		
		-- display text
		if addedmagicinfo == "" then
			windower.add_to_chat(magicinfocolor,mpcost .. " MP \t" .. spell.name)
		else
			windower.add_to_chat(magicinfocolor,mpcost .. " MP \t" .. spell.name .. ": " .. addedmagicinfo)
		end
	end
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
        if meleedw == false then
            meleedw = true
            choose_set()
            disable('main')
            disable('sub')
        else
             meleedw = false
            enable('main')
            enable('sub')
            choose_set()
        end
	elseif m == "S" then
        if meleeshield == false then
            meleeshield = true
            choose_set()
            disable('main')
            disable('sub')
        else
            meleeshield = false
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
 meleedw = false
 meleeshield = false
 display_mp_cost = true
 -- equip and lockstyle our idle set
 send_command('wait 1;/lockstyleset 003;wait 1;gs equip idle')
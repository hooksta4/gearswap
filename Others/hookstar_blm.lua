--[[ *************************************************************
 Wren's BLM gearswap .lua for SuperNova FFXI
 Save as windower/addons/GearSwap/data/BLM.lua
 
  2016-07-24 OC  - First version. Commented to help newbies. :)
  2016-08-01 OC  - Hachirin-no-Obi, Rostrum Pumps, Sync gearsets
 2016-08-06 OC  - Shadow Mantle, removed Umbra Cape and Jelly Ring
 2016-08-25 OC  - Sea Capes
 2016-08-05 OC  - Hachirin and Src. Pants are now situational
 2016-12-02 OC  - Loquacious Earring, Stone Gorget
************************************************************* --]]
 
 --[[ ******************************************************
  Gearsets - define the various sets of gear we'll wear.
****************************************************** --]]
 
 function get_sets()
 
     -- fashion set is for looking nice while lockstyled.
    -- make sure you include your top-row equipment,
    -- especially if you use a ranged or throwing weapon.
    -- I like the look of the Genie set.
    sets.fashion = {
        main        = "Claustrum",
        sub         = "Vivid Strap +1",
        ammo        = "Hedgehog Bomb",
        head        = "Maat's Cap",
        body        = "Dalmatica +1",
        hands       = "Zenith Mitts +1",
        legs        = "Oracle's Braconi",
        feet        = "Herald's Gaiters"
    }
 
     -- idle set is worn when we're standing around doing
    -- nothing.  we want auto-refresh, movement, MP, and
    -- minus physical damage taken.
    sets.idle = {
        main        = "Claustrum",
        sub         = "Vivid Strap +1",
        ammo        = "Hedgehog Bomb",
        head        = "Sorcerer's Petasos +1",
        neck        = "Lemegeton Medallion +1",
        left_ear    = "Loquacious Earring",
        right_ear   = "Antivenom Earring",
        body        = "Sorcerer's Coat +1",
        hands       = "Sorcerer's Gloves +1",
        left_ring   = "Omn. Ring +1",
        right_ring  = "Omn. Ring +1",
        back        = "Umbra Cape",
        waist       = "Witch Sash",
        legs        = "Valkyrie's Trews",
        feet        = "Herald's Gaiters"
    }
 
     -- fast cast set is for casting quickly.  We put
    -- this on before the spell is begun, then switch
    -- to one of the other sets during cast.
    sets.fc         = {
        sub         = "Vivid Strap +1",
        left_ear    = "Loquac. Earring",
        feet        = "Rostrum Pumps"
    }
 
     -- damage set is for powerful nukes. +MAB and Int.
    -- Note that we only need to specify gear that
    -- differs from our idle set.
    sets.damage = {
        sub         = "Wise Strap",
        head        = "Maat's Cap",
		ammo 		= "Phantom Tathlum",
        right_ear   = "Crapaud Earring",
		left_ear	= "Moldavite Earring",
        body        = "Genie Weskit",
        hands       = "Zenith Mitts +1",
        back        = "Ixion Cape",
        legs        = "Mahatma Slops",
        feet        = "Goliard Clogs",
		neck 		= "Lemegeton Medallion +1",
        left_ring   = "Omn. Ring +1",
        right_ring  = "Sorcerer's Ring",		
		
    }
 
     -- accuracy set is for enemies that resist our high
    -- damage nukes.  +Elemental Skill, MACC, and Int.
    sets.accuracy = {
        sub         = "Wise Strap",
        head        = "Src. Petasos +1",
        left_ear    = "Elemental Earring",
        body        = "Genie Weskit",
        hands       = "Wzd. Gloves +1",
        back        = "Hecate's Cape",
        legs        = "Mahatma Slops",
        feet        = "Nashira Crackows"
    }
 
     -- dark set is for drain, aspir, and other dark magic
    -- mostly +Dark Skill, MACC, and Int.
    sets.dark = {
        sub         = "Dark Grip",
        head        = "Nashira Turban",
        neck        = "Dark Torque",
        right_ear   = "Dark Earring",
        body        = "Mahatma Hpl.",
        back        = "Merciful Cape",
        legs        = "Mahatma Slops",
        feet        = "Genie Huaraches",
		hands		= "Sorcerer's Gloves +1"
    }
 
     -- enfeebling set is for sleep, blind, and others.
    -- mostly +Enfeebling Skill, MACC, and Int.
    sets.enfeebling = {
        sub         = "Reign Grip",
        head        = "Genie Tiara",
        neck        = "Enfeebling Torque",
        right_ear   = "Enfeebling Earring",
        body        = "Wzd. Coat +1",
        hands       = "Mahatma Cuffs",
        back        = "Altruistic Cape",
        legs        = "Genie Lappas",
        feet        = "Avocat Pigaches",		
		left_ear	= "Incubus Earring +1"
    }
     
     -- enhancing set is mostly for stoneskin.
    -- mostly +Enhancing Skill and Mind.
    sets.enhancing = {
        sub         = "Reign Grip",
        head        = "Zenith Crown +1",
        neck        = "Enhancing Torque",
        right_ear   = "Augment. Earring",
        body        = "Mahatma Hpl.",
        hands       = "Dvt. Mitts +1",
        left_ring   = "Celestial Ring",
        right_ring  = "Celestial Ring",
        back        = "Merciful Cape",
        waist       = "Pythia Sash +1",
        legs        = "Mahatma Slops",
        feet        = "Genie Huaraches",
		ammo		= "Phtm. Tathlum",
		neck		= "Stone Gorget"
    }
 
     -- heal set for getting the most of our cures.
    -- mostly +Cure Potency and Mind.
    sets.heal = {
        sub         = "Reign Grip",
        head        = "Nashira Turban",
        neck        = "Healing Torque",
        right_ear   = "Roundel Earring",
        body        = "Mahatma Hpl.",
        hands       = "Bricta's Cuffs",
        left_ring   = "Celestial Ring",
        right_ring  = "Celestial Ring",
        back        = "Altruistic Cape",
        waist       = "Pythia Sash +1",
        legs        = "Mahatma Slops",
        feet        = "Mahatma Pigaches"
    }
 
     -- yellow set is for getting our HP into yellow
    -- in order to proc the latent of Sorcerer's Ring.
    sets.yellow = {
        main        = "Claustrum",
        head        = "Zenith Crown +1",
        body        = "Dalmatica +1",
        hands       = "Zenith Mitts +1",
        right_ring  = "Serket Ring",
        legs        = "Zenith Slacks +1",
        feet        = "Zenith Pumps +1",
		waist 		= "Penitent's Rope"
    }
 
     -- resting set is for recovering MP while /heal.
    -- as much +hMP as possible.
    sets.rest = {
        head        = "Goliard Chapeau",
        neck        = "Beak Necklace +1",
        left_ear    = "Antivenom Earring",
        right_ear   = "Relaxing Earring",
        body        = "Mahatma Hpl.",
        hands       = "Oracle's Gloves",
        left_ring   = "Celestial Ring",
        right_ring  = "Celestial Ring",
        back        = "Invigorating Cape",
        waist       = "Hierarch Belt",
        legs        = "Oracle's Braconi",
        feet        = "Goliard Clogs"
    }
 
     -- all the following are my level-sync sets for
    -- easily equipping gear when going to level capped
    -- events.
     -- if I want level 32 gear, for example, I would type
    --     //gs equip l32
    -- that's a lowercase L, not a 1.
    -- then I would disable gearswap for the event
    --     //lua u gearswap
    -- and turn it back on when it's over.
    --     //lua r gearswap
    sets.l20 = {
        main        = "Yew Wand +1",
        sub         = "Yew Wand +1",
        ammo        = "Morion Tathlum",
        head        = "Baron's Chapeau",
        neck        = "Black Neckerchief",
        left_ear    = "Morion Earring +1",
        right_ear   = "Morion Earring +1",
        body        = "Baron's Saio",
        hands       = "Garrison Gloves",
        left_ring   = "Eremite's Ring +1",
        right_ring  = "Eremite's Ring +1",
        back        = "Black Cape +1",
        waist       = "Shaman's Belt",
        legs        = "Mage's Slacks",
        feet        = "Garrison Boots"
    }
     sets.l32 = {
        main        = "Solid Wand",
        sub         = "Solid Wand",
        ammo        = "Morion Tathlum",
        head        = "Seer's Crown +1",
        neck        = "Solon Torque",
        left_ear    = "Morion Earring +1",
        right_ear   = "Morion Earring +1",
        body        = "Baron's Saio",
        hands       = "Seer's Mitts +1",
        left_ring   = "Eremite's Ring +1",
        right_ring  = "Eremite's Ring +1",
        back        = "Black Cape +1",
        waist       = "Shaman's Belt",
        legs        = "Seer's Slacks +1",
        feet        = "Custom F Boots"
    }
     sets.l50 = {
        main        = "Rose Wand +1",
        sub         = "Rose Wand +1",
        ammo        = "Morion Tathlum",
        head        = "Seer's Crown +1",
        neck        = "Solon Torque",
        left_ear    = "Morion Earring +1",
        right_ear   = "Moldavite Earring",
        body        = "Tct.Mgc. Coat",
        hands       = "Sly Gauntlets",
        left_ring   = "Eremite's Ring +1",
        right_ring  = "Eremite's Ring +1",
        back        = "Black Cape +1",
        waist       = "Ocean Stone",
        legs        = "Magic Slacks",
        feet        = "Custom F Boots"
    }
     sets.l51 = {
        main        = "Chatoyant Staff",
        ammo        = "Morion Tathlum",
        head        = "Seer's Crown +1",
        neck        = "Solon Torque",
        left_ear    = "Morion Earring +1",
        right_ear   = "Moldavite Earring",
        body        = "Tct.Mgc. Coat",
        hands       = "Sly Gauntlets",
        left_ring   = "Eremite's Ring +1",
        right_ring  = "Eremite's Ring +1",
        back        = "Black Cape +1",
        waist       = "Ocean Stone",
        legs        = "Magic Slacks",
        feet        = "Custom F Boots"
    }
     
 end
 
 --[[ ******************************************************
  Equip functions - put on the sets we defined above, and
 echo a note to our chat log so we know it worked.
****************************************************** --]]
 
 -- equip our idle set
 function equip_idle()
     windower.add_to_chat(8,'[Idle]')
    equip(sets.idle)
end

-- equip our Nuke set, either high damage or accuracy
-- depending on our mode. We toggle the mode variable
-- using the self_command() function laster in this file.
-- if we're casting a spell that matches the day or weather
-- we also will put on the Hachirin-no-Obi.
function equip_nuke(spell)
    if spell.element == world.day_element then
        windower.add_to_chat(8,'[Nuke - ' .. mode .. ' on matching day]')
        equip(sets[mode],{waist="Hachirin-no-Obi",legs="Src. Tonban +1"})
    elseif spell.element == world.weather_element then
        windower.add_to_chat(8,'[Nuke - ' .. mode .. ' with matching weather]')
        equip(sets[mode],{waist="Hachirin-no-Obi"})
    else
         windower.add_to_chat(8,'[Nuke - ' .. mode .. ']')
        equip(sets[mode])
    end
 end
 
 -- equip our Dark Magic set
 function equip_dark()
     windower.add_to_chat(8,'[Dark]')
    equip(sets.dark)
end

-- equip our Enfeebling Magic set
function equip_enfeebling()
    windower.add_to_chat(8,'[Enfeebling]')
    equip(sets.enfeebling)
end

-- equip our Enhancing Magic set
function equip_enhancing(spell)
    windower.add_to_chat(8,'[Enhancing]')
    if spell.name == 'Stoneskin' then
        equip(sets.enhancing,{neck="Stone Gorget"})
    else
         equip(sets.enhancing)
    end
 end
 
 -- equip our Healing Magic set
 function equip_heal()
     windower.add_to_chat(8,'[Healing]')
    equip(sets.heal)
end

-- equip our yellow (low HP) set for a split second,
-- then return to our idle set.  This will force our
-- HP to yellow to proc the Sorcerer's Ring latent.
function equip_yellow()
    windower.add_to_chat(8,'[Yellow]')
    equip(sets.yellow)
    send_command('wait .1;gs equip idle')
end

-- equip our resting hMP set
function equip_rest()
    windower.add_to_chat(8,'[Resting]')
    equip(sets.rest)
end


--[[ ******************************************************
 Casting functions - these functions run automatically when
 we cast a spell, use a job ability, rest for MP, and so on
****************************************************** --]]
 
 -- the precast function runs automatically BEFORE we
 -- begin casting a spell or job ability.  For our BLM,
 -- we want to equip fast cast gear prior to casting.
 function precast(spell)
     if spell.type:contains('Magic') then
        equip(sets.fc)
    end
 end
 
 -- now that we've already gained the benefit of fast cast,
 -- the midcast function swaps in a new set of gear during
 -- the cast, which will make the spell effect more potent.
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
	
	
	if spell.name == "Utsusemi: Ichi" then send_command('input ; wait 3;input //cancel copy image*')end
	if spell.name == "Blink" then send_command('wait 3;cancel blink;input //cancel copy image*') end
	if spell.name == "Sneak" or spell.name == "Spectral Jig" then send_command("cancel sneak") end
	if spell.name == "Stoneskin" then send_command("wait 5;cancel Stoneskin") end		

 end
 
 -- we're done with our spell or job ability, so the aftercast
 -- function makes sure we return to our idle gear to benefit
 -- from auto-refresh and -PDT while we stand around.
 function aftercast(spell)
     equip_idle()
end

-- the status_change function runs automatically whenever we
-- engage, disengage, kneel, or stand.  As a BLM we use this
-- to equip our +hMP gear when we /heal, and return to our
-- idle gear when we stand up.
function status_change(new,old)
    if new == 'Resting' then
        equip_rest()
    else
         equip_idle()
    end
 end
 
 -- the self_command function can be called from
 -- a Yush or in-game macro.  We use it for two
 -- purposes.  One, to equip our low-HP gear in
 -- order to proc the Sorcerer's Ring.  Two, to
 -- toggle between damage and accuracy nuking.
 --
 -- with Yush, something like this:
 -- ['Alt+3'] = 'input //gs c Y'
 --
 -- with in-game macros, like this:
 --
 --
 function self_command(m)
     if m == "Y" then
        equip_yellow()
    elseif m == "M+" then
        if mode == "damage" then
            mode = "accuracy"
        else
             mode = "damage"
        end
         windower.add_to_chat(8,'[Magic mode: ' .. mode .. ']')
    end
 end
 
 --[[ ******************************************************
  Code that runs once, when we first swap to our BLM job
****************************************************** --]]
 
 -- mode determines whether your BLM will nuke in
 -- high damage or accuracy gear.  By default, we
 -- nuke in damage gear.
 mode = "damage"
 
 -- Puts on our fashion set, lockstyle it, then switch
 -- to our idle set.
send_command('wait 1;gs equip fashion;wait 1;input /lockstyle on;wait 1;gs equip idle')
send_command('input /macro book 1; wait 0.1; input /macro set 1')
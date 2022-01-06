--[[ *************************************************************
 Wren's SCH gearswap .lua for SuperNova FFXI
 Save as windower/addons/GearSwap/data/SCH.lua
 
  2016-07-24 OC  - First version. Commented to help newbies. :)
  2016-08-01 OC  - Hachirin-no-Obi, Rostrum Pumps
 2016-08-25 OC  - Sea Capes
 2016-12-02 OC  - Loquac. Earring, Stone Gorget
************************************************************* --]]
 
 --[[ ******************************************************
  Gearsets - define the various sets of gear we'll wear.
 Note that I am using Claustrum, so have no main swaps.
****************************************************** --]]
 
 function get_sets()
 
     -- fashion set is for looking nice while lockstyled.
    -- make sure you include your top-row equipment,
    -- especially if you use a ranged or throwing weapon.
    -- It's graduation day!
    sets.fashion = {
        sub         = "Reign Grip",
        head        = "Sch. M.board +1",
        body        = "Argute Gown +1",
        hands       = "Argute Bracers +1",
        legs        = "Scholar's Pants +1",
        feet        = "Argute Loafers +1"
    }
 
     -- idle set is worn when we're standing around doing
    -- nothing.  I use +Sublimation effect, movement, MP
    sets.idle = {
        main		= "Claustrum",
		sub         = "Reign Grip",
        ammo        = "Hedgehog Bomb",
        head        = "Sch. M.board +1",
        neck        = "Beak Necklace +1",
        left_ear    = "Loquac. Earring",
        right_ear   = "Celestial Earring",
        body        = "Argute Gown +1",
        hands       = "Argute Bracers +1",
        left_ring   = "Celestial Ring",
        right_ring  = "Celestial Ring",
        back        = "Shadow Mantle",
        waist       = "Pythia Sash +1",
        legs        = "Scholar's Pants +1",
        feet        = "Herald's Gaiters"
    }
 
     -- fast cast set is for casting quickly.  We put
    -- this on before the spell is begun, then switch
    -- to one of the other sets during cast.
    sets.fc = {
         sub         = "Vivid Strap +1",
        left_ear    = "Loquac. Earring",
        feet        = "Rostrum Pumps"
    }
 
     -- heal set for getting the most of our cures.
    -- Cure Potency, Healing Magic, Haste, Mind.
    sets.heal = {
        head        = "Walahra Turban",
        neck        = "Fylgja Torque +1",
        body        = "Mahatma Hpl.",
        left_ring   = "Celestial Ring",
        right_ring  = "Celestial Ring",
        body        = "Mahatma Hpl.",
        back        = "Altruistic Cape",
        feet        = "Argute Loafers +1"
    }
 
     -- enfeebling set for mob debuffs
    -- mostly +Enfeebling Skill, MACC
    sets.enfeebling = {
        ammo        = "Phtm. Tathlum",
        head        = "Ree's Headgear",
        neck        = "Enfeebling Torque",
        right_ear   = "Enfeebling Earring",
        body        = "Mahatma Hpl.",
        hands       = "Argute Bracers +1",
        back        = "Altruistic Cape",
        legs        = "Scholar's Pants +1",
        feet        = "Avocat Pigaches"
    }
 
     -- enhancing set for self and party buffs
    -- mostly +Enhancing Skill and Mind.
    sets.enhancing = {
        head        = "Goliard Chapeau",
        neck        = "Enhancing Torque",
        right_ear   = "Augment. Earring",
        body        = "Argute Gown +1",
        left_ring   = "Celestial Ring",
        right_ring  = "Celestial Ring",
        back        = "Merciful Cape",
        feet        = "Mahatma Pigaches"
    }
 
     -- nuke set is for high damage nukes. +MAB and Int.
    sets.nuke = {
        ammo        = "Phtm. Tathlum",
        head        = "Ree's Headgear",
        neck        = "Lmg. Medallion +1",
        right_ear   = "Moldavite Earring",
        body        = "Mahatma Hpl.",
        hands       = "Genie Gages",
        left_ring   = "Omn. Ring +1",
        right_ring  = "Flame Ring",
        back        = "Hecate's Cape",
        waist       = "Hachirin-no-Obi",
        legs        = "Mahatma Slops",
        feet        = "Shrewd Pumps"
    }
 
     -- dark set is for drain, aspir, and other dark magic
    -- mostly +Dark Skill and MACC
    sets.dark = {
        sub         = "Dark Grip",
        ammo        = "Phtm. Tathlum",
        head        = "Ree's Headgear",
        neck        = "Dark Torque",
        right_ear   = "Dark Earring",
        body        = "Mahatma Hpl.",
        hands       = "Bricta's Cuffs",
        left_ring   = "Flame Ring",
        right_ring  = "Omn. Ring +1",
        back        = "Merciful Cape",
        legs        = "Mahatma Slops",
        feet        = "Goliard Clogs"
    }
 
     -- resting set is for recovering MP while /heal.
    -- as much +hMP as possible.
    sets.rest = {
        head        = "Goliard Chapeau",
        neck        = "Beak Necklace +1",
        left_ear    = "Antivenom Earring",
        right_ear   = "Relaxing Earring",
        body        = "Mahatma Hpl.",
        hands       = "Genie Gages",
        left_ring   = "Celestial Ring",
        right_ring  = "Celestial Ring",
        back        = "Invigorating Cape",
        waist       = "Qiqirn Sash +1",
        feet        = "Goliard Clogs"
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

-- equip our Dark Magic set
function equip_dark()
    windower.add_to_chat(8,'[Dark]')
    equip(sets.dark)
end

-- equip out hMP set
function equip_rest()
    windower.add_to_chat(8,'[Resting]')
    equip(sets.rest)
end

-- equip our Enfeebling Magic set
function equip_enfeebling()
    windower.add_to_chat(8,'[Enfeebling]')
    equip(sets.enfeebling)
end

-- equip our nuking set
function equip_nuke()
    windower.add_to_chat(8,'[Nuke]')
    equip(sets.nuke)
end

-- equip our Enhancing Magic set
-- include our AF for bar-spell and regen boost.
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


--[[ ******************************************************
 Casting functions - these functions run automatically when
 we cast a spell, use a job ability, rest for MP, and so on
****************************************************** --]]
 
 -- the precast function runs automatically BEFORE we
 -- begin casting a spell or job ability.  For our SCH,
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
        equip_nuke()
    elseif spell.skill == 'Dark Magic' then
        equip_dark()
    end
 end
 
 -- we're done with our spell or job ability, so the aftercast
 -- function makes sure we return to our idle gear to benefit
 -- from sublimation and mp gear
 function aftercast(spell)
     equip_idle()
end

-- the status_change function runs automatically whenever we
-- engage, disengage, kneel, or stand.  As a SCH we use this
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
 -- a Yush or in-game macro.  We use it to toggle
 -- between light and dark arts with a single key
 --
 -- with Yush, something like this:
 -- ['Alt+3'] = 'input //gs c A+'
 --
 -- with in-game macros, like this:
 -- /console gs c A+
 --
 function self_command(m)
     if m == "A+" then
        if arts == "Light" then
            arts = "Dark"
            windower.add_to_chat(8,'[Current Arts: Dark]')
            send_command('input /ja "Dark Arts" <me>')
        else
             arts = "Light"
            windower.add_to_chat(8,'[Current Arts: Light]')
            send_command('input /ja "Light Arts" <me>')
        end
     end
 end
 
 --[[ ******************************************************
  Code that runs once, when we first swap to our SCH job
****************************************************** --]]
 
 -- arts determines whether our SCH is in light or dark arts
 arts = "Light"
 
 -- Equipset our Claustrum. I have an in-game equipset for this.
 -- Then puts on our fashion set and lockstyle it
 -- Then switch to our idle set.
 send_command('wait 2;input /equipset 7;wait 2;gs equip fashion;wait 2;input /lockstyle on;wait 2;gs equip idle')
--[[ *************************************************************
 Wren's PLD gearswap .lua for SuperNova FFXI
 Save as windower/addons/GearSwap/data/PLD.lua
 
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
        range       = "Lamian Kaman +1",
        ammo        = empty,
        head        = "Mirror Tiara",
        body        = "Kaiser Cuirass",
        hands       = "Blood Fng. Gnt.",
        legs        = "Blood Cuisses",
        feet        = "Hydra Sollerets"
    }
 
     -- idle set is worn when we're standing around doing
    -- nothing.  we want auto-refresh, movement
    sets.idle = {
        main        = "Excalibur",
        sub         = "Aegis",
        range       = "Lamian Kaman +1",
        ammo        = "Paralysis Arrow",
        head        = empty,
        neck        = "Parade Gorget",
        left_ear    = "Buckler Earring",
        right_ear   = "Suppanomimi",
        body        = "Royal Cloak",
        hands       = "Kaiser Handschuhs",
        left_ring   = "Hercules' Ring",
        right_ring  = "Shadow Ring",
        back        = "Shadow Mantle",
        waist       = "Warwolf Belt",
        legs        = "Blood Cuisses",
        feet        = "Glt. Leggings +1"
    }
 
     -- we throw on our engaged set when we engage a mob
    -- adds defense and shield skill
    sets.engaged = {
        head        = "Kaiser Schaller",
        neck        = "Shield Torque",
        body        = "Kaiser Cuirass",
        back        = "Boxer's Mantle",
        legs        = "Kaiser Diechlings"
    }
     
     -- if its latent is procced, we'd rather wear the
    -- parade gorget than the shield torque
    sets.parade = {
        neck        = "Parade Gorget"
    }
 
     -- our enmity set stacks enmity
    sets.enmity = {
        head        = "Aegishjalmr",
        neck        = "Harmonia's Torque",
        left_ear    = "Hades Earring +1",
        right_ear   = "Hades Earring +1",
        body        = "Hydra Haubert",
        hands       = "Hydra Moufles",
        left_ring   = "Hercules' Ring",
        right_ring  = "Mermaid Ring",
        back        = "Cerb. Mantle +1",
        waist       = "Trance Belt",
        legs        = "Hydra Brayettes",
        feet        = "Hydra Sollerets"
    }
 
     -- our resting set is for hMP.
    sets.rest = {
        main        = "Chatoyant Staff",
        neck        = "Beak Necklace +1",
        left_ear    = "Relaxing Earring",
        right_ear   = "Antivenom Earring",
        hands       = "Genie Gages",
        left_ring   = "Celestial Ring",
        right_ring  = "Celestial Ring",
        waist       = "Qiqirn Sash +1"
    }
     
     -- stacking str and mnd for knigts of round
    sets.kor = {
        head        = "Hecatomb Cap +1",
        neck        = "Flame Gorget",
        left_ear    = "Celestial Earring",
        right_ear   = "Tmph. Earring +1",
        body        = "Hct. Harness +1",
        hands       = "Hct. Mittens +1",
        left_ring   = "Celestial Ring",
        right_ring  = "Rajas Ring",
        back        = "Cuchulain's Mantle",
        waist       = "Warwolf Belt",
        legs        = "Vlr. Breeches +1",
        feet        = "Hct. Leggings +1"
    }
 
     -- stacking strength for vorpal blade
    sets.str = {
        head        = "Hecatomb Cap +1",
        neck        = "Soil Gorget", -- soil, thunder
        left_ear    = "Tmph. Earring +1",
        right_ear   = "Tmph. Earring +1",
        body        = "Hct. Harness +1",
        hands       = "Hct. Mittens +1",
        left_ring   = "Flame Ring",
        right_ring  = "Rajas Ring",
        back        = "Cuchulain's Mantle",
        waist       = "Warwolf Belt",
        legs        = "Vlr. Breeches +1",
        feet        = "Hct. Leggings +1"
    }
     
     -- shield bash set
    sets.bash = {
        right_ear   = "Knightly Earring",
        hands       = "Vlr. Gauntlets +1"
    }
 
     -- sentinel set
    sets.sentinel = {
        feet        = "Vlr. Leggings +1"
    }
 
     -- rampart set
    sets.rampart = {
        head        = "Vlr. Coronet +1"
    }
 
     -- our base haste set for flash and utsu
    sets.haste = {
        head        = "Walahra Turban",
        hands       = "Dusk Gloves +1",
        right_ring  = "Blitz Ring",
        waist       = "Sonic Belt +1",
        legs        = "Homam Cosciales",
        feet        = "Dusk Ledelsens +1"
    }
     
     -- for utsu, we sacrifice some enmity for shield
    -- skill because shield blocks prevent interruption.
    sets.utsu = {
        neck        = "Shield Torque",
        left_ear    = "Buckler Earring",
        right_ear   = "Knightly Earring"
    }
 
     sets.fc = {
         right_ear   = "Loquac. Earring",
        legs        = "Homam Cosciales"
    }
 
 end
 
 --[[ ******************************************************
  Equip functions - put on the sets we defined above, and
 echo a note to our chat log so we know it worked.
****************************************************** --]]
 
 -- equip our idle set for standing around
 function equip_idle()
     windower.add_to_chat(8,'[Idle]')
    equip(sets.idle)
end

-- equip our engaged set. If the parade gorget latent is
-- procced and we need mp, throw that on as well.
function equip_engaged()
    windower.add_to_chat(8,'[Idle]')
    if player.hpp >= 85 and player.mpp <= 99 then
        equip(sets.idle,sets.engaged,sets.parade)
    else
         equip(sets.idle,sets.engaged)
    end
 end
 
 -- equip our WS set
 function equip_ws(spell)
     windower.add_to_chat(8,'[Weapon Skill]')
    if spell.name == 'Knights of Round' then
        equip(sets.kor)
    else
         equip(sets.str)
    end
 end
 
 -- equip our hMP set
 function equip_rest()
     windower.add_to_chat(8,'[Resting]')
    equip(sets.rest)
end

-- pick between our idle set and engaged set, depending on
-- whether we're currently engaged with a mob.
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
 -- begin casting a spell or job ability.
 function precast(spell)
     if spell.type == 'WeaponSkill' then
        equip_ws(spell)
    elseif spell.name == 'Shield Bash' then
        windower.add_to_chat(8,'[Shield Bash]')
        equip(sets.enmity,sets.bash)
    elseif spell.name == 'Sentinel' then
        windower.add_to_chat(8,'[Sentinel]')
        equip(sets.enmity,sets.sentinel)
    elseif spell.name == 'Rampart' then
        windower.add_to_chat(8,'[Rampart]')
        equip(sets.enmity,sets.rampart)
    elseif spell.type:contains('Magic') or spell.type == 'Ninjutsu' then
        equip(sets.fc)
    else
         equip(sets.enmity)
    end
 end
 
 -- most of our abilities are either insta-cast or require
 -- gearswaps at the start, so we don't do much mid-cast.
 function midcast(spell)
     if spell.name == 'Flash' then
        windower.add_to_chat(8,'[Flash]')
        equip(sets.enmity,sets.haste)
    elseif spell.name == 'Utsusemi: Ni' or spell.name == 'Utsusemi: Ichi' then
        windower.add_to_chat(8,'[Utsu]')
        equip(sets.enmity,sets.haste,sets.utsu)
    else
         equip(sets.enmity)
    end
 end
 
 -- when we're done with our spell or ability, return to either
 -- our idle or engaged gear.
 function aftercast(spell)
     choose_set()
end

-- swap into hMP gear when we /heal, and return to idle gear
-- when we stand up.
function status_change(new,old)
    if new == 'Resting' then
        equip_rest()
    else
         choose_set()
    end
 end
 
 --[[ ******************************************************
  Code that runs once, when we first swap to our PLD job
****************************************************** --]]
 
 -- Puts on our fashion set, lockstyle it, then switch
 -- to our idle set.
 send_command('wait 1;gs equip fashion;wait 1;input /lockstyle on;wait 1;gs equip idle')
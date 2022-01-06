--[[ *************************************************************
 Wren's NIN gearswap .lua for SuperNova FFXI
 Save as windower/addons/GearSwap/data/NIN.lua
 
  2016-08-01 OC  - First version.
 2016-08-25 OC  - Shadow Mantle, upgraded Koga gear
 2016-12-02 OC  - Loquacious Earring, fc utsu set
************************************************************* --]]
 
 --[[ ******************************************************
  Gearsets - define the various sets of gear we'll wear.
****************************************************** --]]
 
 function get_sets()
 
     -- fashion set is for looking nice while lockstyled.
    -- make sure you include your top-row equipment,
    -- especially if you use a ranged or throwing weapon.
    -- I like the look of the Ninja Chainmail.
    sets.fashion = {
        main        = "Kikoku",
        sub         = "Fudo",
      --  range       = "Ungur Boomerang",
      --  ammo        = "",
        head        = "Maat's Cap",
        body        = "Nin. Chainmail +1",
        hands       = "Rasetsu Tekko +1",
        legs        = "Byakko's Haidate",
        feet        = "Nin. Kyahan"
    }
 
     -- idle set is worn when we're standing around doing
    -- nothing.  we want movement speed and evasion.
    sets.idle = {
     --   main        = "Kikoku",
     --   sub         = "Fudo",
     --   range       = "Ungur Boomerang",
     --  ammo        = empty,
        head        = "Maat's Cap",
        neck        = "Evasion Torque",
        left_ear    = "Elusive Earring",
        right_ear   = "Brutal Earring",
        body        = "Antares Harness",
        hands       = "Rasetsu Tekko +1",
        left_ring   = "Patronus Ring",
        right_ring  = "Shadow Ring",
        back        = "Boxer's Mantle",
        waist       = "Velocious Belt",
        legs        = "Denali Kecks",
        feet        = "Ninja Kyahan"
    }
 
     -- balance set is a nice balance between haste/DW gear
    -- evasion gear, and accuracy.  It's our default set
    -- when engaged with an enemy.
    sets.bal        = {
        head        = "Denali Bonnet",
        neck        = "Hope Torque",
        left_ear    = "Suppanomimi",
        right_ear   = "Brutal Earring",
        body        = "Denali Jacket",
        hands       = "Dusk Gloves +1",
        left_ring   = "Rajas Ring",
        right_ring  = "Toreador's Ring",
        back        = "Cerb. Mantle +1",
        waist       = "Velocious Belt",
        legs        = "Byakko's Haidate",
        feet        = "Fuma Sune-ate"
    }
 
     -- eva set sacrifices attack speed and accuracy for
    -- all-out evasion.
    sets.eva = {
        head        = "Kog. Hatsuburi +1",
        neck        = "Evasion Torque",
        left_ear    = "Elusive Earring",
        right_ear   = "Elusive Earring",
        body        = "Antares Harness",
        hands       = "Rasetsu Tekko +1",
        left_ring   = "Wivre Ring +1",
        right_ring  = "Wivre Ring +1",
        back        = "Boxer's Mantle",
        waist       = "Scouter's Rope",
        legs        = "Denali Kecks",
        feet        = "Dance Shoes +1"
    }
     
     -- WS gear for Blade Metsu: DEX 80%
    sets.ws = {
         head       = "Gnadbhod's Helm",
        neck        = "Fotia Gorget", -- shadow, breeze, or thunder
        left_ear    = "Pixie Earring",
        right_ear   = "Brutal Earring",
        body        = "Kirin's Osode",
        hands       = "Hachiryu Kote",
        left_ring   = "Rajas Ring",
        right_ring  = "Adroit Ring +1",
        back        = "Cuchulain's Mantle",
        waist       = "Cuchulain's Belt",
        legs        = "Byakko's Haidate",
        feet        = "Enkidu's Leggings"
    }
     
     sets.staff = {
    --    main       = "Chatoyant Staff",
    --   sub         = "Vivid Strap +1"
    }
     
     sets.utsu = {
        head        = "Acubens Helm",
        neck        = "Evasion Torque", --"Tiercel Necklace",
        left_ear    = "Loquac. Earring",
        right_ear   = "Elusive Earring",
        body        = "Antares Harness",
        hands       = "Dusk Gloves +1",
        left_ring   = "Wivre Ring +1",
        right_ring  = "Wivre Ring +1",
        back        = "Boxer's Mantle",
        waist       = "Velocious Belt",
        legs        = "Byakko's Haidate",
        feet        = "Dusk Ledelsens +1"
    }
     
     sets.elemental = {
 --       main        = "Chatoyant Staff",
 --       sub         = "Vivid Strap +1",
 --       ranged      = empty,
 --       ammo        = "Phantom Tathlum",
        head        = "Kog. Hatsuburi +1",
        neck        = "Ninjutsu Torque",
        left_ear    = "Stealth Earring",
        right_ear   = "Moldavite Earring",
        body        = "Kirin's Osode",
        hands       = "Dusk Gloves +1",
        left_ring   = "Omn. Ring +1",
        right_ring  = "Omn. Ring +1",
        back        = "Astute Cape",
        waist       = "Velocious Belt",
        legs        = "Denali Kecks",
        feet        = "Kog. Kyahan +1"
    }
 end
 
 --[[ ******************************************************
  Equip functions - put on the sets we defined above, and
 echo a note to our chat log so we know it worked.
****************************************************** --]]
 
 -- equip idle set (with feet at dusk to dawn)
 function equip_idle()
     windower.add_to_chat(8,'[Idle]')
    if stance == "staff" then
        equip(sets.idle,sets.staff)
    else
         equip(sets.idle)
    end
     if world.time >= (17*60) or world.time <= (7*60) then
        equip({legs="Kog. Hakama +1", feet="Ninja Kyahan"})
    end
 end
 
 -- equip evasion set (with legs at dusk to dawn)
 function equip_eva()
     windower.add_to_chat(8,'[Evasion]')
    if player.status == "Engaged" then
        if stance == "staff" then
            equip(sets.idle,sets.eva,sets.staff)
        else
             equip(sets.idle,sets.eva)
        end
         if world.time >= (17*60) or world.time <= (7*60) then
            equip({legs="Kog. Hakama +1"})
        end
     end
 end
 
 -- equip balanced engaged set (with hands at dusk to dawn)
 function equip_bal()
     windower.add_to_chat(8,'[Balanced]')
    if player.status == "Engaged" then
        if player.status == "staff" then
            equip(sets.idle,stes.bal,sets.staff)
        else
             equip(sets.idle,sets.bal)
        end
         if world.time >= (17*60) or world.time <= (7*60) then
            equip({hands="Kog. Tekko +1"})
        end
     end
 end
 
 -- equip our weapon skill set (with feet at dusk to dawn)
 function equip_ws()
     windower.add_to_chat(8,'[Weapon Skill]')
    if player.status == "Engaged" then
        equip(sets.ws)
        if world.time >= (17*60) or world.time <= (7*60) then
            equip({feet="Kog. Kyahan +1"})
        end
     end
 end
 
 function equip_utsu()
     windower.add_to_chat(8,'[Utsusemi]')
    equip(sets.utsu)
end

function equip_elemental(spell)
    if spell.element == world.day_element then
        windower.add_to_chat(8,'[Elemental - on matching day]')
        equip(sets.elemental,{waist="Hachirin-no-Obi"})
    elseif spell.element == world.weather_element then
        windower.add_to_chat(8,'[Elemental - with matching weather]')
        equip(sets.elemental,{waist="Hachirin-no-Obi"})
    else
         windower.add_to_chat(8,'[Elemental]')
        equip(sets.elemental)
    end
     if spell.element == 'Lightning' then
        --subItem = 'Thunder Grip'
    else
         --subItem = spell.element .. ' Grip'
    end
     equip({sub=subItem})    
end

-- a catchall equip function that puts on the correct set
-- whether we are engaged or idle, and sepending on our stance.
-- stance can be (E)vasion, (A)ttack, or (B)alanced.
function choose_set()
    if player.status == "Engaged" then
        if eva then
            equip_eva()
        else
             equip_bal()
        end
     else
         equip_idle()
    end
 end
 
 --[[ ******************************************************
  Casting functions - these functions run automatically when
 we cast a spell, use a job ability, rest for MP, and so on
****************************************************** --]]
 
 -- the precast function runs automatically BEFORE we
 -- begin casting a spell or job ability.  For our NIN,
 -- we want to equip ws gear for weapon skills, and our
 -- balanced set for casting Utsusemi.  We use Balanced
 -- set because it has evasion to avoid spell-interruption,
 -- and haste for utsu recast timers.
 function precast(spell)
     if spell.type == 'WeaponSkill' then
        equip_ws()
    elseif spell.type == 'Ninjutsu' then
        if spell.name:contains('Utsusemi') then
            equip({left_ear = "Loquac. Earring"})
        else
             equip({left_ear = "Loquac. Earring"})
        end
     end
 end
 
 -- as a NIN we don't do anything mid-cast, because all
 -- our job abilities and WS are essentially insta-cast.
 function midcast(spell)
     if spell.type == 'Ninjutsu' then
        if spell.name:contains('Utsusemi') then
            equip_utsu()
        else
             equip_elemental(spell)
        end
     end
 end
 
 -- after our ws or ability, call the choose_set function
 -- to put on the correct gear.
 function aftercast(spell)
     choose_set()
end

-- whenever we engage or disengage from combat, put on the
-- correct gear.
function status_change(new,old)
    choose_set()
end

-- the self_command function can be called from a Yush or
-- in-game macro.  We use it to toggle evasion on and off.
function self_command(m)
    if m == "toggleEvasion" then
        if eva then
            windower.add_to_chat(8,'[Evasion: OFF]')
            eva = false
            choose_set()
        else
             windower.add_to_chat(8,'[Evasion: ON]')
            eva = true
            choose_set()
        end
     elseif m == "toggleStance" then
        if stance == 'katanas' then
            stance = 'staff'
            windower.add_to_chat(8,'[Evasion: ON]')
            eva = true
            choose_set()
        else
             stance = 'katanas'
            windower.add_to_chat(8,'[Evasion: OFF]')
            eva = false
            choose_set()            
        end
     elseif m == "castElemental" then
        if     (nextElement=='thunder') then
            send_command('input /ma RaitonSan <t>')
            nextElement = 'earth'
        elseif (nextElement=='earth')   then
            send_command('input /ma DotonNi <t>')
            nextElement = 'wind'
        elseif (nextElement=='wind')    then
            send_command('input /ma HutonNi <t>')
            nextElement = 'ice'
        elseif (nextElement=='ice')     then
            send_command('input /ma HyotonSan <t>')
            nextElement = 'fire'
        elseif (nextElement=='fire')    then
            send_command('input /ma KatonNi <t>')
            nextElement = 'water'
        elseif (nextElement=='water')   then
            send_command('input /ma SuitonNi <t>')
            nextElement = 'thunder'
        end
     elseif m == "resetWheel" then
        windower.add_to_chat(8,'[Elemental wheel reset]')
        nextElement = 'thunder'
    end
 end
 
 --[[ ******************************************************
  Code that runs once, when we first swap to our THF job
****************************************************** --]]
 
 nextElement = 'thunder'
 stance = 'katanas'
 eva = false
 
 -- Finally, puts on our fashion set, lockstyle it, then switch to our idle set.
 send_command('wait 1;gs equip fashion;wait 1;input /lockstyle on;wait 1;gs equip idle')
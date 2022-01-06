
 function get_sets()
 
     -- fashion set is for looking nice while lockstyled.
    -- make sure you include your top-row equipment,
    -- especially if you use a ranged or throwing weapon.
    sets.fashion = {
        main        = "Mandau",
        sub         = "Blau Dolch",
        range       = "Ungur Boomerang",
        head        = empty,
        body        = "Hct. Harness +1",
        hands       = "Dusk Gloves +1",
        legs        = "Raven Hose",
        feet        = "Dusk Ledelsens +1"
    }
 
     -- idle set is worn when we're standing around doing
    -- nothing.  we want movement speed and evasion.
    sets.idle = {
        main        = "Mandau",
        sub         = "Blau Dolch",
        range       = "Ungur Boomerang",
        head        = "Optical Hat",
        neck        = "Evasion Torque",
        left_ear    = "Elusive Earring",
        right_ear   = "Elusive Earring",
        body        = "Antares Harness",
        hands       = "War Gloves +1",
        left_ring   = "Wivre Ring +1",
        right_ring  = "Wivre Ring +1",
        back        = "Boxer's Mantle",
        waist       = "Scouter's Rope",
        legs        = "Raven Hose",
        feet        = "Strider Boots"
    }
 
     -- th set is worn when we're in TH4 mode.
    sets.th = {
         sub         = "Thief's Knife",
        hands       = "Asn. Armlets"
    }
 
     -- our basic engaged set replaces some of our idle
    -- evasion slots with haste, dual wield, accuracy.
    sets.engaged = {
        head        = "Walahra Turban",
        neck        = "Peacock Charm",
        left_ear    = "Suppanomimi",
        right_ear   = "Brutal Earring",
        body        = "Dragon Harness",
        hands       = "Dusk Gloves",
        left_ring   = "Toreador's Ring",
        right_ring  = "Rajas Ring",
        back        = "Cuchulain's Mantle",
        waist       = "Sonic Belt +1",
        legs        = "Homam Cosciales",
        feet        = "Dusk Ledelsens +1"
    }
 
     -- our evasion set, when dodging is all that matters.
    -- this is very similar to our idle set, excapt we
    -- sacrifice movement speed for even more evasion.
    sets.eva = {
        head        = "Optical Hat",
        neck        = "Evasion Torque",
        left_ear    = "Elusive Earring",
        right_ear   = "Elusive Earring",
        body        = "Antares Harness",
        hands       = "War Gloves +1",
        left_ring   = "Wivre Ring +1",
        right_ring  = "Wivre Ring +1",
        back        = "Boxer's Mantle",
        waist       = "Scouter's Rope",
        legs        = "Raven Hose",
        feet        = "Dance Shoes +1"
    }
     
     -- wsdex set is for dex-based weapon skills.
    sets.wsdex = {
        head        = "Hecatomb Cap +1",
        neck        = "Soil Gorget",
        left_ear    = "Pixie Earring",
        body        = "Antares Harness",
        hands       = "Hct. Mittens +1",
        left_ring   = "Adroit Ring +1",
        right_ring  = "Rajas Ring",
        back        = "Cuchulain's Mantle",
        waist       = "Cuchulain's Belt",
        legs        = "Enkidu's Subligar",
        feet        = "Hct. Leggings +1"
    }
     
     -- mercy set stacks lots of STR for mercy stroke.
    sets.mercy = {
        head        = "Hecatomb Cap +1",
        neck        = "Soil Gorget",
        left_ear    = "Tmph. Earring +1",
        right_ear   = "Brutal Earring",
        body        = "Hct. Harness +1",
        hands       = "Hct. Mittens +1",
        left_ring   = "Flame Ring",
        right_ring  = "Rajas Ring",
        back        = "Cerb. Mantle +1",
        waist       = "Warwolf Belt",
        legs        = "Hct. Subligar +1",
        feet        = "Hct. Leggings +1"
    }
 
     -- flee set includes feet that add flee duration.
    sets.flee = {
        feet        = "Rog. Poulaines +1"
    }
     
     -- fast cast for ninjutsu
    sets.fc = {
         left_ear    = "Loquac. Earring",
        legs        = "Homam Cosciales"
    }
     
     -- utsusemi haste
    sets.utsu = {
        head        = "Walahra Turban",
        neck        = "Tiercel Necklace",
        left_ear    = "Loquac. Earring",
        right_ear   = "Elusive Earring",
        body        = "Antares Harness",
        hands       = "Dusk Gloves +1",
        left_ring   = "Wivre Ring +1",
        right_ring  = "Wivre Ring +1",
        back        = "Boxer's Mantle",
        waist       = "Sonic Belt +1",
        legs        = "Homam Cosciales",
        feet        = "Dusk Ledelsens +1"
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

-- equip our engaged set
function equip_engaged()
    windower.add_to_chat(8,'[Engaged]')
    if ev == true then
        equip(sets.idle,sets.engaged,sets.eva)
    else
         equip(sets.idle,sets.engaged)
    end
 end
 
 -- equip either our mercy strok or dex set
 function equip_ws(spell)
     windower.add_to_chat(8,'[Weapon Skill]')
    if spell.name == 'Mercy Stroke' then
        equip(sets.mercy)
    else
         equip(sets.wsdex)
    end
 end
 
 -- the choose_set function figures out whether we're engaged with a
 -- mob or not, and passes control to the relevant function above.
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
 -- begin casting a spell or job ability.  For our THF,
 -- we want to equip ws gear for weapon skills, and flee
 -- duration gear when fleeing.
 function precast(spell)
     if spell.type == 'Ninjutsu' then
        equip(sets.fc)
    elseif spell.type == 'WeaponSkill' then
        equip_ws(spell)
    elseif spell.name == 'Flee' then
        equip(sets.flee)
    end
 end
 
 -- equip haste gear for ninjutsu
 function midcast(spell)
     if spell.type == 'Ninjutsu' then
        equip(sets.utsu)
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

-- the self_command function can be called from a Yush or
-- in-game macro.  We use it for several things: toggling
-- which weaponskill to use; sneak, trick, ws, and every
-- combination of the three; and toggling evasion and TH4.
--
-- I wanted to hit one key to toggle through a list of
-- weaponskills.  This key doesn't USE the weapon skill, just
-- selects one.  So in my Yush file, I have a line like this,
-- so when I hit Alt+[ it cycles my WS.
--
-- ['Alt+[']  = 'input //gs c W+',
--
-- Next, I want to be able to solo a WS, or use it with SA, TA,
-- or SA+TA.  Note that in each case it'll use the weapon skill
-- I selected with the above cycle.  In Yush:
--
-- ['Ctrl+4'] = 'input //gs c SAWS',
-- ['Ctrl+5'] = 'input //gs c TAWS',
-- ['Ctrl+0'] = 'input //gs c SATAWS',
--
-- Next, I want to be able to put on my evasion gear with a single
-- keystroke, and keep it on until I hit that key again.  In Yush:
--
-- ['Ctrl+9'] = 'input //gs c EVA',
--
-- Finally, I want to be able to use one keystroke to toggle my TH4
-- on and off.  So again, in Yush:
--
-- ['Ctrl+['] = 'input //gs c TH',
--
function self_command(m)
    if m == "W+" then
        -- if ws == "Mercy Stroke" then
        --     ws = "Viper Bite"
        -- else
         --     ws = "Mercy Stroke"
        -- end
         windower.add_to_chat(8,'[Current WS: ' .. ws .. ']')
    elseif m == "WS" then
        send_command('input /ws "' .. ws .. '" <t>')
    elseif m == "SAWS" then
        send_command('input /ja "Sneak Attack" <me>;wait 1;input /ws "' .. ws .. '" <t>')
    elseif m == "TAWS" then
        send_command('input /ja "Trick Attack" <me>;wait 1;input /ws "' .. ws .. '" <t>')
    elseif m == "SATAWS" then
        send_command('input /ja "Sneak Attack" <me>;wait 1;input /ja "Trick Attack" <me>;wait 1;input /ws "' .. ws .. '" <t>')
    elseif m == "TH" then
        if th == false then
            th = true
            windower.add_to_chat(8,'[Treasure Hunter: ON]')
            equip(sets.th)
            disable('sub')
            disable('hands')
            choose_set()
        else
             th = false
            windower.add_to_chat(8,'[Treasure Hunter: OFF]')
            enable('sub')
            enable('hands')
            choose_set()
        end
     elseif m == "EVA" then
        if ev == false then
            ev = true
            windower.add_to_chat(8,'[Evasion: ON]')
            choose_set()
        else
             ev = false
            windower.add_to_chat(8,'[Evasion: OFF]')
            choose_set()
        end
     end
 end
 
 --[[ ******************************************************
  Code that runs once, when we first swap to our THF job
****************************************************** --]]
 
 -- th determines whether we should wear our TH4 gear
 th = false
 
 -- ev determines whether we should wear our evasion gear in combat
 ev = false
 
 -- ws determines which weapon skill we'll use.  Mercy Stroke by default.
 ws = "Mercy Stroke"
 
 -- Finally, puts on our fashion set, lockstyle it, then switch to our idle set.
 send_command('wait 1;gs equip fashion;wait 1;input /lockstyle on;wait 1;gs equip idle')
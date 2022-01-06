--[[ *************************************************************
 Wren's SAM gearswap .lua for SuperNova FFXI
 Save as windower/addons/GearSwap/data/SAM.lua
 
  2016-10-26 OC  - First version.
************************************************************* --]]
 
 --[[ ******************************************************
  Gearsets - define the various sets of gear we'll wear.
****************************************************** --]]
 
 function get_sets()
 
     -- fashion set is for looking nice while lockstyled.
    -- make sure you include your top-row equipment,
    -- especially if you use a ranged or throwing weapon.
    sets.fashion = {
        main        = "Amanomurakumo",
        sub         = "Pole Grip",
        range       = empty,
        ammo        = "Black Tathlum",
        head        = empty,
        body        = "Askar Korazin",
        hands       = "Dusk Gloves +1",
        legs        = "Hachiryu Haidate",
        feet        = "Dusk Ledelsens +1"
    }
 
     -- idle set is worn when we're standing around doing
    -- nothing.
     sets.idle = {
        main        = "Amanomurakumo",
        sub         = "Pole Grip",
        range       = empty,
        ammo        = "Black Tathlum",
        head        = "Walahra Turban",
        neck        = "Justice Torque",
        left_ear    = "Merman's Earring",
        right_ear   = "Brutal Earring",
        body        = "Askar Korazin",
        hands       = "Rasetsu Tekko +1",
        left_ring   = "Toreador's Ring",
        right_ring  = "Shadow Ring",
        back        = "Shadow Mantle",
        waist       = "Velocious Belt",
        legs        = "Hachiryu Haidate",
        feet        = "Hachiryu Sune-Ate"
    }
 
     -- our engaged set gets put on over our idle set
    -- when we engage a foe
    sets.engaged = {
        head        = "Walahra Turban",
        body        = "Hachiryu Haramaki",
        hands       = "Hachiryu Kote",
        right_ring  = "Rajas Ring",
        back        = "Cerb. Mantle +1"
    }
 
     -- our weapon skill set contains lots of STR.
    sets.ws = {
        head        = "Gnadbhod's Helm",
        neck        = "Fotia Gorget", -- breeze, thunder, or light
        left_ear    = "Harmonius Earring",
        right_ear   = "Brutal Earring",
        body        = "Nocturnus Mail",
        hands       = "Alkyoneus's Brc.",
        left_ring   = "Strigoi Ring",
        waist       = "Warwolf Belt",
        feet        = "Hmn. Sune-Ate +1"
    }
     
     -- put these on to get the most out of meditate
    sets.meditate = {
        head        = "Myn. Kabuto +1",
        hands       = "Sao. Kote +1"
    }
 
     -- put these on to get the most out of warding circle
    sets.warding = {
        head        = "Myn. Kabuto +1"
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
    equip(sets.idle,sets.engaged)
end

-- equip our ws set
function equip_ws()
    windower.add_to_chat(8,'[Weapon Skill]')
    equip(sets.idle,sets.engaged,sets.ws)
end

-- equip our ws set
function equip_meditate()
    windower.add_to_chat(8,'[Meditate]')
    equip(sets.meditate)
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
 
 -- prior to using our ability
 function precast(spell)
     if spell.type == 'WeaponSkill' then
        equip_ws()
    elseif spell.name == 'Meditate' then
        equip_meditate()
    elseif spell.name == 'Warding Circle' then
        equip_warding()
    end
 end
 
 -- sam doesn't have much to do midcast, because most
 -- actions are instant
 function midcast(spell)
 end
 
 -- after we use an ability, put on either our engaged or
 -- idle sets.
 function aftercast(spell)
     choose_set()
end

-- when we engage or disengage, sit or stand, put on the
-- correct set of gear.
function status_change(new,old)
    choose_set()
end

-- self_command is used on SAM to toggle between weapon skills,
-- and automate some of our abilities.
function self_command(m)

    -- toggle between weapon skills
    if m == "W+" then
        if ws == "Tachi: Kaiten" then
            ws = "Tachi: Gekko"
        else
             ws = "Tachi: Kaiten"
        end
         windower.add_to_chat(8,'[Current WS: ' .. ws .. ']')
        
     -- use seigan, third eye, then hasso.  this is for when we want to keep
    -- hasso up full time, but want the benefit of shorter third eye recast.
    elseif m == "STH" then
        local seigan  = windower.ffxi.get_ability_recasts()[139] or 0
        local hasso   = windower.ffxi.get_ability_recasts()[138] or 0
        local third   = windower.ffxi.get_ability_recasts()[133] or 0
        if (seigan==0 and not buffactive.Seigan and hasso==0 and third==0) then
            send_command('input /ja Seigan <me>;wait 1.2;input /ja "Third Eye" <me>;wait 1.2;input /ja Hasso <me>')
        elseif (hasso==0 and third==0) then
            send_command('input /ja "Third Eye" <me>;wait 1.2;input /ja Hasso <me>')
        elseif (third==0) then
            send_command('input /ja "Third Eye" <me>')
        elseif (hasso==0) then
            send_command('input /ja "Hasso" <me>')
        end
     
     -- use seigan, then third eye.  this is for when we need to go defensive
    -- in a hurry!
    elseif m == "ST" then
        local seigan  = windower.ffxi.get_ability_recasts()[139] or 0
        local third   = windower.ffxi.get_ability_recasts()[133] or 0
        if seigan == 0 and third == 0 then
            send_command('input /ja Seigan <me>;wait 1.2;input /ja "Third Eye" <me>')
        elseif seigan == 0 then
            send_command('input /ja "Seigan" <me>')
        elseif third == 0 then
            send_command('input /ja "Third Eye" <me>')
        end
         
     -- use our weapon skill.  if we've got over 1500 TP, use sekkanoki first.
    -- if meditate is ready, use it after our WS.
    elseif m == "WS" then
        local sekkanoki = windower.ffxi.get_ability_recasts()[140] or 0
        local meditate  = windower.ffxi.get_ability_recasts()[134] or 0
        local wsString = ""
        if sekkanoki == 0 and player.tp > 1500 then
            wsString = 'input /ja Sekkanoki <me>;wait 1;input /ws "' .. ws .. '" <t>'
        elseif meditate == 0 then
            wsString = 'input /ws "' .. ws .. '" <t>;wait 3.2;input /ja Meditate <me>'
        else
             wsString = 'input /ws "' .. ws .. '" <t>'
        end
         send_command(wsString)
    end
 end
 
 --[[ ******************************************************
  Code that runs once, when we first swap to our SAM job
****************************************************** --]]
 
 -- ws determines which weapon skill we'll use.
 ws = "Tachi: Kaiten"
 
 -- Finally, puts on our fashion set, lockstyle it, then switch to our idle set.
 send_command('wait 1;gs equip fashion;wait 1;input /lockstyle on;wait 1;gs equip idle')
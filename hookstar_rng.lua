--[[ *************************************************************
 Wren's RNG gearswap .lua for SuperNova FFXI
 Save as windower/addons/GearSwap/data/RNG.lua
 
  2016-11-05 OC  - First version.
************************************************************* --]]
 
 --[[ ******************************************************
  Gearsets - define the various sets of gear we'll wear.
****************************************************** --]]
 
 function get_sets()
 
     sets.fashion = {
        main        = "Mekki shakki",
       sub         = "Axe Grip",
--        range       = "Annihilator",
--        ammo        = "Silver Bullet",
        head        = "Maat's Cap",
        body        = "Kyudogi +1",
        hands       = "Blood Finger Gauntlets",
        legs        = "Hachiryu Haidate",
        feet        = "Hachiryu Sune-ate"
    }
 
     -- idle set is worn when we're standing around doing
    -- nothing.
     sets.idle = {
 --       main        = "Mekki shakki",
 --      sub         = "Axe Grip",
        range       = "Annihilator",
        ammo        = "Silver Bullet",
        head        = "Zha'go's Barbut",
        neck        = "Faith Torque",
        left_ear    = "Altdorf's Earring",
        right_ear   = "Wilhelm's Earring",
        body        = "Kyudogi +1",
        hands       = "Blood Fng. Gnt.",
        left_ring   = "Behemoth Ring +1",
        right_ring  = "Behemoth Ring +1",
        back        = "Amemet Mantle +1",
        waist       = "Scout's Belt",
        legs        = "Blood Cuisses",
		feet 		= "Areion Boots"
        --feet        = "Hachiryu sune-ate"
    }
 
     -- ranged attacks
    sets.ranged = {
        
		legs        = "Scout's Braccae +1",
        feet        = "Sct. Socks +1"
	}
     
     -- namas arrow
    sets.ws = {
        neck        = "Fotia Gorget", -- snow, aqua, light
        left_ear    = "Harmonius Earring",
        right_ear   = "Harmonius Earring",
        body        = "Kyudogi +1",
        left_ring   = "Rajas Ring",
        right_ring  = "Strigoi Ring",
        legs        = "Hachiryu Haidate",
        feet        = "Hackiryu sune-ate"
    }
     
 end
 
 function precast(spell)
     if spell.name == "Ranged" then
        rangedSet = sets.ranged
        if world.time >= (18*60) or world.time <= (6*60) then
            rangedSet = set_combine(rangedSet,{left_ear=""}) --L.bug Earring +1
        end
         if barrage then
            rangedSet = set_combine(rangedSet,{hands = "Htr. Bracers +1"})
            barrage = false
        end
         equip(rangedSet)
    elseif spell.type == 'WeaponSkill' then
        if world.time >= (18*60) or world.time <= (6*60) then
            equip(sets.ws,{left_ear=""})--L.bug Earring +1
        else
             equip(sets.ws)
        end
     elseif spell.name == "Scavenge" then
        equip({feet = "Hunter's Socks"})
    elseif spell.name == "Sharpshot" then
        equip({legs = "Htr. Braccae"})
    elseif spell.name == "Shadowbind" then
        equip({hands = "Hunter's Bracers"})
    elseif spell.name == "Barrage" then
        barrage = true
    end
 end
 
 function midcast(spell)
 end
 
 function aftercast(spell)
     equip(sets.idle)
end

-- self_command function for WAR is used to toggle weapon skills,
-- and conditionally use abilities from our /sam subjob.
function self_command(m)
    -- toggle weapon skills
    if m == "W+" then
        if ws == "Coronach" then
            ws = "Sidewinder"
        else
             ws = "Coronach"
        end
         windower.add_to_chat(8,'[Current WS: ' .. ws .. ']')
        
     -- use seigan, then third eye, then hasso
    elseif m == "STH" and player.sub_job == "SAM" then
        local seigan  = windower.ffxi.get_ability_recasts()[139] or 0
        local hasso   = windower.ffxi.get_ability_recasts()[138] or 0
        local third   = windower.ffxi.get_ability_recasts()[133] or 0
        if third == 0 then
            if (seigan == 0) and (not buffactive.Seigan) and ((hasso == 0) or (not buffactive.Hasso)) then
                send_command('input /ja Seigan <me>;wait 1.2;input /ja "Third Eye" <me>;wait 1.2;input /ja Hasso <me>')
            else
                send_command('input /ja "Third Eye" <me>')
            end
         end
         
     -- use seigan, then third eye.
    elseif m == "ST" and player.sub_job == "SAM" then
        local seigan  = windower.ffxi.get_ability_recasts()[139] or 0
        local third   = windower.ffxi.get_ability_recasts()[133] or 0
        if seigan == 0 and third == 0 then
            send_command('input /ja Seigan <me>;wait 1.2;input /ja "Third Eye" <me>')
        elseif seigan == 0 then
            send_command('input /ja "Seigan" <me>')
        elseif third == 0 then
            send_command('input /ja "Third Eye" <me>')
        end
         
     -- use our weapon skill of choice.  if meditate recast is down, use it afterward.
    elseif m == "WS" then
        if player.sub_job == "SAM" then
            local meditate  = windower.ffxi.get_ability_recasts()[134] or 0
            local wsString = ""
            if meditate == 0 then
                wsString = 'input /ws "' .. ws .. '" <t>;wait 3.2;input /ja Meditate <me>'
            else
                wsString = 'input /ws "' .. ws .. '" <t>'
            end
             send_command(wsString)
        else
             send_command('input /ws "' .. ws .. '" <t>')
        end
     end
 end
 
 ws = "Coronach"
 barrage = false
 
 -- Finally, puts on our fashion set, lockstyle it, then switch to our idle set.
send_command('wait 1;gs equip fashion;wait 1;input /lockstyle on;wait 1;gs equip idle')
send_command('input /macro book 5; wait 0.1; input /macro set 1')
--[[ ******************************************************
  Gearsets - define the various sets of gear we'll wear.
****************************************************** --]]
 
 function get_sets()
 
     -- idle set is worn when we're standing around doing
    -- nothing.  auto-refresh, movement, MP, -PDT
    -- for RDM this doubles as my fashion set!
    sets.idle = {
   	ammo="Bibiki Seashell", head="Nocturnus Helm", neck="Orochi Nodowa +1", lear="Merman's Earring",
   	body="Conte Corazza", hands="homam manopolas", ring1="Merman's Ring", rear="Merman's Earring",
   	waist="Resolute Belt", ring2="Merman's Ring", back="Lamia Mantle +1", legs="Blood Cuisses",
   	feet="Askar Gambieras" 
    }
	sets.fc = {
        
        head        = "Wyrm Armet +1",
        legs        = "Drachen Brais"

    }
    sets.engaged = {
		main 		= "Mezraq +1",
		sub 		= "Pole Grip",
		head 		= "Walahara Turban",
        neck        = "Chivalrous Chain",
        right_ear   = "Brutal Earring",
		left_ear 	= "Harmonius Earring",
		body		= "Nocturnus Mail",
        hands       = "Dusk Gloves +1",
        right_ring  = "Rajas Ring",
        left_ring   = "Toreador's Ring",
        back        = "Cerberus Mantle +1",
        waist       = "Velocious Belt",
        legs        = "Homam Cosciales",
        feet        = "Homam Gambieras"
    }	
	
    sets.ws = {
		ammo		= "Tiphia Sting", 
		head		= "Hecatomb Cap +1", 
		neck		= "Chivalrous Chain", 
		lear		= "Harmonius Earring",
		rear		= "Brutal Earring", 
		body		= "Nocturnus Mail", 
		hands		= "Hecatomb Mittens +1", 
		ring1		= "Strigoi Ring", 
		ring2		= "Rajas Ring",
		back		= "Cerb. Mantle +1", 
		waist		= "Warwolf Belt", 
		legs		= "Aurum cuisses", 
		feet		= "Hct. Leggings +1" 
    }	
	
	function equip_idle()
     if melee then
        windower.add_to_chat(8,'[Idle - Melee]')
        equip(sets.idle,sets.melee)
     else
         windower.add_to_chat(8,'[Idle]')
        equip(sets.idle)
    end
 end
 
  function equip_rest()
     windower.add_to_chat(8,'[Resting]')
    equip(sets.rest)
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

function choose_set()
    if player.status == "Engaged" then
        equip_engaged()
    else
         equip_idle()
    end
 end
 
 function precast(spell)
	if spell.name == 'Deep Breathing' then
	equip_breath()
        elseif (spell.type:contains('Magic') or spell.type:contains('Ninjutsu')) then
        equip_fc()
    elseif spell.type == 'WeaponSkill' then
        equip_ws()
    end
 end

function midcast(spell)
    if spell.skill == 'Healing Magic' then
        equip_fc()
    elseif spell.skill == 'Enfeebling Magic' then
        equip_fc()
    elseif spell.skill == 'Enhancing Magic' then
        equip_fc(spell)
    elseif spell.skill == 'Elemental Magic' then
        equip_fc(spell)
    elseif spell.skill == 'Dark Magic' then
        equip_fc()
	elseif spell.skill == 'Blue Magic' then
        equip_fc()	
    end
 end
 
 -- after we finish our spell or ability, return to our
 -- idle set.
 function aftercast(spell)
     choose_set()
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

 end
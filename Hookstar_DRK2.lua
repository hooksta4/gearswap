function get_sets()
	
	mote_include_version = 2
	include('Mote-Include.lua')
	
end

function job_setup()
		
		state.Buff['Aftermath'] = buffactive['Aftermath: Lv.1'] or
								  buffactive['Aftermath: Lv.2'] or
								  buffactive['Aftermath: Lv.3'] or
								  false
		
		absorbs = S{'Absorb-STR', 'Absorb-DEX', 'Absorb-VIT', 'Absorb-AGI', 'Absorb-INT', 'Absorb-MND', 'Absorb-CHR', 'Absorb-Attri', 'Absorb-ACC'}
		sleeps = S{'Sleep', 'Sleep II', 'Sleepga', 'Sleepga II'}
		
		include('Kay-Include.lua')
		
		initialize_job()
		
end

function user_setup()

	state.OffenseMode:options('Normal','Acc','Tank')
	state.WeaponskillMode:options('Normal','Acc')
	state.CastingMode:options('Normal','Acc')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')

	send_command('bind f9 gs c cycle OffenseMode')
	send_command('bind f10 gs c cycle WeaponskillMode')
	send_command('bind f11 gs c cycle CastingMode')
	send_command('bind f12 gs c update')

	send_command('bind !x gs c trade_earring1')
	send_command('bind !c gs c trade_earring2')
	send_command('bind !v gs c trade_ring')
	
	send_command('bind ^g gs c regear')
	
	gear.main = player.equipment.main
	gear.sub = player.equipment.sub
	
end

function init_gear_sets()
	
	-- misc.
	sets.INT 						    = {ammo="Phantom tathlum"
	                                      ,head="Maat's cap"        ,neck="Lemegeton medallion +1",ear1="Abyssal earring",ear2="Morion earring"
									      ,body="Crimson scale mail",hands="Abyss gauntlets"      ,ring1="Flame ring"    ,ring2="Snow ring"
									                                ,waist="Ocean stone"          ,legs="Jet seraweels"                        }
	sets.obi 						    = {Fire      = {waist="Karin Obi"}
									      ,Earth     = {waist="Dorin Obi"}
									      ,Water     = {waist="Suirin Obi"}
									      ,Wind 	 = {waist="Furin Obi"}
									      ,Ice 	     = {waist="Hyorin Obi"}
									      ,Lightning = {waist="Rairin Obi"}
									      ,Light     = {waist="Korin Obi"}
									      ,Dark 	 = {waist="Anrin Obi"}}
	                                   
	-- buff                            
	                                   
	-- precast ja                      
	sets.precast.JA 				    = {}
	                                   
	sets.precast.JA['Last Resort'] 	    = {feet="Abyss sollerets"}
	sets.precast.JA['Arcane Circle']    = {feet="Chaos sollerets"}
	sets.precast.JA['Weapon Bash'] 	    = {hands="Chaos gauntlets",ring2="Slayer's ring"}
	                                       
	-- precast magic                       
	sets.precast.FC 				    = {ear2="Loquacious earring",legs="Homam cosciales"}
	                                       
	-- midcast magic                       
	sets.midcast.FastRecast 		    = {head="Walahra turban",body="Scorpion harness +1",hands="Dusk gloves +1",waist="Velocious belt",legs="Homam cosciales",feet="Dusk ledelsens +1"}
	                                   
	sets.midcast['Ninjutsu']            = set_combine(sets.midcast.FastRecast,{neck="Fortified chain",ring2="Antica ring",back="Shadow mantle"})
	sets.midcast['Dark Magic']		    = set_combine(sets.midcast.FastRecast,sets.INT,{ammo="Sturm's report",head="Chaos burgeonet",ear1="Abyssal earring",ear2="Loquacious earring",body="Demon's harness",hands="Crimson finger gauntlets",back="Abyss cape",legs="Abyss flanchard"})
	sets.midcast['Elemental Magic']     = set_combine(sets.midcast.FastRecast,sets.INT,{ear2="Moldavite earring",body="Abyss cuirass",back="Abyss cape"})
	sets.midcast['Enfeebling Magic']    = set_combine(sets.midcast.FastRecast,{ammo="Sturm's report",head="Crimson mask",neck="Spider torque",body="Chaos cuirass",back="Abyss cape"})
	                                   
	sets.midcast['Dark Magic'].Acc	    = set_combine(sets.midcast['Dark Magic'],{body="Corselet"})
	sets.midcast['Elemental Magic'].Acc = set_combine(sets.midcast['Elemental Magic'],{ammo="Sturm's report",head="Homam zucchetto"})
	                                   
	sets.midcast.Absorb                 = set_combine(sets.midcast['Dark Magic'],{legs="Black cuisses"})
	sets.midcast.Sleep				    = set_combine(sets.midcast.FastRecast,sets.INT,{ammo="Sturm's report",head="Crimson mask",neck="Spider torque",body="Chaos cuirass",back="Abyss cape"})
	                                       
	sets.midcast['Bind']			    = sets.midcast.Sleep
	sets.midcast['Stun']			    = set_combine(sets.midcast['Dark Magic'],{head="Homam zucchetto"})
	                                   
	                                   
	-- idle                            
	sets.idle 						    = {ammo="Bibiki seashell"
									      ,head="Crimson mask"        ,neck="Chocobo whistle" ,ear1="Merman's earring",ear2="Ethereal earring"
									      ,body="Valhalla breastplate",hands="Heavy gauntlets",ring1="Defending ring" ,ring2="Shadow ring"
									      ,back="Shadow mantle"       ,waist="Lycopodium sash",legs="Crimson cuisses" ,feet="Hecatomb leggings +1"}
	sets.idle.Town 					    = set_combine(sets.idle,{ring2="Warp ring",back="Nexus cape"})
	                                    
	sets.resting 					    = {ammo="Bibiki seashell"}
	                                    
	-- defense                          
	sets.defense.PDT 				    = {ammo="Bibiki seashell",ear2="Ethereal earring",body="Valhalla breastplate",hands="Heavy gauntlets",ring1="Defending ring",ring2="Jelly ring",back="Shadow mantle"}
	sets.defense.MDT 				    = {ammo="Bibiki seashell",body="Valhalla breastplate",ear1="Merman's earring",ear2="Ethereal earring",ring1="Defending ring",ring2="Shadow ring",waist="Resolute belt"}
	                                    
	-- default engaged                          
	sets.engaged                        = {ammo="Bomb core"
	                                      ,head="Walahra turban"  ,neck="Chivalrous chain",ear1="Abyssal earring",ear2="Brutal earring"
									      ,body="Adaman hauberk"  ,hands="Dusk gloves +1" ,ring1="Rajas ring"    ,ring2=gear.TRing1
									      ,back="Amemet mantle +1",waist="Velocious belt" ,legs="Homam cosciales",feet="Dusk ledelsens +1"}
	sets.engaged.Acc                    = set_combine(sets.engaged,{ammo="Fire bomblet",neck="Peacock amulet",hands="Homam manopolas",ring1=gear.TRing2,back="Cuchulain's mantle",feet="Homam gambieras"})
	                                    
	-- apoc engaged (normal)            
	sets.engaged.Apocalypse             = {ammo="Bomb core"
									      ,head="Walahra turban"  ,neck="Chivalrous chain",ear1="Ethereal earring",ear2="Brutal earring"
									      ,body="Adaman hauberk"  ,hands="Dusk gloves +1" ,ring1="Rajas ring"    ,ring2=gear.TRing1
									      ,back="Amemet mantle +1",waist="Velocious belt" ,legs="Homam cosciales",feet="Dusk ledelsens +1"}
	sets.engaged.Apocalypse.Acc         = set_combine(sets.engaged.Apocalypse,{ammo="Fire bomblet",neck="Peacock amulet",hands="Homam manopolas",back="Cuchulain's mantle",feet="Homam gambieras"})
	sets.engaged.Apocalypse.Tank		= set_combine(sets.engaged.Apocalypse,{ammo="Bibiki seashell",back="Shadow mantle",ring2="Defending ring"})
	
	sets.engaged.Apocalypse.AM          = set_combine(sets.engaged.Apocalypse,{waist="Warwolf belt"})
	sets.engaged.Apocalypse.Acc.AM      = set_combine(sets.engaged.Apocalypse.Acc,{waist="Warwolf belt"})	
	sets.engaged.Apocalypse.Tank.AM		= set_combine(sets.engaged.Apocalypse.Tank,{body="Valhalla breastplate"})
	
	
	-- apoc engaged (SAM)               
	sets.engaged.Apocalypse.SAM         = {ammo="White tathlum"
									      ,head="Walahra turban"  ,neck="Chivalrous chain",ear1="Abyssal earring",ear2="Brutal earring"
									      ,body="Aurum cuirass"   ,hands="Dusk gloves +1" ,ring1="Rajas ring"    ,ring2=gear.TRing1
									      ,back="Amemet mantle +1",waist="Velocious belt" ,legs="Homam cosciales",feet="Dusk ledelsens +1"}
	sets.engaged.Apocalypse.Acc.SAM     = set_combine(sets.engaged.Apocalypse.SAM,{back="Cuchulain's mantle",hands="Homam manopolas",feet="Homam gambieras"})
	                                    
	sets.engaged.Apocalypse.SAM.AM      = set_combine(sets.engaged.Apocalypse.SAM,{waist="Warwolf belt"})
	sets.engaged.Apocalypse.Acc.SAM.AM  = set_combine(sets.engaged.Apocalypse.Acc.SAM.AM,{waist="Warwolf belt"})

	-- ragnarok engaged (normal)
	sets.engaged.Ragnarok				= {ammo="White tathlum"
										  ,head="Walahra turban"  ,neck="Chivalrous chain",ear1="Fowling earring",ear2="Brutal earring"
										  ,body="Adaman hauberk"  ,hands="Dusk gloves +1" ,ring1="Rajas ring"    ,ring2=gear.TRing1
										  ,back="Amemet mantle +1",waist="Velocious belt" ,legs="Homam cosciales",feet="Dusk ledelsens +1"}
	sets.engaged.Ragnarok.Acc			= set_combine(sets.engaged.Ragnarok,{neck="Peacock amulet",hands="Homam manopolas",back="Cuchulain's mantle",feet="Homam gambieras"})
	
	-- ragnarok engaged (SAM)                
	sets.engaged.Ragnarok.SAM           = {ammo="White tathlum"
										  ,head="Walahra turban"  ,neck="Chivalrous chain",ear1="Fowling earring",ear2="Brutal earring"
										  ,body="Aurum cuirass"   ,hands="Dusk gloves +1" ,ring1="Rajas ring"    ,ring2=gear.TRing1
										  ,back="Amemet mantle +1",waist="Velocious belt" ,legs="Homam cosciales",feet="Dusk ledelsens +1"}
	sets.engaged.Ragnarok.Acc.SAM       = set_combine(sets.engaged.Ragnarok,{back="Cuchulain's mantle",hands="Homam manopolas",feet="Homam gambieras"})
	
	
	
	-- zerg engaged
	sets.engaged.Zerg					= {ammo="White tathlum"
										  ,head="Walahra turban"   ,neck="Ritter gorget"  ,ear1="Bloodbead earring",ear2="Cassie earring"
										  ,body="Gloom breastplate",hands="Dusk gloves +1",ring1="Bloodbead ring"  ,ring2="Bomb queen ring"
										  ,back="Gigant mantle"    ,waist="Velocious belt",legs="Homam cosciales"  ,feet="Homam gambieras"}
	
	-- ranged                            
	sets.precast.RA 				    = {head="Zha'Go's barbut" ,neck="Peacock amulet"           ,ear1="Drone earring" ,ear2="Drone earring"
	                                      ,body="Antares harness" ,hands="Crimson finger gauntlets",ring1="Merman's ring",ring2="Merman's ring"
								          ,back="Amemet mantle +1",waist="Buccaneer's belt"        ,legs="Oily trousers"                       }
					                          
	sets.midcast.RA 				    = set_combine(sets.precast.RA,{})
	                                          
	-- ws                                    
	sets.precast.WS                     = {ammo="Bomb core"
									      ,head="Hecatomb cap"   ,neck="Chivalrous chain"      ,ear1="Fowling earring",ear2="Brutal earring"
									      ,body="Adaman hauberk" ,hands="Alkyoneus's bracelets",ring1="Rajas ring"    ,ring2="Flame ring"
									      ,back="Cerberus mantle",waist="Warwolf belt"         ,legs="Black cuisses"  ,feet="Hecatomb leggings +1 +1"}
	sets.precast.WS.Acc                 = set_combine(sets.precast.WS,{ammo="Fire bomblet",neck="Peacock amulet",ring2=gear.TRing1,back="Cuchulain's mantle"})
	
	-- ws scythe
	sets.precast.WS['Guillotine']       = set_combine(sets.precast.WS,{head="Maat's cap",neck="Fotia Gorget",ear1="Abyssal earring",ring2=gear.TRing2})
	sets.precast.WS['Guillotine'].Acc   = set_combine(sets.precast.WS['Guillotine'],{ammo="Fire bomblet",head="Hecatomb cap",back="Cuchulain's mantle"})
	                                          
	sets.precast.WS['Entropy']          = set_combine(sets.precast.WS['Guillotine'],{neck="Soil gorget"})
    sets.precast.WS['Entropy'].Acc      = set_combine(sets.precast.WS['Entropy'],{ammo="Fire bomblet",head="Hecatomb cap",back="Cuchulain's mantle"})
                                              
    sets.precast.WS['Catastrophe']      = set_combine(sets.precast.WS,{neck="Shadow gorget",ear1="Abyssal earring"})
    sets.precast.WS['Catastrophe'].Acc  = set_combine(sets.precast.WS['Catastrophe'],{ammo="Fire bomblet",back="Cuchulain's mantle"})
	
	-- ws gs
	sets.precast.WS['Scourge']			= set_combine(sets.precast.WS,{neck="fotia gorget"})
	sets.precast.WS['Scourge'].Acc      = set_combine(sets.precast.WS['Scourge'].Acc,{ammo="Fire bomblet",ring2=gear.TRing1})
	
	sets.precast.WS['Resolution']       = set_combine(sets.precast.WS,{neck="Breeze gorget",hands="Hecatomb mittens +1",back="Amemet mantle +1"})
	sets.precast.WS['Resolution'].Acc   = set_combine(sets.precast.WS['Resolution'].Acc,{ammo="Fire bomblet",ring2=gear.TRing1})
end

function job_post_precast(spell,action,spellMap,eventArgs)

	if spell.name == 'Catastrophe' then
		equip({ammo="White tathlum"})
	end
	
end

function job_buff_change(name,gain)

	sleep_swap(name,gain)
	
	if name:startswith('Aftermath') and player.equipment.main == 'Apocalypse' then
		state.Buff.Aftermath = gain
		if gain then
			add_to_chat("Equipping AM Up set.")
		else
			add_to_chat("Equipping AM Down set.")
		end
		adjust_melee_groups()
		handle_equipping_gear(player.status)
    end

end

function job_post_midcast(spell,action,spellMap,eventArgs)

	if spell.skill == 'Elemental Magic' then
		if spell.element == world.day_element or spell.element == world.weather_element then
			equip(sets.obi[spell.element])
		end
	end

end

function job_get_spell_map(spell, default_spell_map)

    if spell.skill == 'Dark Magic' and absorbs:contains(spell.english) then
        return 'Absorb'
	elseif spell.skill == 'Enfeebling Magic' and sleeps:contains(spell.english) then
		return 'Sleep'
    end
	
end

function customize_idle_set(idleSet)
    if player.mpp < 70 and player.hpp >= 85 then
        idleSet = set_combine(idleSet,{neck="Parade gorget"})
    end
    if player.hpp < 70 then
        idleSet = set_combine(idleSet,{neck="Orochi nodowa"})
    end
    return idleSet
end

function adjust_melee_groups()

	classes.CustomMeleeGroups:clear()
	if player.sub_job == 'SAM' then
		classes.CustomMeleeGroups:append('SAM')
	end
	if state.Buff.Aftermath then
		classes.CustomMeleeGroups:append('AM')
	end
	
end

function job_status_change(new,old)

	if new == "Engaged" then
	
		if player.equipment.main == 'Apocalypse' or player.equipment.main == 'Ragnarok' then
            state.CombatWeapon:set(player.equipment.main)
        elseif player.equipment.main == 'Kraken Club' or 'Mercurial Kris' then
            state.CombatWeapon:set('Zerg')
		else
            state.CombatWeapon:reset()
        end
		adjust_melee_groups()
	end
	
end
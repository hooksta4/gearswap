-- Local Settings, setting the zones prior to use
toau_zones = S{"Leujaoam Sanctum","Mamool Ja Training Grounds","Lebros Cavern","Periqia","Ilrusi Atoll",
        "Nyzul Isle","Bhaflau Remnants","Arrapago Remnants","Silver Sea Remnants","Zhayolm Remnants"}

resSpells = S{"Barstonra","Barwatera","Baraera","Barfira","Barblizzara","Barthundra",
	"Barstone","Barwater","Baraero","Barfire","Barblizzard","Barthunder","Barpoisonra","barpetra","barvira","baramnesra","barsilencera","barparalyzra","barblindra","barsleepra"}
Cure_Spells = S{"Cure","Cure II","Cure III","Cure IV","Curaga","Curaga II"}
FC_Spells = S{"Haste","Utsusemi: Ichi","Utsusemi: Ni","Refresh","Regen","Regen II","Firestorm","Hailstorm","Windstorm","Rainstorm","Sandstorm"}
Stone_Spells = S{"Stone","Stone II","Stone III","Stone IV","Stone V","Stonera","Stonera II"}
Aspir_Spells = S{"Aspir","Aspir II","Aspir III"}

Gear_Debug = 0
Melee_Mode = 0

-- Start Functions here
-- Gear Sets
function get_sets()
	
	
		
	sets.aftercast_Idle_refresh = {
    main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +1",
    body={ name="Telchine Chas.", augments={'Pet: Attack+19 Pet: Rng.Atk.+19','Pet: "Regen"+3','Enh. Mag. eff. dur. +10',}},
    hands="Geo. Mitaines +1",
    legs="Assid. Pants +1",
    feet={ name="Bagua Sandals", augments={'Enhances "Radial Arcana" effect',}},
    neck="Loricate Torque +1",
    waist="Isa Belt",
    left_ear="Digni. Earring",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Woltaris Ring",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Eva.+7 /Mag. Eva.+7','Pet: "Regen"+10',}},
}
		
	
	sets.aftercast_Move = sets.aftercast_Idle_refresh

	sets.aftercast_Idle = sets.aftercast_Idle_refresh
	
	--sets.melee = {head="Telchine cap",neck="Asperity necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",body="Onca suit",
	--			ring1="Vocane ring",ring2="Rajas Ring",back="Kayapa cape",waist="Cetl belt"}
	
	--sets.Melee = {head="Hagondes hat +1",neck="Subtlety spectacles",ear1="Steelflash earring",ear2="Bladeborn Earring",
	--	body="Hagondes coat +1",hands="Geo. Mitaines +1",ring1="Vocane ring",ring2="Defending ring",
	--	back="Lifestream cape",waist="Fucho-no-obi",legs="Hagondes pants +1",feet="Hagondes sabots +1"}
	
	sets.precast_Cure = 
	{main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Merlinic Hood", augments={'Mag. Acc.+21 "Mag.Atk.Bns."+21','MND+4','Mag. Acc.+12','"Mag.Atk.Bns."+5',}},
    body={ name="Merlinic Jubbah", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Pet: "Subtle Blow"+4','Magic burst dmg.+11%','Accuracy+17 Attack+17',}},
    hands={ name="Telchine Gloves", augments={'"Cure" potency +8%','Enh. Mag. eff. dur. +10',}},
    legs="Geo. Pants +1",
    feet="Regal Pumps +1",
    neck="Incanter's Torque",
    waist="Gishdubar Sash",
    left_ear="Hermetic Earring",
    right_ear="Etiolation Earring",
    left_ring="Rahab Ring",
    right_ring="Kishar Ring",
    back="Swith Cape"}
		
	sets.precast_FastCast = 
	{main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Merlinic Hood", augments={'Mag. Acc.+21 "Mag.Atk.Bns."+21','MND+4','Mag. Acc.+12','"Mag.Atk.Bns."+5',}},
    body={ name="Merlinic Jubbah", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Pet: "Subtle Blow"+4','Magic burst dmg.+11%','Accuracy+17 Attack+17',}},
    hands={ name="Telchine Gloves", augments={'"Cure" potency +8%','Enh. Mag. eff. dur. +10',}},
    legs="Geo. Pants +1",
    feet="Regal Pumps +1",
    neck="Incanter's Torque",
    waist="Gishdubar Sash",
    left_ear="Hermetic Earring",
    right_ear="Etiolation Earring",
    left_ring="Rahab Ring",
    right_ring="Kishar Ring",
    back="Swith Cape"}
	
	sets.precast_Haste = 
	{main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Merlinic Hood", augments={'Mag. Acc.+21 "Mag.Atk.Bns."+21','MND+4','Mag. Acc.+12','"Mag.Atk.Bns."+5',}},
    body={ name="Merlinic Jubbah", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Pet: "Subtle Blow"+4','Magic burst dmg.+11%','Accuracy+17 Attack+17',}},
    hands={ name="Telchine Gloves", augments={'"Cure" potency +8%','Enh. Mag. eff. dur. +10',}},
    legs="Geo. Pants +1",
    feet="Regal Pumps +1",
    neck="Incanter's Torque",
    waist="Gishdubar Sash",
    left_ear="Hermetic Earring",
    right_ear="Etiolation Earring",
    left_ring="Rahab Ring",
    right_ring="Kishar Ring",
    back="Swith Cape"}
	
	sets.midcast_AspirMagic =     
	{main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Bagua Galero", augments={'Enhances "Primeval Zeal" effect',}},
    body={ name="Merlinic Jubbah", augments={'"Mag.Atk.Bns."+3','"Drain" and "Aspir" potency +11','Mag. Acc.+15',}},
    hands={ name="Merlinic Dastanas", augments={'"Drain" and "Aspir" potency +10','INT+7','Mag. Acc.+2','"Mag.Atk.Bns."+6',}},
    legs={ name="Merlinic Shalwar", augments={'"Drain" and "Aspir" potency +10','VIT+10',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','Magic burst dmg.+5%','MND+4',}},
    neck="Mizu. Kubikazari",
    waist="Fucho-no-Obi",
    left_ear="Barkaro. Earring",
    right_ear="Hermetic Earring",
    left_ring="Rahab Ring",
    right_ring="Evanescence Ring",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}}
	
	sets.midcast_EnfeeblingMagic = 
	{
    main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Merlinic Hood", augments={'Mag. Acc.+21 "Mag.Atk.Bns."+21','MND+4','Mag. Acc.+12','"Mag.Atk.Bns."+5',}},
    body={ name="Amalric Doublet", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
    hands={ name="Amalric Gages", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
    legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','Magic burst dmg.+7%','Mag. Acc.+12',}},
    feet="Jhakri Pigaches +2",
    neck="Incanter's Torque",
    waist="Luminary Sash",
    left_ear="Barkaro. Earring",
    right_ear="Hermetic Earring",
    left_ring="Rahab Ring",
    right_ring="Kishar Ring",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
}
		
	sets.midcast_DarkMagic = 
	{main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Bagua Galero", augments={'Enhances "Primeval Zeal" effect',}},
    body={ name="Merlinic Jubbah", augments={'"Mag.Atk.Bns."+3','"Drain" and "Aspir" potency +11','Mag. Acc.+15',}},
    hands={ name="Merlinic Dastanas", augments={'"Drain" and "Aspir" potency +10','INT+7','Mag. Acc.+2','"Mag.Atk.Bns."+6',}},
    legs={ name="Merlinic Shalwar", augments={'"Drain" and "Aspir" potency +10','VIT+10',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','Magic burst dmg.+5%','MND+4',}},
    neck="Mizu. Kubikazari",
    waist="Fucho-no-Obi",
    left_ear="Barkaro. Earring",
    right_ear="Hermetic Earring",
    left_ring="Rahab Ring",
    right_ring="Evanescence Ring",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}}

		
			
	sets.midcast_EnhancingMagic = 
	{
    main={ name="Gada", augments={'Enh. Mag. eff. dur. +6','MND+1','Mag. Acc.+19','DMG:+3',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Befouled Crown",
    body={ name="Telchine Chas.", augments={'Pet: Attack+19 Pet: Rng.Atk.+19','Pet: "Regen"+3','Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'"Cure" potency +8%','Enh. Mag. eff. dur. +10',}},
    legs="Geo. Pants +1",
    feet="Regal Pumps +1",
    neck="Incanter's Torque",
    waist="Gishdubar Sash",
    left_ear="Digni. Earring",
    right_ear="Etiolation Earring",
    left_ring="Rahab Ring",
    right_ring="Kishar Ring",
    back="Swith Cape",
}
		
	sets.midcast_Duration = {main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Merlinic Hood", augments={'Mag. Acc.+21 "Mag.Atk.Bns."+21','MND+4','Mag. Acc.+12','"Mag.Atk.Bns."+5',}},
    body={ name="Merlinic Jubbah", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Pet: "Subtle Blow"+4','Magic burst dmg.+11%','Accuracy+17 Attack+17',}},
    hands={ name="Telchine Gloves", augments={'"Cure" potency +8%','Enh. Mag. eff. dur. +10',}},
    legs="Geo. Pants +1",
    feet="Regal Pumps +1",
    neck="Incanter's Torque",
    waist="Gishdubar Sash",
    left_ear="Barkaro. Earring",
    right_ear="Etiolation Earring",
    left_ring="Rahab Ring",
    right_ring="Kishar Ring",
    back="Swith Cape"}
	
	sets.midcast_Geomancy =   
	{main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +1",
    body={ name="Bagua Tunic +1", augments={'Enhances "Bolster" effect',}},
    hands="Geo. Mitaines +1",
    legs={ name="Bagua Pants +1", augments={'Enhances "Mending Halation" effect',}},
    feet="Azimuth Gaiters +1",
    neck="Incanter's Torque",
    waist="Luminary Sash",
    left_ear="Calamitous Earring",
    right_ear="Gifted Earring",
    left_ring="Rahab Ring",
    right_ring="Kishar Ring",
    back={ name="Lifestream Cape", augments={'Geomancy Skill +8','Indi. eff. dur. +19','Pet: Damage taken -1%',}}}
	
	sets.midcast_MAB = {
    main="Idris",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head={ name="Merlinic Hood", augments={'Mag. Acc.+21 "Mag.Atk.Bns."+21','MND+4','Mag. Acc.+12','"Mag.Atk.Bns."+5',}},
    body={ name="Merlinic Jubbah", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Pet: "Subtle Blow"+4','Magic burst dmg.+11%','Accuracy+17 Attack+17',}},
    hands={ name="Amalric Gages", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
    legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','Magic burst dmg.+7%','Mag. Acc.+12',}},
    feet="Jhakri Pigaches +2",
    neck="Sanctity Necklace",
    waist="Refoccilation Stone",
    left_ear="Barkaro. Earring",
    right_ear="Hermetic Earring",
    left_ring="Strendu Ring",
    right_ring="Mujin Band",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
}
		
	sets.midcast_MABB = {
    main="Idris",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head={ name="Merlinic Hood", augments={'Mag. Acc.+21 "Mag.Atk.Bns."+21','MND+4','Mag. Acc.+12','"Mag.Atk.Bns."+5',}},
    body={ name="Merlinic Jubbah", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Pet: "Subtle Blow"+4','Magic burst dmg.+11%','Accuracy+17 Attack+17',}},
    hands={ name="Amalric Gages", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
    legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','Magic burst dmg.+7%','Mag. Acc.+12',}},
    feet="Jhakri Pigaches +2",
    neck="Sanctity Necklace",
    waist="Refoccilation Stone",
    left_ear="Barkaro. Earring",
    right_ear="Hermetic Earring",
    left_ring="Strendu Ring",
    right_ring="Mujin Band",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
}

	sets.midcast_Impact = 
	{main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    body="Twilight Cloak",
    hands={ name="Amalric Gages", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
    legs={ name="Amalric Slops", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
    feet="Jhakri Pigaches +2",
    neck="Erra Pendant",
    waist="Luminary Sash",
    left_ear="Hermetic Earring",
    right_ear="Barkaro. Earring",
    left_ring="Rahab Ring",
    right_ring="Kishar Ring",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}}		
		
	sets.midcast_Cure =  
	{main="Vadose Rod",
    sub="Sors Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Merlinic Hood", augments={'Mag. Acc.+21 "Mag.Atk.Bns."+21','MND+4','Mag. Acc.+12','"Mag.Atk.Bns."+5',}},
    body="Vrikodara Jupon",
    hands={ name="Telchine Gloves", augments={'"Cure" potency +8%','Enh. Mag. eff. dur. +10',}},
    legs="Gyve Trousers",
    feet="Regal Pumps +1",
    neck="Incanter's Torque",
    waist="Acerbic Sash +1",
    left_ear="Mendi. Earring",
    right_ear="Etiolation Earring",
    left_ring="Rahab Ring",
    right_ring="Kishar Ring",
    back="Pahtli Cape"}
	
	sets.stun = {main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Merlinic Hood", augments={'Mag. Acc.+21 "Mag.Atk.Bns."+21','MND+4','Mag. Acc.+12','"Mag.Atk.Bns."+5',}},
    body={ name="Merlinic Jubbah", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Pet: "Subtle Blow"+4','Magic burst dmg.+11%','Accuracy+17 Attack+17',}},
    hands={ name="Telchine Gloves", augments={'"Cure" potency +8%','Enh. Mag. eff. dur. +10',}},
    legs="Geo. Pants +1",
    feet="Regal Pumps +1",
    neck="Incanter's Torque",
    waist="Luminary sash",
    left_ear="Barkaro. Earring",
    right_ear="Etiolation Earring",
    left_ring="Rahab Ring",
    right_ring="Kishar Ring",
    back="Swith Cape"}


end

-- --- Precast ---

function precast(spell)
	if spell.type == 'WeaponSkill' then	
		if spell.name == 'Flash Nova' then
			equip(sets.midcast_MAB)
			send_command('@input /echo Flash Nova Set')
		elseif spell.name == 'Cataclysm' then
			equip(sets.midcast_MAB)
			equip({head="Pixie Hairpin +1",ear2="Moonshade earring",ring2="Archon ring"})
			send_command('@input /echo Cata Set')	
		else		
			return
		end	
	
	elseif Cure_Spells:contains(spell.name) then
		equip(sets.precast_Cure)
		send_command('@input /echo Cure Precast Set')		
	elseif FC_Spells:contains(spell.name) then
		equip(sets.precast_Haste)
		send_command('@input /echo Haste Precast Set')
	elseif spell.name == 'Impact' then
		equip({body="Twilight cloak"})
		send_command('@input /echo Impact Precast Set')
	elseif spell.name == 'Stun' then
		equip(sets.stun)
		send_command('@input /echo Stun Set')	
	elseif spell.type == 'JobAbility' then
		if spell.name == 'Bolster' then
			equip({body="Bagua Tunic +1"})
		elseif spell.name == 'Life Cycle' then
			equip({body="Geomancy Tunic"})
		elseif spell.name == 'Radial Arcana' then
			equip({feet="Bagua sandals +1"})
		end	
	else
		equip(sets.precast_FastCast)
		send_command('@input /echo Fastcast Set')
	end
end
-- --- MidCast ---
function midcast(spell)
	if Cure_Spells:contains(spell.name) then 
		equip(sets.midcast_Cure)
		send_command('@input /echo ST Cure Set')
	elseif spell.name == "Stun" then
		return
	elseif spell.skill == 'Enfeebling Magic' then
		equip(sets.midcast_EnfeeblingMagic)
		send_command('@input /echo Enfeebling Set')
	elseif spell.skill == 'Enhancing Magic' then		
		if FC_Spells:contains(spell.name) then
			equip(sets.midcast_Duration)
			if spell.name == "Refresh" and spell.target.type == 'SELF' then
				send_command('@input /echo Self Target Refresh')
			else	
			send_command('@input /echo Enhancing Duration Set')
			end
		else
			equip(sets.midcast_EnhancingMagic)
			send_command('@input /echo Enhancing Regular Set')
		end
	elseif spell.skill == 'Elemental Magic' then
		if spell.name == 'Impact' then	
			equip(sets.midcast_Impact)
			weathercheck(spell.element)
			send_command('@input /echo Impact Set')			
		elseif Stone_Spells:contains(spell.name) then
			if MBB_Mode == 1 then
				equip(sets.midcast_MABB)
				weathercheck(spell.element)
				send_command('@input /echo Stone Neck MBB Set')	
			else
				equip(sets.midcast_MAB)
				weathercheck(spell.element)
				send_command('@input /echo Stone Set')
			end
		else
				if MBB_Mode == 1 then
					equip(sets.midcast_MABB)
					weathercheck(spell.element)
					send_command('@input /echo MBB Elemental Set')
				else
					equip(sets.midcast_MAB)
					weathercheck(spell.element)
					send_command('@input /echo Elemental Set')
				end				
		end
	elseif spell.skill == 'Dark Magic' then
		equip(sets.midcast_DarkMagic)
		send_command('@input /echo Dark Magic Set')
	elseif spell.skill == 'Geomancy' then
		equip(sets.midcast_Geomancy)
		send_command('@input /echo Geomancy Set')
	else
	end
end		

-- --- Aftercast ---

function aftercast(spell)
if Gear_Debug == 0 then
	if Melee_Mode == 1 and player.status == 'Engaged' then
		equip(sets.melee)
		send_command('@input /echo Melee Set')
	else		
		equip(sets.aftercast_Idle)
		send_command('@input /echo Idle Set')
	end
	else
	end	
end

-- Status Change - ie. Resting

function status_change(new,tab)
	if new == 'Resting' then
		equip(sets['Resting'])
	elseif new == 'Engaged' and Melee_Mode == 1 then
		equip(sets.melee)
	else
		equip(sets.resting)
	end
end


-- Self Commands -- ie. Defender 

function self_command(command)	
	if command == 'equip TP set' then				
		Melee_Mode = 1
		equip(sets.melee)
		send_command('@input /echo Melee Equiped')
	elseif command == 'equip Idle set' then
		Melee_Mode = 0
		equip(sets.aftercast_Idle_refresh)	
    elseif command == 'change debug mode' then
		if Gear_Debug == 1 then
			Gear_Debug = 0
			send_command('@input /echo Debug Mode Set to 0')
		else
			Gear_Debug = 1
			send_command('@input /echo Debug Mode Set to 1')
		end
	elseif command == 'change MBB mode' then
		if MBB_Mode == 1 then
			MBB_Mode = 0
			send_command('@input /echo MBB Mode off')			
		else
			MBB_Mode = 1
			send_command('@input /echo MBB Mode on')			
		end	
	end
end

-- This function is user defined, but never called by GearSwap itself. It's just a user function that's only called from user functions. I wanted to check the weather and equip a weather-based set for some spells, so it made sense to make a function for it instead of replicating the conditional in multiple places.

function weathercheck(spell_element)
	if spell_element == world.weather_element or spell_element == world.day_element then
		send_command('@input /echo Using Element Obi')
	else		
	end
end

function init_gear_sets(job)

	add_to_chat(25, "Gearsets Initialising...")
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
	
	
	-- Weapons sets
	sets.weapons={}
	sets.weapons.THF = {}
	sets.weapons.THF['Daggers'] = {main="Mandau",sub="Vajra"}
	
	sets.weapons.PLD = {}
	sets.weapons.PLD['Sword'] = {main="Fettering Blade", sub="Beatific Shield"}
	sets.weapons.PLD['Great Sword'] = {main="Ragnarok", sub="Uther's Grip"}
	
	sets.weapons.SMN = {}
	sets.weapons.SMN['Staff'] = {main="Nirvana", sub=""}
	
	
	-- Generic precast sets
    sets.precast = {} 
    sets.precast.FastCast = {}
	sets.precast.FastCast.Default = {
		left_ring = "Hermit's Ring",
		right_ring = "Hermit's Ring",
		neck="Silver Name Tag",
		head="Cache-Nez"
	}
	
	sets.precast.FastCast['Divine Magic'] = set_combine(sets.precast.FastCast.Default,{})
    sets.precast.FastCast['Healing Magic'] = set_combine(sets.precast.FastCast.Default,{})
    sets.precast.FastCast['Enhancing Magic'] = set_combine(sets.precast.FastCast.Default,{})
    sets.precast.FastCast['Enfeebling Magic'] = set_combine(sets.precast.FastCast.Default,{})
    sets.precast.FastCast['Elemental Magic'] = set_combine(sets.precast.FastCast.Default,{   })
    sets.precast.FastCast['Dark Magic'] = set_combine(sets.precast.FastCast.Default,{})
    sets.precast.FastCast['Summoning Magic'] = set_combine(sets.precast.FastCast.Default,{})
    sets.precast.FastCast['Ninjutsu'] = set_combine(sets.precast.FastCast.Default,{})
    sets.precast.FastCast['Singing'] = set_combine(sets.precast.FastCast.Default,{})
    sets.precast.FastCast['String'] = set_combine(sets.precast.FastCast.Default,{})
    sets.precast.FastCast['Wind'] = set_combine(sets.precast.FastCast.Default,{})
    sets.precast.FastCast['Blue Magic'] = set_combine(sets.precast.FastCast.Default,{})
    sets.precast.FastCast['Geomancy'] = set_combine(sets.precast.FastCast.Default,{})
    sets.precast.FastCast['Handbell'] = set_combine(sets.precast.FastCast.Default,{})
	
	
	-- Generic midcast sets
	sets.midcast = {}
    sets.midcast['Divine Magic'] = {}
	sets.midcast['Healing Magic'] = {}
	sets.midcast['Enhancing Magic'] = {}
	sets.midcast['Enfeebling Magic'] = {}
	sets.midcast['Elemental Magic'] = {}
	sets.midcast['Dark Magic'] = {}
	sets.midcast['Summoning Magic'] = {}
	sets.midcast['Ninjutsu'] = {}
	sets.midcast['Singing'] = {}
	sets.midcast['String'] = {}
	sets.midcast['Wind'] = {}
	sets.midcast['Blue Magic'] = {}
	sets.midcast['Geomancy'] = {}
	sets.midcast['Handbell'] = {}   
    sets.midcast.EnhancingDuration = {}
    sets.midcast.Stoneskin = set_combine(sets.midcast.EnhancingDuration,{legs="Haven Hose"})
    sets.midcast.Aquaveil = set_combine(sets.midcast.EnhancingDuration,{})
    sets.midcast.Refresh = set_combine(sets.midcast.EnhancingDuration,{})
    sets.midcast.Phalanx = set_combine(sets.midcast.EnhancingDuration,{})
	sets.midcast.Enspell = set_combine(sets.midcast.EnhancingDuration,{
		head="Copper Hairpin",
		sub="Warlock's Shield",
		neck="Justice Badge"
	})
	
	sets.aftercast = {}

	
	sets.Obis = {}
    sets.Obis.Fire = {waist="Karin Obi"}
    sets.Obis.Earth = {waist = "Dorin Obi"}
    sets.Obis.Water = {waist="Suirin Obi"}
    sets.Obis.Wind = {waist="Furin Obi"}
    sets.Obis.Ice = {waist="Hyorin Obi"}
    sets.Obis.Lightning = {waist="Rairin Obi"}
    sets.Obis.Light = {waist="Korin Obi"}
    sets.Obis.Dark = {waist="Anrin Obi"}
	sets.Obis.AIO = {waist = "Hachirin-no-Obi"}

	sets.JobAbility = {}
	sets.WeaponSkills = {}
		
end
-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()

end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant', 'Proc')
    state.IdleMode:options('Normal', 'PDT')
    
    state.MagicBurst = M(false, 'Magic Burst')

    lowTierNukes = S{'Stone', 'Water', 'Aero', 'Fire', 'Blizzard', 'Thunder',
        'Stone II', 'Water II', 'Aero II', 'Fire II', 'Blizzard II', 'Thunder II',
        'Stone III', 'Water III', 'Aero III', 'Fire III', 'Blizzard III', 'Thunder III',
        'Stonega', 'Waterga', 'Aeroga', 'Firaga', 'Blizzaga', 'Thundaga',
        'Stonega II', 'Waterga II', 'Aeroga II', 'Firaga II', 'Blizzaga II', 'Thundaga II'}

    gear.macc_hagondes = {}
    
    -- Additional local binds
    send_command('bind ^` input /ma Stun <t>')
    send_command('bind @` gs c activate MagicBurst')

    select_default_macro_book()
end

-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind ^`')
    send_command('unbind @`')
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    ---- Precast Sets ----
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Mana Wall'] = {}

    sets.precast.JA.Manafont = {}
    
    -- equip to maximize HP (for Tarus) and minimize MP loss before using convert
    sets.precast.JA.Convert = {}


    -- Fast cast sets for spells

    sets.precast.FC = {
		sub="Vivid Strap +1",
        ear2="Loquacious Earring",
		feet="rostrum pumps"}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})

    sets.precast.FC['Elemental Magic'] = set_combine({
		main="Chatoyant Staff",
		sub="dark grip",
        head="zenith crown",
		neck="morgana choker",
		ear1="cassie earring",
		ear2="astral earring",
        body="dalmatica",
		hands="zenith mitts +1",
		ring1="ether ring",
		ring2="serket ring",
        back="blue cape +1",
		waist="witch sash",
		legs="Mahatma Slops",
		feet="rostrum pumps"})

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

    sets.precast.FC.Curaga = sets.precast.FC.Cure
    
    ---- Midcast Sets ----
	
    sets.midcast.FastRecast = {
        head="Walahra Turban",
		ear2="Loquacious Earring",
        body="Nashira Manteel",
        back="cheviot cape",
		waist="Headlong Belt",
		legs="mahatma slops"}

    sets.midcast.Cure = {
		main="Chatoyant Staff",
		sub="Raptor Strap +1",
        head="Walahra Turban",
		neck="Fylgja Torque +1",
		ear1="Roundel Earring",
		ear2="Celestial Earring",
        body="Mahatma Houppelande",
		hands="Devotee's Mitts +1",
		ring1="Aqua Ring",
		ring2="Aqua Ring",
        back="prism cape",
		waist="witch sash",
		legs="Mahatma Slops",
		feet="mahatma pigaches"}

    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast['Enhancing Magic'] = {
		main="Chatoyant Staff",
		sub="Bugard Strap +1",
        head="Walahra Turban",
		neck="morgana's choker",
		ear1="Mamool Ja Earring",
		ear2="Celestial Earring",
        body="Nashira Manteel",
		hands="Devotee's Mitts +1",
		waist="witch sash",
        legs="mahatma slops",
		feet="mahatma pigaches",
		back="prism cape"}
    
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
		main="Chatoyant Staff",
		sub="Raptor Strap +1",
		body="Mahatma hpl.",
		waist="witch sash",
		legs="Mahatma Slop",
		feet="mahatma pigaches"})

    sets.midcast['Enfeebling Magic'] = {
		main="Chatoyant Staff",
		sub="Bugard Strap +1",
        head="genie tiara",
		neck="Enfeebling Torque",
		ear1="morion earring +1",
		ear2="morion earring +1",
        body="mahatma hpl.",
		hands="bricta's cuffs",
		ring1="Omega Ring",
		ring2="snow ring",
        back="prism cape",
		legs="mahatma slops",
		feet="Avocat Pigaches"}
        
    sets.midcast.ElementalEnfeeble = sets.midcast['Enfeebling Magic']

    sets.midcast['Dark Magic'] = {
		main="Chatoyant Staff",
		sub="vivid strap +1",
		ammo="Phantom Tathlum",
        head="walahra Turban",
		neck="Dark Torque",
		ear1="Loquacious Earring",
		ear2="Abyssal Earring",
        body="Nashira Manteel",
		hands="Sorcerer's Gloves +1",
		ring1="Omega Ring",
		ring2="snow Ring",
        back="prism cape",
		waist="headlong belt",
		legs="mahatma slops",
		feet="rostrum pumps"}

    sets.midcast.Drain = {
		main="Chatoyant Staff",
		sub="dark grip",
		ammo="Phantom Tathlum",
        head="walahra Turban",
		neck="Dark Torque",
		ear1="Loquacious Earring",
		ear2="Abyssal Earring",
        body="Nashira Manteel",
		hands="Sorcerer's Gloves +1",
		ring1="Omega Ring",
		ring2="snow Ring",
        back="prism cape",
		waist="headlong belt",
		legs="mahatma slops",
		feet="rostrum pumps"}
    
    sets.midcast.Aspir = sets.midcast.Drain

    sets.midcast.Stun = {
		main="Chatoyant Staff",
		sub="vivid strap +1",
		ammo="Phantom Tathlum",
        head="walahra Turban",
		neck="Dark Torque",
		ear1="Loquacious Earring",
		ear2="Abyssal Earring",
        body="Nashira Manteel",
		hands="Sorcerer's Gloves +1",
		ring1="Omega Ring",
		ring2="snow Ring",
        back="prism cape",
		waist="headlong belt",
		legs="mahatma slops",
		feet="rostrum pumps"}

    sets.midcast.BardSong = {}

    -- Elemental Magic sets
    
    sets.midcast['Elemental Magic'] = {
		main="Chatoyant Staff",
		sub="Bugard Strap +1",
		ammo="Phantom Tathlum",
        head="sorcerer's petas.",
		neck="uggalepih pendant",
		ear1="novio earring",
		ear2="Moldavite Earring",
        body="Genie Weskit",
		hands="Zenith Mitts +1",
		ring1="Snow Ring",
		ring2="Serket Ring",
        back="prism Cape",
		waist="witch sash",
		legs="Mahatma Slops",
		feet="Sorcerer's Sabots"}

    sets.midcast['Elemental Magic'].Resistant = {
		main="Chatoyant Staff",
		sub="Bugard Strap +1",
		ammo="Phantom Tathlum",
        head="Sorcerer's Petasos +1",
		neck="Lemegeton Medallion +1",
		ear1="Phantom Earring +1",
		ear2="Moldavite Earring",
        body="Genie Weskit",
		hands="Wizard's Gloves +1",
		ring1="Omega Ring",
		ring2="Tamas Ring",
        back="prism cape",
		waist="Sorcerer's Belt",
		legs="Mahatma Slops",
		feet="Numerist Pumps"}

    sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {})
    sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'], {})

    -- Sets to return to when not performing an action.
    
    -- Resting sets
	
    sets.resting = {
		main="snr.msk. rod",
		sub="legion scutum",
		ammo="Bibiki Seashell",
        head="oracle's cap",
		neck="beak necklace +1",
		ear2="Relaxing Earring",
        body="oracle's robe",
		hands="Oracle's Gloves",
		ring1="star ring",
		ring2="Star Ring",
        waist="Qiqirn Sash +1",
		legs="Oracle's Braconi",
		feet="Numerist Pumps"}
    

    -- Idle sets
    
    -- Normal refresh idle set
    sets.idle = {
		main="Chatoyant Staff",
		sub="Vivid Strap +1",
		ammo="Bibiki Seashell",
        head="genie tiara",
		neck="Orochi Nodowa",
		ear1="Merman's earring",
		ear2="Merman's earring",
        body="Dalmatica",
		ring2="Serket Ring",
		ring1="Defending Ring",
		hands="garden bangles",
        back="cheviot cape",
		waist="buccaneer's belt",
		legs="igqira lappas",
		feet="Herald's Gaiters"}

    -- Idle mode that keeps PDT gear on, but doesn't prevent normal gear swaps for precast/etc.
    sets.idle.PDT = {
		main="Earth Staff",
		sub="Zuuxowu Grip",
		ammo="Impatiens",
        head="Nahtirah Hat",
		neck="Twilight Torque",
		ear1="Bloodgem Earring",
		ear2="Loquacious Earring",
        body="Hagondes Coat",
		hands="Yaoyotl Gloves",
		ring1="Defending Ring",
		ring2=gear.DarkRing.physical,
        back="Umbra Cape",
		waist="Hierarch Belt",
		legs="Hagondes Pants",
		feet="Herald's Gaiters"}

    -- Idle mode scopes:
    
    -- Town gear.
    sets.idle.Town = {
		main="Chatoyant Staff",
		sub="Vivid Strap +1",
		ammo="Bibiki Seashell",
        head="genie tiara",
		neck="Orochi Nodowa",
		ear1="Merman's earring",
		ear2="Merman's earring",
        body="Dalmatica",
		ring1="jelly Ring",
		ring2="Defending Ring",
		hands="garden bangles",
        back="cheviot cape",
		waist="buccaneer's belt",
		legs="igqira lappas",
		feet="Herald's Gaiters"}
        
    -- Defense sets

    sets.defense.PDT = {
		main="Earth Staff",
		sub="Zuuxowu Grip",
        head="Nahtirah Hat",
		neck="Twilight Torque",
        body="Hagondes Coat",
		hands="Yaoyotl Gloves",
		ring1="Defending Ring",
		ring2=gear.DarkRing.physical,
        back="Umbra Cape",
		waist="Hierarch Belt",
		legs="Hagondes Pants",
		feet="Hagondes Sabots"}

    sets.Kiting = {feet="Herald's Gaiters"}

    sets.latent_refresh = {}

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    
    sets.buff['Mana Wall'] = {}

    sets.magic_burst = {neck="Mizukage-no-Kubikazari"}

end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    if spellMap == 'Cure' or spellMap == 'Curaga' then
        gear.default.obi_waist = "Ninurta's Sash"
    elseif spell.skill == 'Elemental Magic' then
        gear.default.obi_waist = "Sekhmet Corset"
        if state.CastingMode.value == 'Proc' then
            classes.CustomClass = 'Proc'
        end
    end
end


-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)

end

function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Elemental Magic' and state.MagicBurst.value then
        equip(sets.magic_burst)
    end
end

function job_aftercast(spell, action, spellMap, eventArgs)
    -- Lock feet after using Mana Wall.
    if not spell.interrupted then
        if spell.english == 'Mana Wall' then
            enable('feet')
            equip(sets.buff['Mana Wall'])
            disable('feet')
        elseif spell.skill == 'Elemental Magic' then
            state.MagicBurst:reset()
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    -- Unlock feet when Mana Wall buff is lost.
    if buff == "Mana Wall" and not gain then
        enable('feet')
        handle_equipping_gear(player.status)
    end
end

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            disable('main','sub','range')
        else
            enable('main','sub','range')
        end
    end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
    if spell.skill == 'Elemental Magic' and default_spell_map ~= 'ElementalEnfeeble' then
        --[[ No real need to differentiate with current gear.
        if lowTierNukes:contains(spell.english) then
            return 'LowTierNuke'
        else
            return 'HighTierNuke'
        end
        --]]
    end
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    
    return idleSet
end


-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 7)
end

    -- -- Minimal damage gear for procs.
	
    -- sets.midcast['Elemental Magic'].Proc = {
		-- main="Ngqoqwanb",
		-- sub="Mephitis Grip",
		-- ammo="Dosis Tathlum",
        -- head="Xux Hat",
		-- neck="Mizukage-no-Kubikazari",
		-- ear1="Phantom Earring +1",
		-- ear2="Moldavite Earring",
        -- body="Spurrina Doublet",
		-- hands="Adhara Gages",
		-- ring1="Omega Ring",
		-- ring2="Snow Ring",
        -- back="Searing Cape",
		-- waist="Sorcerer's Belt",
		-- legs="Rubeus Spats",
		-- feet="Magavan Clogs"}
		
    -- -- Idle mode when weak.
    -- sets.idle.Weak = {main="Ngqoqwanb", sub="Mephitis Grip",ammo="Dosis Tathlum",
        -- head="Artsieq Hat",neck="Fortitude Torque",ear1="Phantom Earring +1",ear2="Loquacious Earring",
        -- body="Rubeus Jacket",hands="Serpentes Cuffs",ring1="Shadow Ring",ring2="Paguroidea Ring",
        -- back="cheviot cape",waist="Goblin Cest",legs="Rubeus Spats",feet="Llwyd's Clogs"}		
		
    -- sets.defense.MDT = {
		-- ammo="Demonry Stone",
        -- head="Nahtirah Hat",
		-- neck="Twilight Torque",
        -- body="Vanir Cotehardie",
		-- hands="Yaoyotl Gloves",
		-- ring1="Defending Ring",
		-- ring2="Shadow Ring",
        -- back="Tuilha Cape",
		-- waist="Hierarch Belt",
		-- legs="Bokwus Slops",
		-- feet="Hagondes Sabots"}
		
    -- -- Engaged sets

    -- -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- -- sets if more refined versions aren't defined.
    -- -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- -- Normal melee group
    -- sets.engaged = {
        -- head="Zelus Tiara",
		-- neck="Asperity Necklace",
		-- ear1="Bladeborn Earring",
		-- ear2="Steelflash Earring",
        -- body="Hagondes Coat",
		-- hands="Bokwus Gloves",
		-- ring1="Rajas Ring",
		-- ring2="K'ayres Ring",
        -- back="Umbra Cape",
		-- waist="Goading Belt",
		-- legs="Hagondes Pants",
		-- feet="Hagondes Sabots"}


    -- -- Weaponskill sets
    -- -- Default set for any weaponskill that isn't any more specifically defined
    -- sets.precast.WS = {
        -- head="Hagondes Hat",
		-- neck="Asperity Necklace",
		-- ear1="Bladeborn Earring",
		-- ear2="Steelflash Earring",
        -- body="Hagondes Coat",
		-- hands="Yaoyotl Gloves",
		-- ring1="Rajas Ring",
		-- ring2="Icesoul Ring",
        -- back="Refraction Cape",
		-- waist="Cognition Belt",
		-- legs="Hagondes Pants",
		-- feet="Hagondes Sabots"}

    -- -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    -- sets.precast.WS['Vidohunir'] = {
		-- ammo="Dosis Tathlum",
        -- head="Hagondes Hat",
		-- neck="Eddy Necklace",
		-- ear1="Friomisi Earring",
		-- ear2="Hecate's Earring",
        -- body="Hagondes Coat",
		-- hands="Yaoyotl Gloves",
		-- ring1="Icesoul Ring",
		-- ring2="Acumen Ring",
        -- back="Toro Cape",
		-- waist="Thunder Belt",
		-- legs="Hagondes Pants",
		-- feet="Hagondes Sabots"}
    
-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

	-- Load and initialize the include file.
	include('Mote-Include.lua')
    include('organizer-lib')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()

end


-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc')
    state.RangedMode:options('Normal')
    state.HybridMode:options('Normal')
    state.WeaponskillMode:options('Normal')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'MDT')
    state.RestingMode:options('Normal')
    state.PhysicalDefenseMode:options('PDT')
    state.MagicalDefenseMode:options('MDT')

    -- Additional local binds
    send_command('bind ^` input /ja "Light Arts" <me>')
    send_command('bind !` input /ja "Dark Arts" <me>')

end


-- Called when this job file is unloaded (eg: job change)
function user_unload()

    send_command('unbind ^`')
    send_command('unbind !`')

end

function init_gear_sets()	
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {
    sub="Vivid Strap +1", head="Warlock's Chapeau", body="Dls. Tabard +1", lear="Loquacious Earring" }
        
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {} )

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {} )

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, { } )

    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']

    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], { } )
    sets.precast.FC.Curaga = sets.precast.FC.Cure
    sets.precast.FC.CureSolace = sets.precast.FC.Cure
    -- CureMelee spell map should default back to Healing Magic.
    
    -- Precast sets to enhance JAs

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
    
    
    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
    head="Voyager Sallet", neck=gear.ElementalGorget, lear="Suppanomimi", rear="Brutal Earring",
    body="Antares Harness", hands="", lring="Toreador's Ring", rring="Rajas Ring",
    back="Cerb. Mantle", waist=gear.default.weaponskill_waist, legs="Dusk Trousers +1", feet="Bounding Boots" }


    -- Midcast Sets
    
    sets.midcast.FastRecast = {
    sub="Vivid Strap +1", head="Warlock's Chapeau", body="Goliard Saio", hands=gear.HasteHands,
    lear="Loquacious Earring", feet=gear.HasteFeet, waist="Headlong Belt" }
    
    -- Cure sets

    sets.midcast.Cure = {
    main="Chatoyant Staff", ranged="Failnaught", 
    head="Goliard Chapeau", neck="Fylgja Torque +1", lear="Roundel Earring", rear="Celestial Earring",
    body="Goliard Saio", hands=gear.HasteHands, lring="Celestial Ring", rring="Celestial Ring",
    back="Mahatma Cape", waist="Pythia Sash +1", legs="Mahatma Slops", feet=gear.HasteFeet }

    sets.midcast.Curaga = {
    main="Chatoyant Staff", ranged="Failnaught",
    head="Goliard Chapeau", neck="Fylgja Torque +1", lear="Roundel Earring", rear="Celestial Earring",
    body="Goliard Saio", hands=gear.HasteHands, lring="Celestial Ring", rring="Celestial Ring",
    back="Mahatma Cape", waist="Pythia Sash +1", legs="Mahatma Slops", feet=gear.HasteFeet }

    sets.midcast.CureMelee = {
    neck="Fylgja Torque +1", head="Goliard Chapeau", lear="Roundel Earring", rear="Celestial Earring",
    body="Goliard Saio", hands=gear.HasteHands, lring="Celestial Ring", rring="Celestial Ring",
    back="Mahatma Cape", waist="Pythia Sash +1", legs="Mahatma Slops", feet=gear.HasteFeet }

    sets.midcast.Cursna = { }

    sets.midcast.StatusRemoval = {}

    sets.midcast['Enhancing Magic'] = {
    neck="Enhancing Torque", rear="Augmenting Earring", legs="Warlock's Tights" }

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
    main="Chatoyant Staff",
    body="Errant Hpl.", back="Prism Cape", lring="Celestial Ring", rring="Celestial Ring" } )

    sets.midcast.BarElement = set_combine(sets.midcast['Enhancing Magic'], {
    body="Glamor Jupon", hands="Dls. Gloves +1" } )

    sets.midcast['Divine Magic'] = {
    neck="Divine Torque", lear="Divine Earring" }

    sets.midcast['Dark Magic'] = {
    main="Chatoyant Staff",
    neck="Dark Torque", lear="Dark Earring", body="Glamor Jupon",
    hands="Blood Fng. Gnt.", back="Hecate's Cape", waist="Witch Sash" }

--    sets.midcast.Bio = sets.midcast.FastRecast

    sets.midcast['Elemental Magic'] = {
    main="Chatoyant Staff",
    head="Warlock's Chapeau", neck="Lmg. Medallion +1", lear="Moldavite Earring", rear="Loq. Earring",
    body="Errant Hpl.", hands="Zenith Mitts", lring="Tamas Ring", rring="Snow Ring",
    back="Prism Cape", waist="Penitent's Rope", legs="Jet Seraweels", feet="Custom M Boots" }

    -- Blizzard specific staff
    sets.midcast.Blizzard = set_combine(sets.midcast['Elemental Magic'], {
    main="Aquilo's Staff" } )
    sets.midcast.Helix = sets.midcast['Elemental Magic']

    sets.midcast['Cryohelix'] = sets.midcast.Blizzard

    -- Custom spell classes
    sets.midcast.MndEnfeebles = {
    --main="Mistilteinn", sub="Nms. Shield +1",
    head="Duelist's Chapeau", neck="Promise Badge", 
    lear="Celestial Earring", rear="Celestial Earring", body="Warlock's Tabard", hands="Devotee's Mitts +1",
    lring="Celestial Ring", rring="Celestial Ring", back="Prism Cape", waist="Penitent's Rope",
    legs="Jet Seraweels", feet="Avocat Pigaches" }

    sets.midcast.MndEnfeebles.Resistant = {
    main="Chatoyant Staff",
    head="Duelist's Chapeau", neck="Spider Torque", lear="Incubus Earring +1", rear="Incubus Earring +1",
    body="Warlock's Tabard", hands="Devotee's Mitts +1", lring="Celestial Ring", rring="Celestial Ring",
    back="Prism Cape", waist="Penitent's Rope", legs="Jet Seraweels", feet="Avocat Pigaches" }

    -- Sets for mnd enfeebles with no potency
    sets.midcast['Silence'] = sets.midcast.MndEnfeebles.Resistant
	sets.midcast['Dispel'] = sets.midcast.IntEnfeebles

    sets.midcast.IntEnfeebles = {
    main="Chatoyant Staff",
    head="Duelist's Chapeau", neck="Spider Torque", lear="Incubus Earring +1", rear="Incubus Earring +1",
    body="Warlock's Tabard", hands="Devotee's Mitts +1", lring="Celestial Ring", rring="Celestial Ring",
    back="Prism Cape", waist="Penitent's Rope", legs="Jet Seraweels", feet="Avocat Pigaches" }

    sets.midcast.IntEnfeebles.Resistant = sets.midcast.IntEnfeebles

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {
    main=gear.Staff.HMP, sub="Flat Shield", 
    head="Duelist's Chapeau", neck="Beak Necklace +1", lear="Rapture Earring", rear="Antivenom Earring",
    body="Errant Hpl.", hands="Hydra Gloves", lring="Celestial Ring", rring="Celestial Ring",
    back="Invigorating Cape", waist="Duelist's Belt", legs="Baron's Slops", feet="Avocat Pigaches" }
    

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {
    main=gear.Staff.PDT, ammo="Hedgehog Bomb",
    head="Duelist's Chapeau", neck="Orochi Nodowa +1", lear="Merman's Earring", rear="Merman's Earring",
    body="Dalmatica", hands="Zenith Mitts", lring="Coral Ring", rring="Coral Ring",
    back="Umbra Cape", waist="Resolute Belt", legs="Crimson Cuisses", feet="Avocat Pigaches" }

    sets.idle.PDT = {
    main=gear.Staff.PDT, ammo="Hedgehog Bomb", 
    head="Duelist's Chapeau", neck="Orochi Nodowa +1", lear="Merman's Earring", rear="Merman's Earring",
    body="Dalmatica", hands="Dst. Mittens +1", lring="Jelly Ring", rring="Merman's Ring",
    back="Umbra Cape", waist="Resolute Belt", legs="Crimson Cuisses", feet="Dst. Leggings +1" }

    sets.idle.MDT = {
    main=gear.Staff.MDT, ammo="Hedgehog Bomb",
    head="Duelist's Chapeau", neck="Orochi Nodowa +1", lear="Merman's Earring", rear="Merman's Earring",
    body="Dalmatica", hands="Coral Fng. Gnt. +1", lring="Merman's Ring", rring="Merman's Ring",
    back="Lamia Mantle +1", waist="Resolute Belt", legs="Crimson Cuisses", feet="Coral Greaves +1" }

    sets.idle.Town = {
    main=gear.Staff.PDT, ammo="Hedgehog Bomb",
    head="Duelist's Chapeau", neck="Orochi Nodowa +1", lear="Merman's Earring", rear="Merman's Earring",
    body="Dalmatica", hands="Coral Fng. Gnt. +1", lring="Merman's Ring", rring="Merman's Ring",
    back="Umbra Cape", waist="Resolute Belt", legs="Crimson Cuisses", feet="Coral Greaves +1" }
    
    sets.idle.Weak = {
    main=gear.Staff.PDT, ammo="Hedgehog Bomb",
    head="Duelist's Chapeau", neck="Orochi Nodowa +1", lear="Merman's Earring", rear="Merman's Earring",
    body="Dalmatica", hands="Coral Fng. Gnt. +1", lring="Merman's Ring", rring="Merman's Ring", 
    back="Umbra Cape", waist="Resolute Belt", legs="Crimson Cuisses", feet="Coral Greaves +1" }
    
    -- Defense sets

    sets.defense.PDT = {
    main=gear.Staff.PDT, head="Darksteel Cap +1", neck="Orochi Nodowa +1", body="Dst. Harness +1", hands="Dst. Mittens +1",
    lring="Jelly Ring", back="Umbra Cape", legs="Dst. Subligar +1", feet="Dst. Leggings +1" }

    sets.defense.MDT = {
    main=gear.Staff.MDT, ranged="Lamian Kaman +1", head="Coral Visor +1", neck="Jeweled Collar +1",
    lear="Merman's Earring", rear="Merman's Earring", body="Dalmatica", hands="Coral Fng. Gnt. +1",
    lring="Merman's Ring", rring="Merman's Ring", back="Lamia Mantle +1", waist="Resolute Belt", 
    legs="Coral Cuisses +1", feet="Coral Greaves +1" }

    sets.Kiting = { legs="Crimson Cuisses" }

    sets.latent_refresh = {}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Basic set for if no TP weapon is defined.
    sets.engaged = {
    head="Walahra Turban", neck="Ancient Torque", body="Goliard Saio", hands=gear.HasteHands,
    lear="Suppanomimi", rear="Brutal Earring", back="Cerb. Mantle", lring="Toreador's Ring", rring="Rajas Ring",
    waist="Headlong Belt", legs="Dusk Trousers +1", feet=gear.HasteFeet }

    sets.engaged.Acc = {
    head="Walahra Turban", neck="Ancient Torque", body="Goliard Saio", hands=gear.HasteHands,
    lear="Suppanomimi", rear="Brutal Earring", back="Cerb. Mantle +1", lring="Toreador's Ring", rring="Rajas Ring",
    waist="Headlong Belt", legs="Dusk Trousers +1", feet=gear.HasteFeet }
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'None' then
            enable('main','sub','range')
        else
            disable('main','sub','range')
        end
    end
end

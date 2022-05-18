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
  state.OffenseMode:options('GA', 'DualWield', 'GS')
  state.RangedMode:options('Normal')
  state.HybridMode:options('Normal', 'Acc')
  state.WeaponskillMode:options('Normal')
  state.CastingMode:options('Normal')
  state.IdleMode:options('Normal', 'PDT', 'MDT')
  state.RestingMode:options('Normal')
  state.PhysicalDefenseMode:options('PDT')
  state.MagicalDefenseMode:options('MDT')

  -- Additional local binds
  send_command('bind ^` input /ja "Hasso" <me>')
  send_command('bind !` input /ja "Seigan" <me>')
  
end


-- Called when this job file is unloaded (eg: job change)
function user_unload()
  send_command('unbind ^`')
  send_command('unbind !`')
end

function init_gear_sets()
  
  --------------------------------------
  -- Precast sets
  --------------------------------------
    -- fashion set is for looking nice while lockstyled.
    -- make sure you include your top-row equipment,
    -- especially if you use a ranged or throwing weapon.
    -- I like the look of the Genie set.
    sets.fashion = {
        main        = "Bravua",

    }

  sets.enmity = {
  head="Hydra Salade", neck="Harmonia's Torque", lear="Hades Earring +1", rear="Hades Earring +1",
  body="Hydra Haubert", hands="Hydra Moufles", lring="Mermaid's Ring", rring="Hercules' Ring",
  back="Cerb. Mantle +1", waist="Warwolf Belt", legs="Hydra Brayettes", feet="Hydra Sollerets" }

  -- Sets to apply to arbitrary JAs
  sets.precast.JA['Provoke']  = sets.enmity

  sets.precast.JA['Warcry']  = sets.enmity
  
  -- Sets to apply to any actions of spell.type
  sets.precast.Waltz = {
  ammo="Bibiki Seashell", head="Kaiser Schaller", body="Kaiser Cuirass", hands="Kaiser Handschuhs",
  waist="Warwolf Belt", legs="Kaiser Diechlings", feet="Kaiser Schuhs" }
    
  -- Sets for specific actions within spell.type
  sets.precast.Waltz['Healing Waltz'] = {}

    -- Sets for fast cast gear for spells
  sets.precast.FC = { rear="Loquacious Earring" }

    -- Fast cast gear for specific spells or spell maps

  -- Weaponskill sets
  sets.precast.WS = {
  ammo="Fire Bomblet", head="Hecatomb Cap +1", neck="Fotia Gorget", lear="Harmonius Earring", rear="Brutal Earring",
  body="Nocturnus Mail", hands="Hct. Mittens +1", ring1="Flame Ring", ring2="Rajas Ring",
  back="Cuchulain's Mantle", waist="Warrior's Stone", legs="Hecatomb subligar +1", feet="Hct. Leggings +1" }

  -- Specific weaponskill sets.
  sets.precast.WS['Raging Rush'] = set_combine( sets.precast.Crit_WS, { neck="Ancient Torque", body="Zahak's Mail" } )

  sets.precast.WS['Metatron Torment'] = set_combine( sets.precast.WS, { neck="Fotia Gorget", hands="Alkyoneus's Brc." } )

  sets.precast.WS['Steel Cyclone'] = set_combine( sets.precast.WS, { hands="War. Mufflers +1" } )


  --------------------------------------
  -- Midcast sets
  --------------------------------------

  -- Generic spell recast set
  sets.midcast.FastRecast = {
  head="Walahra Turban", rear="Loquacious Earring", hands="Dusk Gloves +1", waist="Ninurta's Sash",
  legs="Byakko's Haidate", feet="Dusk Ledelsens +1", ring1="Blitz ring" }
    
  -- Specific spells

  
  --------------------------------------
  -- Idle/resting/defense/etc sets
  --------------------------------------
  
  -- Resting sets
  sets.resting = {
  ammo="Bibiki Seashell", head="Coral Visor +1", neck="Orochi Nodowa +1", lear="Merman's Earring",
  body="Conte Corazza", hands="Coral Fng. Gnt. +1", ring1="Rajas Ring", rear="Merman's Earring",
  waist="Resolute Belt", ring2="Shadow Ring", back="Lamia Mantle +1", legs="Coral Cuisses +1",
  feet="Hermes' Sandals +1" }
  

  -- Idle sets
  sets.idle = {
  main = "Bravua", sub = "Pole Grip", ammo="Bibiki Seashell", head="Nocturnus helm", neck="Orochi Nodowa +1", lear="Merman's Earring",
  body="Nocturnus Mail", hands="Askar Manopolas", ring1="Merman's Ring", rear="Merman's Earring",
  waist="Resolute Belt", ring2="Merman's Ring", back="Boxer's Mantle", legs="Byakko's Haidate",
  feet="Hermes' Sandals +1" }
  
  sets.idle.Weak = {
  ammo="Bibiki Seashell", head="Coral Visor +1", neck="Orochi Nodowa +1", lear="Merman's Earring",
  body="Conte Corazza", hands="Coral Fng. Gnt. +1", ring1="Merman's Ring", rear="Merman's Earring",
  waist="Resolute Belt", ring2="Merman's Ring", back="Lamia Mantle +1", legs="Coral Cuisses +1",
  feet="Hermes' Sandals +1" }
  
  -- Defense sets
  sets.defense.PDT = {
  ammo="Bibiki Seashell", head="Darksteel Cap +1", neck="Orochi Nodowa +1", body="Dst. Harness +1",
  back="Boxer's Mantle", hands="Dst. Mittens +1", ring1="Jelly Ring", legs="Dst. Subligar +1", feet="Askar Gambieras" }

  sets.defense.MDT = {
  head="Coral Visor +1", neck="Jeweled Collar +1", body="Cor. Scale Mail +1", hands="Coral Fng. Gnt. +1",
  ring1="Merman's Ring", ring2="Merman's Ring", waist="Resolute Belt", lear="Merman's Earring",
  back="Lamia Mantle +1", waist="Resolute Belt", rear="Merman's Earring", legs="Coral Cuisses +1",
  feet="Askar Gambieras" }

    -- Gear to wear for kiting
  sets.Kiting = { feet="Hermes' Sandals +1" }

  --------------------------------------
  -- Engaged sets
  --------------------------------------

  -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
  -- sets if more refined versions aren't defined.
  -- If you create a set with both offense and defense modes, the offense mode should be first.
  -- EG: sets.engaged.Dagger.Accuracy.Evasion
  
  -- Normal melee group
  sets.engaged = {
  ammo="Fire Bomblet", head="Nocturnus Helm", neck="Prudence Torque", body="Nocturnus Mail",
  hands="Dusk Gloves +1", waist="Ninurta's Sash", back="Cerb. Mantle +1",  legs="Byakko's Haidate",
  feet="Dusk Ledelsens +1", lear="Assault Earring", rear="Brutal Earring", ring1="Blitz ring", ring2="Rajas Ring" }

  sets.engaged.GA = {
  ammo="White Tathlum", sub="Pole Grip", head="Walahra Turban", neck="Fortitude Torque", body="Nocturnus Mail",
  hands="Dusk Gloves +1", waist="Ninurta's Sash", back="Cerb. Mantle +1",  legs="Byakko's Haidate",
  feet="Dusk Ledelsens +1", lear="Assault Earring", rear="Brutal Earring", ring1="Blitz ring", ring2="Rajas Ring" }

  sets.engaged.DualWield = {
  ammo="Fire Bomblet", head="Walahra Turban", neck="Fortitude Torque", body="Nocturnus Mail",
  hands="Dusk Gloves +1", waist="Ninurta's Sash", back="Cerb. Mantle +1", rear="Brutal Earring",
  legs="Byakko's Haidate", feet="Dusk Ledelsens +1", lear="Suppanomimi", ring1="Blitz ring", ring2="Rajas Ring" }


  sets.engaged.Acc = {
  ammo="Fire Bomblet", head="Walahra Turban", neck="Fortitude Torque", body="Nocturnus Mail", hands="Dusk Gloves +1",
  waist="Ninurta's Sash", back="Cuchulain's Mantle",  legs="Byakko's Haidate", feet="Dusk Ledelsens +1",
  lear="Assault Earring", rear="Brutal Earring", ring1="Toreador's ring", ring2="Rajas Ring" }

  sets.engaged.GA.Acc = {
  ammo="Fire Bomblet", head="Walahra Turban", neck="Fortitude Torque", body="Nocturnus Mail", hands="Dusk Gloves +1",
  waist="Ninurta's Sash", back="Cuchulain's Mantle",  legs="Byakko's Haidate", feet="Dusk Ledelsens +1",
  lear="Assault Earring", rear="Brutal Earring", ring1="Toreador's ring", ring2="Rajas Ring" }

  sets.engaged.DualWield.Acc = {
  ammo="Fire Bomblet", head="Walahra Turban", neck="Fortitude Torque", body="Nocturnus Mail", hands="Dusk Gloves +1",
  waist="Ninurta's Sash", back="Cuchulain's Mantle", rear="Brutal Earring", legs="Byakko's Haidate",
  feet="Dusk Ledelsens +1", lear="Suppanomimi", ring1="Toreador's ring", ring2="Rajas Ring" }

  --------------------------------------
  -- Custom buff sets
  --------------------------------------

end
send_command('wait 1;gs equip fashion;wait 1;input /lockstyle on;wait 1;gs equip idle')
send_command('input /macro book 14; wait 0.1; input /macro set 1')
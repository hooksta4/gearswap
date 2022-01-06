-- *** Credit goes to Flippant for helping me with Gearswap *** --
-- ** I Use Some of Motenten's Functions ** --

function get_sets()
	AccIndex = 1
	AccArray = {"LowACC","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For TP/WS/Hybrid. First Set Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below --
	ShieldIndex = 1
	ShieldArray = {"Ochain","Aegis","Priwen"} -- Default Shield Type Is Ochain. Set Default Shield Type Here. --
	IdleIndex = 1
	IdleArray = {"Movement","Regen","Refresh"} -- Default Idle Set Is Movement --
	TypeIndex = 1
	Armor = 'None'
	canceled = false
	Twilight = 'None'
	Repulse = 'OFF' -- Set Default Repulse ON or OFF Here --
	Cover = 'ON' -- Set Default Cover ON or OFF Here --
	target_distance = 5 -- Set Default Distance Here --
	select_default_macro_book() -- Change Default Macro Book At The End --

	-- Gavialis Helm --
	elements = {}
	elements.equip = {head="Gavialis Helm"}
	elements["Chant du Cygne"] = S{"Light","Ice","Water","Wind","Fire","Lightning"}
	elements.Requiescat = S{"Dark","Earth"}
	elements.Resolution = S{"Lightning","Wind","Earth"}

	Cure_Spells = {"Cure","Cure II","Cure III","Cure IV"} -- Cure Degradation --
	sc_map = {SC1="Flash", SC2="UtsusemiNi", SC3="UtsusemiIchi"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --
	Enmity_BlueMagic = S{"Jettatura","Sheep Song","Soporific","Blank Gaze","Geist Wall"} -- Add or Remove Enmity BlueMagic Here --

	sets.Idle = {}
	-- Idle/Town Sets --
	sets.Idle.Regen = {}
	sets.Idle.Regen.Ochain = set_combine(sets.Idle.Regen,{
			main="Burtgang",
			sub="Ochain"})
	sets.Idle.Regen.Aegis = set_combine(sets.Idle.Regen,{
			main="Burtgang",
			sub="Aegis"})
	sets.Idle.Regen.Priwen = set_combine(sets.Idle.Regen,{
			main="Burtgang",
			sub="Priwen"})

	-- Movement/Refresh Sets --
	sets.Idle.Movement = set_combine(sets.Idle.Regen,{
			legs="Blood Cuisses"})
	sets.Idle.Movement.Ochain = set_combine(sets.Idle.Movement,{
			main="Burtgang",
			sub="Ochain"})
	sets.Idle.Movement.Aegis = set_combine(sets.Idle.Movement,{
			main="Burtgang",
			sub="Aegis"})
	sets.Idle.Movement.Priwen = set_combine(sets.Idle.Movement,{
			main="Burtgang",
			sub="Priwen"})

	sets.Idle.Refresh = set_combine(sets.Idle.Regen,{
			head="Wivre Hairpin",
			body="Twilight Mail",
			hands="Ogier's Gauntlets",
			feet="Ogier's Leggings"})
	sets.Idle.Refresh.Ochain = set_combine(sets.Idle.Refresh,{
			main="Burtgang",
			sub="Ochain"})
	sets.Idle.Refresh.Aegis = set_combine(sets.Idle.Refresh,{
			main="Burtgang",
			sub="Aegis"})
	sets.Idle.Refresh.Priwen = set_combine(sets.Idle.Refresh,{
			main="Burtgang",
			sub="Priwen"})

	-- Resting Set --
	sets.Resting = set_combine(sets.Idle.Regen,{})

	-- Twilight Set --
	sets.Twilight = {head="Twilight Helm",body="Twilight Mail"}

	-- TP Base Set --
	sets.TP = {}

	-- Ochain TP Sets --
	sets.TP.Ochain = {
			main="Burtgang",
			sub="Ochain"}
	sets.TP.Ochain.MidACC = set_combine(sets.TP.Ochain,{})
	sets.TP.Ochain.HighACC = set_combine(sets.TP.Ochain.MidACC,{})

	-- Aegis TP Sets --
	sets.TP.Aegis = {
			main="Burtgang",
			sub="Aegis"}
	sets.TP.Aegis.MidACC = set_combine(sets.TP.Aegis,{})
	sets.TP.Aegis.HighACC = set_combine(sets.TP.Aegis.MidACC,{})

	-- Priwen TP Sets --
	sets.TP.Priwen = {
			main="Burtgang",
			sub="Priwen"}
	sets.TP.Priwen.MidACC = set_combine(sets.TP.Priwen,{})
	sets.TP.Priwen.HighACC = set_combine(sets.TP.Priwen.MidACC,{})

	-- Ragnarok TP Sets --
	sets.TP.Ragnarok = {}
	sets.TP.Ragnarok.MidACC = set_combine(sets.TP.Ragnarok,{})
	sets.TP.Ragnarok.HighACC = set_combine(sets.TP.Ragnarok.MidACC,{})

	-- Ragnarok(Ionis) TP Sets --
	sets.TP.Ragnarok.Ionis = set_combine(sets.TP.Ragnarok,{})
	sets.TP.Ragnarok.MidACC.Ionis = set_combine(sets.TP.Ragnarok.Ionis,{})
	sets.TP.Ragnarok.HighACC.Ionis = set_combine(sets.TP.Ragnarok.MidACC.Ionis,{})

	-- PDT/MDT/DT Sets --
	sets.PDT = {}
	sets.PDT.Ochain = {
			sub="Ochain"}
	sets.PDT.Aegis = {
			sub="Aegis"}
	sets.PDT.Priwen = {
			sub="Priwen"}

	sets.MDT = {}
	sets.MDT.Ochain = set_combine(sets.PDT.Ochain,{})
	sets.MDT.Aegis = set_combine(sets.PDT.Aegis,{})
	sets.MDT.Priwen = set_combine(sets.PDT.Priwen,{})

	sets.DT = {}
	sets.DT.Ochain = set_combine(sets.PDT.Ochain,{})
	sets.DT.Aegis = set_combine(sets.PDT.Aegis,{})
	sets.DT.Priwen = set_combine(sets.PDT.Priwen,{})

	-- Weakness/Kiting/Repulse Sets --
	sets.Weakness = {}
	sets.Weakness.Ochain = set_combine(sets.PDT.Ochain,{})
	sets.Weakness.Aegis = set_combine(sets.PDT.Aegis,{})
	sets.Weakness.Priwen = set_combine(sets.PDT.Priwen,{})

	sets.Kiting = {}
	sets.Kiting.Ochain = set_combine(sets.PDT.Ochain,{legs="Blood Cuisses"})
	sets.Kiting.Aegis = set_combine(sets.PDT.Aegis,{legs="Blood Cuisses"})
	sets.Kiting.Priwen = set_combine(sets.PDT.Priwen,{legs="Blood Cuisses"})

	sets.Repulse = {}
	sets.Repulse.Ochain = {sub="Ochain",back="Repulse Mantle"}
	sets.Repulse.Aegis = {sub="Aegis",back="Repulse Mantle"}
	sets.Repulse.Priwen = {sub="Priwen",back="Repulse Mantle"}

	-- Hybrid/Shield Skill Sets --
	sets.TP.Hybrid = {}
	sets.TP.Hybrid.MidACC = set_combine(sets.TP.Hybrid,{})
	sets.TP.Hybrid.HighACC = set_combine(sets.TP.Hybrid.MidACC,{})

	sets.TP.ShieldSkill = {}

	-- WS Base Set --
	sets.WS = {}

	-- Chant du Cygne Sets --
	sets.WS["Chant du Cygne"] = {}
	sets.WS["Chant du Cygne"].MidACC = set_combine(sets.WS["Chant du Cygne"],{})
	sets.WS["Chant du Cygne"].HighACC = set_combine(sets.WS["Chant du Cygne"].MidACC,{})

	-- Requiescat Sets --
	sets.WS.Requiescat = {}
	sets.WS.Requiescat.MidACC = set_combine(sets.WS.Requiescat,{})
	sets.WS.Requiescat.HighACC = set_combine(sets.WS.Requiescat.MidACC,{})

	-- Resolution Sets --
	sets.WS.Resolution = {}
	sets.WS.Resolution.MidACC = set_combine(sets.WS.Resolution,{})
	sets.WS.Resolution.HighACC = set_combine(sets.WS.Resolution.MidACC,{})

	-- Atonement Set --
	sets.WS.Atonement = {}

	-- Knights of Round Set --
	sets.WS["Knights of Round"] = {}

	-- Sanguine Blade Set --
	sets.WS["Sanguine Blade"] = {}

	-- Aeolian Edge Set --
	sets.WS["Aeolian Edge"] = {}

	-- Enmity Set --
	sets.Enmity = {}

	-- JA Sets --
	sets.JA = {}
	sets.JA["Shield Bash"] = set_combine(sets.Enmity,{ear1="Knightly earring",ring2="Fenian Ring"})
	sets.JA.Sentinel = set_combine(sets.Enmity,{feet="Cab. Leggings +1"})
	sets.JA["Holy Circle"] = set_combine(sets.Enmity,{feet="Rev. Leggings +1"})
	sets.JA["Divine Emblem"] = set_combine(sets.Enmity,{feet="Chev. Sabatons +1"})
	sets.JA.Fealty = set_combine(sets.Enmity,{body="Cab. Surcoat +1"})
	sets.JA.Invincible = set_combine(sets.Enmity,{legs="Cab. Breeches +1"})
	sets.JA.Palisade = set_combine(sets.Enmity)
	sets.JA.Provoke = set_combine(sets.Enmity)
	sets.JA.Warcry = set_combine(sets.Enmity)
	sets.JA.Souleater = set_combine(sets.Enmity)
	sets.JA["Last Resort"] = set_combine(sets.Enmity)
	sets.JA.Vallation = set_combine(sets.Enmity)
	sets.JA.Swordplay = set_combine(sets.Enmity)
	sets.JA.Pflug = set_combine(sets.Enmity)

	-- Chivalry Set --
	sets.JA.Chivalry = {
			hands="Cab. Gauntlets +1"}

	-- Rampart Set --
	sets.JA.Rampart = {
			head="Cab. Coronet +1"}

	-- Precast Cover Set: Add Gear To Increase Duration --
	sets.JA.Cover = {
			head="Rev. Coronet +1"}

	-- Gear Worn During Cover: Set ON or OFF At The Top --
	sets.Cover = {
			head="Rev. Coronet +1",
			body="Cab. Surcoat +1"}

	-- Sublimation --
	sets.Sublimation = {}

	-- Flourish --
	sets.Flourish = {}

	-- Step --
	sets.Step = {}

	-- Waltz --
	sets.Waltz = {}

	sets.Precast = {}
	--Fastcast Set --
	sets.Precast.FastCast = {}

	-- Precast Enhancing Magic --
	sets.Precast['Enhancing Magic'] = set_combine(sets.Precast.FastCast,{waist="Siegel Sash"})

	-- Precast Cure Set --
	sets.Precast.Cure = set_combine(sets.Precast.FastCast,{})

	-- Precast Self Cure Set: Use -HP Gear For Cure Cheat --
	sets.Precast.SelfCure = set_combine(sets.Precast.FastCast,{})

	-- Midcast Base Set --
	sets.Midcast = {}

	-- Spells Recast --
	sets.Midcast.Recast = {}

	-- Divine Magic --
	sets.Midcast['Divine Magic'] = set_combine(sets.Midcast.Recast,{
			ear2="Divine Earring",
			neck="Divine Torque",
			body="Rev. Surcoat +1",
			back="Altruistic Cape",
			waist="Bishop's Sash"})

	-- Enlight Set --
	sets.Midcast.Enlight = set_combine(sets.Midcast['Divine Magic'],{})

	-- Banish Set --
	sets.Midcast.Banish = set_combine(sets.Midcast['Divine Magic'],{
			ring1="Fenian Ring"})

	-- Holy Set --
	sets.Midcast.Holy = set_combine(sets.Midcast['Divine Magic'],{})

	-- Cure Set --
	sets.Midcast.Cure = {
			neck="Phalaina Locket",
			ear1="Nourish. Earring +1",
			ear2="Nourish. Earring",
			hands="Macabre Gaunt. +1",
			back="Fierabras's Mantle"}

	-- Self Cure Set: Use +HP Gear For Cure Cheat --
	sets.Midcast.SelfCure = set_combine(sets.Midcast.Cure,{})

	-- Flash Set --
	sets.Midcast.Flash = {}

	-- Enhancing Magic --
	sets.Midcast['Enhancing Magic'] = {
			neck="Colossus's Torque",
			back="Merciful Cape",
			waist="Olympus Sash",
			legs="Rev. Breeches +1"}

	-- Stoneskin --
	sets.Midcast.Stoneskin =  set_combine(sets.Midcast['Enhancing Magic'],{
			neck="Stone Gorget",
			ear2="Earthcry Earring",
			hands="Stone Mufflers",
			waist="Siegel Sash",
			legs="Haven Hose"})

	-- Phalanx --
	sets.Midcast.Phalanx =  set_combine(sets.Midcast['Enhancing Magic'],{})

	-- Reprisal --
	sets.Midcast.Reprisal = {}
end

function pretarget(spell,action)
	if midaction() then
		canceled = true
		return
	elseif spell.action_type == 'Magic' and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
	elseif spell.action_type == 'Magic' and buffactive.doom then -- Auto use holy waters if doomed --
		calcen_spell()
		send_Command('input /item "Holy Water" <me>')
	elseif spell.type == "WeaponSkill" and spell.target.distance > target_distance and player.status == 'Engaged' then -- Cancel WS If You Are Out Of Range --
		cancel_spell()
		add_to_chat(123, spell.name..' Canceled: [Out of Range]')
		return
	elseif spell.english:ifind("Cure") and player.mp<actualCost(spell.mp_cost) then
		degrade_spell(spell,Cure_Spells)
	elseif spell.english == "Berserk" and buffactive.Berserk then -- Cancel Berserk If Berserk Is On --
		send_command('cancel Berserk')
	elseif spell.english == "Defender" and buffactive.Defender then -- Cancel Defender If Defender Is On --
		send_command('cancel Defender')
	elseif spell.english == "Souleater" and buffactive.Souleater then -- Cancel Souleater If Souleater Is On --
		send_command('cancel Souleater')
	elseif spell.english == "Last Resort" and buffactive["Last Resort"] then -- Cancel Last Resort If Last Resort Is On --
		send_command('cancel Last Resort')
	elseif buffactive['Light Arts'] or buffactive['Addendum: White'] then
		if spell.english == "Light Arts" and not buffactive['Addendum: White'] then
			cancel_spell()
			send_command('input /ja Addendum: White <me>')
		elseif spell.english == "Manifestation" then
			cancel_spell()
			send_command('input /ja Accession <me>')
		elseif spell.english == "Alacrity" then
			cancel_spell()
			send_command('input /ja Celerity <me>')
		elseif spell.english == "Parsimony" then
			cancel_spell()
			send_command('input /ja Penury <me>')
		end
	elseif buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
		if spell.english == "Dark Arts" and not buffactive['Addendum: Black'] then
			cancel_spell()
			send_command('input /ja Addendum: Black <me>')
		elseif spell.english == "Accession" then
			cancel_spell()
			send_command('input /ja Manifestation <me>')
		elseif spell.english == "Celerity" then
			cancel_spell()
			send_command('input /ja Alacrity <me>')
		elseif spell.english == "Penury" then
			cancel_spell()
			send_command('input /ja Parsimony <me>')
		end
	end
end

function precast(spell,action)
	if canceled then
		return
	elseif spell.type == "WeaponSkill" then
		if player.status ~= 'Engaged' then -- Cancel WS If You Are Not Engaged. Can Delete It If You Don't Need It --
			cancel_spell()
			add_to_chat(123,'Unable To Use WeaponSkill: [Disengaged]')
			return
		else
			equipSet = sets.WS
			if equipSet[spell.english] then
				equipSet = equipSet[spell.english]
			end
			if equipSet[AccArray[AccIndex]] then
				equipSet = equipSet[AccArray[AccIndex]]
			end
			if elements[spell.name] and elements[spell.name]:contains(world.day_element) then
				equipSet = set_combine(equipSet,elements.equip)
			end
			if buffactive['Reive Mark'] then -- Equip Ygnas's Resolve +1 During Reive --
				equipSet = set_combine(equipSet,{neck="Ygnas's Resolve +1"})
			end
			if TypeIndex == 1 and spell.english == "Chant du Cygne" then
				if world.time <= (7*60) or world.time >= (17*60) then -- Equip Lugra Earring +1 & Lugra Earring From Dusk To Dawn --
					equipSet = set_combine(equipSet,{ear1="Lugra Earring +1",ear2="Lugra Earring"})
				elseif player.tp > 2990 then -- Equip Jupiter's Pearl When You Have 3000 TP --
					equipSet = set_combine(equipSet,{ear1="Jupiter's Pearl"})
				end
			end
			if TypeIndex == 1 and spell.english == "Resolution" and player.tp > 2990 then
				if world.time <= (7*60) or world.time >= (17*60) then -- Equip Lugra Earring +1 From Dusk To Dawn --
					equipSet = set_combine(equipSet,{ear1="Lugra Earring +1"})
				else
					equipSet = set_combine(equipSet,{ear1="Kokou's Earring"}) -- Equip Kokou's Earring When You Have 3000 TP --
				end
			end
			equip(equipSet)
		end
	elseif spell.type == "JobAbility" or spell.type == "Ward" or spell.type == "Effusion" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	elseif spell.type == "Rune" then
		equip(sets.Enmity)
	elseif spell.action_type == 'Magic' then
		if buffactive.silence or spell.target.distance > 16+target_distance then -- Cancel Magic or Ninjutsu If You Are Silenced or Out of Range --
			cancel_spell()
			add_to_chat(123, spell.name..' Canceled: [Silenced or Out of Casting Range]')
			return
		else
			if (spell.english:startswith('Cur') or spell.english == "Wild Carrot" or spell.english == "Healing Breeze") and spell.english ~= "Cursna" then
				if spell.target.name == player.name then
					equip(sets.Precast.SelfCure)
				else
					equip(sets.Precast.Cure)
				end
			elseif spell.english == "Reprisal" then
				if buffactive['Blaze Spikes'] or buffactive['Ice Spikes'] or buffactive['Shock Spikes'] then -- Cancel Blaze Spikes, Ice Spikes or Shock Spikes When You Cast Reprisal --
					cast_delay(0.2)
					send_command('cancel Blaze Spikes,Ice Spikes,Shock Spikes')
				end
				equip(sets.Precast.FastCast)
			elseif spell.english == 'Utsusemi: Ni' then
				if buffactive['Copy Image (3)'] then
					cancel_spell()
					add_to_chat(123, spell.name .. ' Canceled: [3 Images]')
					return
				else
					equip(sets.Precast.FastCast)
				end
			elseif sets.Precast[spell.skill] then
				equip(sets.Precast[spell.skill])
			else
				equip(sets.Precast.FastCast)
			end
		end
	elseif spell.type:endswith('Flourish') then
		if spell.english == "Animated Flourish" then
			equip(sets.Enmity)
		else
			equip(sets.Flourish)
		end
	elseif spell.type == "Step" then
		equip(sets.Step)
	elseif spell.type == "Waltz" then
		refine_waltz(spell,action)
		equip(sets.Waltz)
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')
	end
	if Twilight == 'Twilight' then
		equip(sets.Twilight)
	end
end

function midcast(spell,action)
	equipSet = {}
	if spell.action_type == 'Magic' then
		equipSet = sets.Midcast
		if equipSet[spell.english] then
			equipSet = equipSet[spell.english]
		elseif (spell.english:startswith('Cur') or spell.english == "Wild Carrot" or spell.english == "Healing Breeze") and spell.english ~= "Cursna" then
			if spell.target.name == player.name then
				equipSet = equipSet.SelfCure
			else
				equipSet = equipSet.Cure
			end
			if world.day_element == spell.element or world.weather_element == spell.element then
				equipSet = set_combine(equipSet,{waist="Hachirin-no-Obi"})
			end
		elseif spell.english:startswith('Protect') or spell.english:startswith('Shell') then
			if spell.target.name == player.name then
				equipSet = set_combine(equipSet,{ring2="Sheltered Ring"})
			end
		elseif spell.english == "Stoneskin" then
			if buffactive.Stoneskin then
				send_command('@wait 1.7;cancel stoneskin')
			end
			equipSet = equipSet.Stoneskin
		elseif spell.english == "Sneak" then
			if spell.target.name == player.name and buffactive['Sneak'] then
				send_command('cancel sneak')
			end
			equipSet = equipSet.Recast
		elseif spell.english:startswith('Enlight') then
			equipSet = equipSet.Enlight
		elseif spell.english:startswith('Banish') then
			equipSet = equipSet.Banish
			if world.day_element == spell.element or world.weather_element == spell.element then
				equipSet = set_combine(equipSet,{waist="Hachirin-no-Obi"})
			end
		elseif spell.english:startswith('Holy') then
			equipSet = equipSet.Holy
			if world.day_element == spell.element or world.weather_element == spell.element then
				equipSet = set_combine(equipSet,{waist="Hachirin-no-Obi"})
			end
		elseif Enmity_BlueMagic:contains(spell.english) or spell.english == "Stun" or spell.english:startswith('Absorb') or spell.english == 'Aspir' or spell.english == 'Drain' then
			if buffactive.Sentinel then
				equipSet = equipSet.Recast
			else
				equipSet = equipSet.Flash
			end
		elseif spell.english:endswith('Spikes') then
			equipSet = equipSet.Recast
		elseif spell.english:startswith('Utsusemi') then
			if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)']) then
				send_command('@wait 1.7;cancel Copy Image*')
			end
			equipSet = equipSet.Recast
		elseif spell.english == 'Monomi: Ichi' then
			if buffactive['Sneak'] then
				send_command('@wait 1.7;cancel sneak')
			end
			equipSet = equipSet.Recast
		elseif equipSet[spell.skill] then
			equipSet = equipSet[spell.skill]
		end
	elseif equipSet[spell.english] then
		equipSet = equipSet[spell.english]
	end
	equip(equipSet)
end

function aftercast(spell,action)
	if canceled then
		canceled = false
		return
	else
		if not spell.interrupted then
			if spell.type == "WeaponSkill" then
				send_command('wait 0.2;gs c TP')
			elseif spell.english == "Banish II" then -- Banish II Countdown --
				send_command('@wait 20;input /echo Banish Effect: [WEARING OFF IN 10 SEC.]')
			elseif spell.english == "Holy Circle" then -- Holy Circle Countdown --
				send_command('wait 260;input /echo '..spell.name..': [WEARING OFF IN 10 SEC.];wait 10;input /echo '..spell.name..': [OFF]')
			end
		end
		status_change(player.status)
	end
end

function status_change(new,old)
	check_equip_lock()
	if Armor == 'PDT' then
		equip(sets.PDT[ShieldArray[ShieldIndex]])
	elseif Armor == 'MDT' then
		equip(sets.MDT[ShieldArray[ShieldIndex]])
	elseif Armor == 'Kiting' then
		equip(sets.Kiting[ShieldArray[ShieldIndex]])
	elseif Armor == 'Weakness' then
		equip(sets.Weakness[ShieldArray[ShieldIndex]])
	elseif Armor == 'DT' then
		equip(sets.DT[ShieldArray[ShieldIndex]])
	elseif buffactive.Cover and Cover == 'ON' then
		equip(sets.Cover)
	elseif buffactive["Sublimation: Activated"] then
		equip(sets.Sublimation)
	elseif new == 'Engaged' then
		equipSet = sets.TP
		if Armor == 'Hybrid' and equipSet["Hybrid"] then
			equipSet = equipSet["Hybrid"]
		end
		if equipSet[player.equipment.main] then
			equipSet = equipSet[player.equipment.main]
		end
		if equipSet[ShieldArray[ShieldIndex]] then
			equipSet = equipSet[ShieldArray[ShieldIndex]]
		end
		if equipSet[AccArray[AccIndex]] then
			equipSet = equipSet[AccArray[AccIndex]]
		end
		if buffactive.Ionis and equipSet["Ionis"] then
			equipSet = equipSet["Ionis"]
		end
		if Armor == 'ShieldSkill' then
			equipSet = set_combine(equipSet,sets.TP.ShieldSkill)
		end
		equip(equipSet)
	elseif new == 'Idle' then
		equipSet = sets.Idle
		if equipSet[IdleArray[IdleIndex]] then
			equipSet = equipSet[IdleArray[IdleIndex]]
		end
		if equipSet[ShieldArray[ShieldIndex]] then
			equipSet = equipSet[ShieldArray[ShieldIndex]]
		end
		if buffactive['Reive Mark'] then -- Equip Ygnas's Resolve +1 During Reive --
			equipSet = set_combine(equipSet,{neck="Ygnas's Resolve +1"})
		end
		if world.area:endswith('Adoulin') then
			equipSet = set_combine(equipSet,{body="Councilor's Garb"})
		end
		equip(equipSet)
	elseif new == 'Resting' then
		equip(sets.Resting)
	end
	if Repulse == 'ON' then -- Use Repulse Toggle To Lock Repulse Mantle --
		equip(sets.Repulse[ShieldArray[ShieldIndex]])
	end
	if Twilight == 'Twilight' then
		equip(sets.Twilight)
	end
end

function buff_change(buff,gain)
	buff = string.lower(buff)
	if buff == "aftermath: lv.3" then -- AM3 Timer/Countdown --
		if gain then
			send_command('timers create "Aftermath: Lv.3" 180 down;wait 150;input /echo Aftermath: Lv.3 [WEARING OFF IN 30 SEC.];wait 15;input /echo Aftermath: Lv.3 [WEARING OFF IN 15 SEC.];wait 5;input /echo Aftermath: Lv.3 [WEARING OFF IN 10 SEC.]')
		else
			send_command('timers delete "Aftermath: Lv.3"')
			add_to_chat(123,'AM3: [OFF]')
		end
	elseif buff == 'weakness' then -- Weakness Timer --
		if gain then
			send_command('timers create "Weakness" 300 up')
		else
			send_command('timers delete "Weakness"')
		end
	end
	if buff == "sleep" and gain and player.hp > 200 and player.status == "Engaged" then -- Equip Berserker's Torque When You Are Asleep & Have 200+ HP --
		equip({neck="Berserker's Torque"})
	else
		if not midaction() then
			status_change(player.status)
		end
	end
end

-- In Game: //gs c (command), Macro: /console gs c (command), Bind: gs c (command) --
function self_command(command)
	if command == 'C1' then -- Accuracy Level Toggle --
		AccIndex = (AccIndex % #AccArray) + 1
		status_change(player.status)
		add_to_chat(158,'Accuracy Level: '..AccArray[AccIndex])
	elseif command == 'C5' then -- Auto Update Gear Toggle --
		status_change(player.status)
		add_to_chat(158,'Auto Update Gear')
	elseif command == 'C2' then -- Shield Type Toggle --
		ShieldIndex = (ShieldIndex % #ShieldArray) + 1
		status_change(player.status)
		add_to_chat(158,'Shield Type: '..ShieldArray[ShieldIndex])
	elseif command == 'C9' then -- Hybrid Toggle --
		if Armor == 'Hybrid' then
			Armor = 'None'
			add_to_chat(123,'Hybrid Set: [Unlocked]')
		else
			Armor = 'Hybrid'
			add_to_chat(158,'Hybrid Set: '..AccArray[AccIndex])
		end
		status_change(player.status)
	elseif command == 'C7' then -- PDT Toggle --
		if Armor == 'PDT' then
			Armor = 'None'
			add_to_chat(123,'PDT Set: [Unlocked]')
		else
			Armor = 'PDT'
			add_to_chat(158,'PDT Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C15' then -- MDT Toggle --
		if Armor == 'MDT' then
			Armor = 'None'
			add_to_chat(123,'MDT Set: [Unlocked]')
		else
			Armor = 'MDT'
			add_to_chat(158,'MDT Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C12' then -- Kiting Toggle --
		if Armor == 'Kiting' then
			Armor = 'None'
			add_to_chat(123,'Kiting Set: [Unlocked]')
		else
			Armor = 'Kiting'
			add_to_chat(158,'Kiting Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C10' then -- Weakness Set Toggle --
		if Armor == 'Weakness' then
			Armor = 'None'
			add_to_chat(123,'Weakness Set: [Unlocked]')
		else
			Armor = 'Weakness'
			add_to_chat(158,'Weakness Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C17' then -- DT Toggle --
		if Armor == 'DT' then
			Armor = 'None'
			add_to_chat(123,'DT Set: [Unlocked]')
		else
			Armor = 'DT'
			add_to_chat(158,'DT Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C16' then -- Repulse Mantle Toggle --
		if Repulse == 'ON' then
			Repulse = 'OFF'
			add_to_chat(123,'Repulse Mantle: [Unlocked]')
		else
			Repulse = 'ON'
			add_to_chat(158,'Repulse Mantle: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C11' then -- Shield Skill Toggle --
		if Armor == 'ShieldSkill' then
			Armor = 'None'
			add_to_chat(123,'Shield Skill Set: [Unlocked]')
		else
			Armor = 'ShieldSkill'
			add_to_chat(158,'Shield Skill Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C3' then -- Twilight Toggle --
		if Twilight == 'Twilight' then
			Twilight = 'None'
			add_to_chat(123,'Twilight Set: [Unlocked]')
		else
			Twilight = 'Twilight'
			add_to_chat(158,'Twilight Set: [locked]')
		end
		status_change(player.status)
	elseif command == 'C8' then -- Distance Toggle --
		if player.target.distance then
			target_distance = math.floor(player.target.distance*10)/10
			add_to_chat(158,'Distance: '..target_distance)
		else
			add_to_chat(123,'No Target Selected')
		end
	elseif command == 'C6' then -- Idle Toggle --
		IdleIndex = (IdleIndex % #IdleArray) + 1
		status_change(player.status)
		add_to_chat(158,'Idle Set: '..IdleArray[IdleIndex])
	elseif command == 'TP' then
		add_to_chat(158,'TP Return: ['..tostring(player.tp)..']')
	elseif command:match('^SC%d$') then
		send_command('//' .. sc_map[command])
	end
end

function check_equip_lock() -- Lock Equipment Here --
	if player.equipment.left_ring == "Warp Ring" or player.equipment.left_ring == "Capacity Ring" or player.equipment.right_ring == "Warp Ring" or player.equipment.right_ring == "Capacity Ring" then
		disable('ring1','ring2')
	elseif player.equipment.back == "Mecisto. Mantle" or player.equipment.back == "Aptitude Mantle +1" or player.equipment.back == "Aptitude Mantle" then
		disable('back')
	elseif player.equipment.main == "Ragnarok" then
		disable('main','sub')
	else
		enable('main','sub','ring1','ring2','back')
	end
end

function actualCost(originalCost)
	if buffactive["Penury"] then
		return originalCost*.5
	elseif buffactive["Light Arts"] or buffactive["Addendum: White"] then
		return originalCost*.9
	elseif buffactive["Dark Arts"] or buffactive["Addendum: Black"] then
		return originalCost*1.1
	else
		return originalCost
	end
end

function degrade_spell(spell,degrade_array)
	spell_index = table.find(degrade_array,spell.name)
	if spell_index > 1 then
		new_spell = degrade_array[spell_index - 1]
		change_spell(new_spell,spell.target.raw)
		add_to_chat(8,spell.name..' Canceled: ['..player.mp..'/'..player.max_mp..'MP::'..player.mpp..'%] Casting '..new_spell..' instead.')
	end
end

function change_spell(spell_name,target)
	cancel_spell()
	send_command('//'..spell_name..' '..target)
end

function refine_waltz(spell,action)
	if spell.type ~= 'Waltz' then
		return
	end

	if spell.name == "Healing Waltz" or spell.name == "Divine Waltz" then
		return
	end

	local newWaltz = spell.english
	local waltzID

	local missingHP

	if spell.target.type == "SELF" then
		missingHP = player.max_hp - player.hp
	elseif spell.target.isallymember then
		local target = find_player_in_alliance(spell.target.name)
		local est_max_hp = target.hp / (target.hpp/100)
		missingHP = math.floor(est_max_hp - target.hp)
	end

	if missingHP ~= nil then
		if player.sub_job == 'DNC' then
			if missingHP < 40 and spell.target.name == player.name then
				add_to_chat(123,'Full HP!')
				cancel_spell()
				return
			elseif missingHP < 150 then
				newWaltz = 'Curing Waltz'
				waltzID = 190
			elseif missingHP < 300 then
				newWaltz = 'Curing Waltz II'
				waltzID = 191
			else
				newWaltz = 'Curing Waltz III'
				waltzID = 192
			end
		else
			return
		end
	end

	local waltzTPCost = {['Curing Waltz'] = 20, ['Curing Waltz II'] = 35, ['Curing Waltz III'] = 50}
	local tpCost = waltzTPCost[newWaltz]

	local downgrade

	if player.tp < tpCost then

		if player.tp < 20 then
			add_to_chat(123, 'Insufficient TP ['..tostring(player.tp)..']. Cancelling.')
			cancel_spell()
			return
		elseif player.tp < 35 then
			newWaltz = 'Curing Waltz'
		elseif player.tp < 50 then
			newWaltz = 'Curing Waltz II'
		end

		downgrade = 'Insufficient TP ['..tostring(player.tp)..']. Downgrading to '..newWaltz..'.'
	end

	if newWaltz ~= spell.english then
		send_command('@input /ja "'..newWaltz..'" '..tostring(spell.target.raw))
		if downgrade then
			add_to_chat(8, downgrade)
		end
		cancel_spell()
		return
	end

	if missingHP > 0 then
		add_to_chat(8,'Trying to cure '..tostring(missingHP)..' HP using '..newWaltz..'.')
	end
end

function find_player_in_alliance(name)
	for i,v in ipairs(alliance) do
		for k,p in ipairs(v) do
			if p.name == name then
				return p
			end
		end
	end
end

function sub_job_change(newSubjob, oldSubjob)
	select_default_macro_book()
end

function set_macro_page(set,book)
	if not tonumber(set) then
		add_to_chat(123,'Error setting macro page: Set is not a valid number ('..tostring(set)..').')
		return
	end
	if set < 1 or set > 10 then
		add_to_chat(123,'Error setting macro page: Macro set ('..tostring(set)..') must be between 1 and 10.')
		return
	end

	if book then
		if not tonumber(book) then
			add_to_chat(123,'Error setting macro page: book is not a valid number ('..tostring(book)..').')
			return
		end
		if book < 1 or book > 20 then
			add_to_chat(123,'Error setting macro page: Macro book ('..tostring(book)..') must be between 1 and 20.')
			return
		end
		send_command('@input /macro book '..tostring(book)..';wait .1;input /macro set '..tostring(set))
	else
		send_command('@input /macro set '..tostring(set))
	end
end

function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'WAR' then
		set_macro_page(1, 6)
	elseif player.sub_job == 'DRK' then
		set_macro_page(9, 6)
	elseif player.sub_job == 'NIN' then
		set_macro_page(10, 6)
	elseif player.sub_job == 'BLU' then
		set_macro_page(2, 6)
	elseif player.sub_job == 'DNC' then
		set_macro_page(3, 6)
	elseif player.sub_job == 'RDM' then
		set_macro_page(8, 6)
	elseif player.sub_job == 'WHM' then
		set_macro_page(7, 6)
	else
		set_macro_page(1, 6)
	end
end
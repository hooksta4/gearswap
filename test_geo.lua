-- *** Credit goes to Flippant for helping me with Gearswap *** --
-- ** I Use Motenten's Macro Book Function ** --

function get_sets()
	AccIndex = 1
	AccArray = {"LowACC","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For Magic. Default ACC Set Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below --
	IdleIndex = 1
	IdleArray = {"Movement","Refresh","Luopan"} -- Default Idle Set Is Movement --
	Armor = 'None'
	StunIndex = 0
	Lock_Main = 'OFF' -- Set Default Lock Main Weapon ON or OFF Here --
	Obi = 'ON' -- Set Default Obi ON or OFF Here --
	Elemental_Staff = 'ON' -- Set Default Precast Elemental Staff ON or OFF Here --
	LowNuke = 'ON' -- Set Default Low Tier Nuke ON or OFF Here --
	MB = 'OFF' -- Set Default MB ON or OFF Here --
	target_distance = 5 -- Set Default Distance Here --
	define_geomancy_values()
	select_default_macro_book() -- Change Default Macro Book At The End --

	Cure_Spells = {"Cure","Cure II","Cure III","Cure IV"} -- Cure Degradation --
	Curaga_Spells = {"Curaga","Curaga II"} -- Curaga Degradation --
	sc_map = {SC1 = "GeoTorpor", SC2 = "GeoLanguor", SC3 = "IndiFocus"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	-- Add or Remove Low Tier Spells Here --
	Low_Tier_Spells = S{
			'Fire','Aero','Water','Blizzard','Stone','Thunder','Fire II','Aero II','Water II',
			'Blizzard II','Stone II','Thunder II'}

	Non_Obi_Spells = S{
			'Burn','Choke','Drown','Frost','Rasp','Shock','Impact','Anemohelix','Cryohelix',
			'Geohelix','Hydrohelix','Ionohelix','Luminohelix','Noctohelix','Pyrohelix'}

	Cities = S{
			"Ru'lude Gardens","Upper Jeuno","Lower Jeuno","Port Jeuno",
			"Port Windurst","Windurst Waters","Windurst Woods","Windurst Walls","Heavens Tower",
			"Port San d'Oria","Northern San d'Oria","Southern San d'Oria",
			"Port Bastok","Bastok Markets","Bastok Mines","Metalworks",
			"Aht Urhgan Whitegate","Nashmau","Tavanazian Safehold",
			"Selbina","Mhaura","Norg","Eastern Adoulin","Western Adoulin","Kazham"}

	sets.Idle = {}

	-- Idle Sets --
	sets.Idle.Refresh = {}
	sets.Idle.Movement =  set_combine(sets.Idle.Refresh,{
			feet="Geo. Sandals +1"})

	-- Luopan Idle Set --
	sets.Idle.Luopan =  set_combine(sets.Idle.Refresh,{
			main="Idris",
			sub="Genbu's Shield",
			neck="Twilight Torque",
			hands="Geo. Mitaines +1",
			ring1="Defending Ring",
			ring2="Dark Ring",
			back="Lifestream Cape",
			feet="Bagua Sandals +1"})
			
	sets.Resting = set_combine(sets.Idle.Movement,{})

	-- PDT Set --
	sets.PDT = {}

	-- Sublimation Set --
	sets.Sublimation = {}

	sets.Precast = {}
	-- FastCast Set --
	sets.Precast.FastCast = {
			sub=empty}

	-- Geomancy Precast (empty = To Fix Club/Staff Issue) --
	sets.Precast.GeoCast = {
			sub=empty,
			range=empty,
			ammo="Impatiens",
			hands="Geo. Mitaines +2",
			back="Lifestream Cape",
			legs="Geo. Pants +1"}

	-- Elemental Staves --
	sets.Precast.Lightning = {main='Apamajas I'}
	sets.Precast.Water = {main='Haoma I'}
	sets.Precast.Fire = {main='Atar I'}
	sets.Precast.Ice = {main='Vourukasha I'}
	sets.Precast.Wind = {main='Vayuvata I'}
	sets.Precast.Earth = {main='Vishrava I'}
	sets.Precast.Light = {main='Arka I'}
	sets.Precast.Dark = {main='Xsaeta I'}

	-- Precast Enhancing Magic --
	sets.Precast['Enhancing Magic'] = set_combine(sets.Precast.FastCast,{waist="Siegel Sash"})

	-- Precast Elemental Magic --
	sets.Precast['Elemental Magic'] = set_combine(sets.Precast.FastCast,{hands="Bagua Mitaines +1"})

	-- Precast Cure Set --
	sets.Precast.Cure = {
			sub=empty}

	-- Midcast Base Set --
	sets.Midcast = {}

	-- Midcast Geocolure Set --
	sets.Midcast.Geocolure = {
			main="Idris",
			sub="Genbu's Shield",
			range="Dunna",
			ammo=empty,
			body="Bagua Tunic +1",
			hands="Geo. Mitaines +2",
			back="Lifestream Cape"}

	-- Midcast Indicolure Set --
	sets.Midcast.Indicolure = set_combine(sets.Midcast.Geocolure,{
			legs="Bagua Pants +1",
			feet="Azimuth Gaiters +1"})

	-- Cure Set --
	sets.Midcast.Cure = {}

	-- Curaga Set --
	sets.Midcast.Curaga = {}

	-- Haste Set --
	sets.Midcast.Haste = {}

	-- Enhancing Set --
	sets.Midcast['Enhancing Magic'] = {}

	-- Stoneskin Set --
	sets.Midcast.Stoneskin = set_combine(sets.Midcast['Enhancing Magic'],{})

	-- Cursna Set --
	sets.Midcast.Cursna = set_combine(sets.Midcast.Haste,{})

	-- Stun Sets --
	sets.Midcast.Stun = {}
	sets.Midcast.Stun.MidACC = set_combine(sets.Midcast.Stun,{})
	sets.Midcast.Stun.HighACC = set_combine(sets.Midcast.Stun.MidACC,{})

	-- Dark Magic Sets --
	sets.Midcast['Dark Magic'] = {}
	sets.Midcast['Dark Magic'].MidACC = set_combine(sets.Midcast['Dark Magic'],{})
	sets.Midcast['Dark Magic'].HighACC = set_combine(sets.Midcast['Dark Magic'].MidACC,{})

	-- Aspir Set --
	sets.Midcast.Aspir = {}

	-- Drain Set --
	sets.Midcast.Drain = {}

	-- Low Tier Set --
	sets.LowNuke = {}

	-- MB Set --
	sets.MB = {}

	-- Elemental Sets --
	sets.Midcast['Elemental Magic'] = {}
	sets.Midcast['Elemental Magic'].MidACC = set_combine(sets.Midcast['Elemental Magic'],{})
	sets.Midcast['Elemental Magic'].HighACC = set_combine(sets.Midcast['Elemental Magic'].MidACC,{})

	-- Enfeebling Sets --
	sets.Midcast['Enfeebling Magic'] = {}
	sets.Midcast['Enfeebling Magic'].MidACC =  set_combine(sets.Midcast['Enfeebling Magic'],{})
	sets.Midcast['Enfeebling Magic'].HighACC = set_combine(sets.Midcast['Enfeebling Magic'].MidACC,{})

	-- Impact Set --
	sets.Midcast.Impact = {
			body="Twilight Cloak"}

	-- Elemental Obi/Twilight Cape --
	sets.Obi = {}
	sets.Obi.Lightning = {back="Twilight Cape",waist='Hachirin-no-Obi'}
	sets.Obi.Water = {back="Twilight Cape",waist='Hachirin-no-Obi'}
	sets.Obi.Fire = {back="Twilight Cape",waist='Hachirin-no-Obi'}
	sets.Obi.Ice = {back="Twilight Cape",waist='Hachirin-no-Obi'}
	sets.Obi.Wind = {back="Twilight Cape",waist='Hachirin-no-Obi'}
	sets.Obi.Earth = {back="Twilight Cape",waist='Hachirin-no-Obi'}
	sets.Obi.Light = {back="Twilight Cape",waist='Hachirin-no-Obi'}
	sets.Obi.Dark = {back="Twilight Cape",waist='Hachirin-no-Obi'}

	-- JA Sets --
	sets.JA = {}
	sets.JA['Life Cycle'] = {body="Geo. Tunic +1"}
	sets.JA.Bolster = {body="Bagua Tunic +1"}
	sets.JA['Radial Arcana'] = {feet="Bagua Sandals +1"}
	sets.JA['Mending Halation'] = {feet="Bagua Pants +1"}

	-- Melee Set --
	sets.Melee = set_combine(sets.Midcast.Haste,{})

	-- WS Base Set --
	sets.WS = {}

	sets.WS.Exudation = {}
	sets.WS["Hexa Strike"] = {}
	sets.WS.Realmrazer = {}
	sets.WS.Shattersoul = {}

	-- Idle Reive Set --
	sets.Reive = {neck="Arciela's Grace +1"}
end

function pretarget(spell,action)
	if spell.action_type == 'Magic' and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
	elseif spell.type == "WeaponSkill" and spell.target.distance > target_distance and player.status == 'Engaged' then -- Cancel WS If You Are Out Of Range --
		cancel_spell()
		add_to_chat(123, spell.name..' Canceled: [Out of Range]')
		return
	elseif spell.english:ifind("Cure") and player.mp<actualCost(spell.mp_cost) then
		degrade_spell(spell,Cure_Spells)
	elseif spell.english:ifind("Curaga") and player.mp<actualCost(spell.mp_cost) then
		degrade_spell(spell,Curaga_Spells)
	elseif spell.english:startswith('Geo') and pet.isvalid then -- Change Any Geo Spells To Full Circle If You Have A Luopan Active --
		cancel_spell()
		send_command('input /ja "Full Circle" <me>')
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
	if spell.action_type == 'Magic' then
		if buffactive.silence or spell.target.distance > 16+target_distance then -- Cancel Magic or Ninjutsu If You Are Silenced or Out of Range --
			cancel_spell()
			add_to_chat(123, spell.name..' Canceled: [Silenced or Out of Casting Range]')
			return
		else
			if spell.type == "Geomancy" then
				if Cities:contains(world.area) then
					cancel_spell()
					add_to_chat(123,'Unable To Use Geomancy In Town')
					return
				else
					display_geomancy_info(spell)
					equip(sets.Precast.GeoCast)
				end
			elseif spell.english:startswith('Cur') and spell.english ~= "Cursna" then
				equip(sets.Precast.Cure)
			elseif spell.english == "Impact" then
				equip(set_combine(sets.Precast.FastCast,{body="Twilight Cloak"}))
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
	elseif spell.type == "WeaponSkill" then
		if player.status ~= 'Engaged' then -- Cancel WS If You Are Not Engaged. Can Delete It If You Don't Need It --
			cancel_spell()
			add_to_chat(123,'Unable To Use WeaponSkill: [Disengaged]')
			return
		else
			if sets.WS[spell.english] then
				equip(sets.WS[spell.english])
			end
		end
	elseif spell.type == "JobAbility" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')
	end
	if sets.Precast[spell.element] and Elemental_Staff == 'ON' then
		equip(sets.Precast[spell.element])
	end
	if StunIndex == 1 then
		equip(sets.Midcast.Stun)
	end
end

function midcast(spell,action)
	equipSet = {}
	if spell.action_type == 'Magic' then
		equipSet = sets.Midcast
		if spell.type == "Geomancy" then
			if spell.english:startswith('Indi') then
				equipSet = equipSet.Indicolure
			else
				equipSet = equipSet.Geocolure
			end
		elseif spell.english:startswith('Cur') and spell.english ~= "Cursna" then
			if spell.english:startswith('Cure') then
				equipSet = equipSet.Cure
			elseif spell.english:startswith('Cura') then
				equipSet = equipSet.Curaga
			end
			if world.day_element == spell.element or world.weather_element == spell.element then
				equipSet = set_combine(equipSet,{back="Twilight Cape",waist="Hachirin-no-Obi"})
			end
		elseif spell.english:startswith('Banish') then
			equipSet = set_combine(equipSet.Haste,{ring1="Fenian Ring"})
		elseif spell.english == "Stoneskin" then
			if buffactive.Stoneskin then
				send_command('@wait 2.8;cancel stoneskin')
			end
			equipSet = equipSet.Stoneskin
		elseif spell.english == "Sneak" then
			if spell.target.name == player.name and buffactive['Sneak'] then
				send_command('cancel sneak')
			end
			equipSet = equipSet.Haste
		elseif spell.english:startswith('Aspir') then
			equipSet = equipSet.Aspir
		elseif spell.english == "Drain" then
			equipSet = equipSet.Drain
		elseif spell.english:startswith('Utsusemi') then
			if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)']) then
				send_command('@wait 1.7;cancel Copy Image*')
			end
			equipSet = equipSet.Haste
		elseif spell.english == 'Monomi: Ichi' then
			if buffactive['Sneak'] then
				send_command('@wait 1.7;cancel sneak')
			end
			equipSet = equipSet.Haste
		elseif Low_Tier_Spells:contains(spell.english) and LowNuke == 'ON' then
			equipSet = set_combine(equipSet,sets.LowNuke)
		elseif spell.skill == 'Elemental Magic' and MB == 'ON' then
			equipSet = set_combine(equipSet,sets.MB)
		else
			if equipSet[spell.english] then
				equipSet = equipSet[spell.english]
			end
			if equipSet[spell.skill] then
				equipSet = equipSet[spell.skill]
			end
			if equipSet[AccArray[AccIndex]] then
				equipSet = equipSet[AccArray[AccIndex]]
			end
			if equipSet[spell.type] then
				equipSet = equipSet[spell.type]
			end
			if (spell.skill == 'Elemental Magic' or spell.english:startswith('Cur') or spell.english:startswith('Bio') or spell.english:startswith('Dia') or spell.english == 'Aspir' or spell.english == 'Drain') and not Non_Obi_Spells:contains(spell.english) and (world.day_element == spell.element or world.weather_element == spell.element) and sets.Obi[spell.element] and Obi == 'ON' and spell.english ~= "Cursna" then -- Use Obi Toggle To Equip Normal Waist Gear --
				equipSet = set_combine(equipSet,sets.Obi[spell.element])
			end
		end
	elseif equipSet[spell.english] then
		equipSet = equipSet[spell.english]
	end
	equip(equipSet)
	if StunIndex == 1 then
		equip(sets.Midcast.Stun)
	end
end

function aftercast(spell,action)
	if not spell.interrupted then
		if spell.english == "Sleep II" then-- Sleep II Countdown --
			send_command('wait 60;input /echo Sleep Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Sleep Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Sleep Effect: [WEARING OFF IN 5 SEC.]')
		elseif spell.english == "Sleep" or spell.english == "Sleepga" then -- Sleep & Sleepga Countdown --
			send_command('wait 30;input /echo Sleep Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Sleep Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Sleep Effect: [WEARING OFF IN 5 SEC.]')
		elseif spell.english == "Banish II" then -- Banish II Countdown --
			send_command('wait 20;input /echo Banish Effect: [WEARING OFF IN 10 SEC.]')
		end
	end
	status_change(player.status)
end

function status_change(new,old)
	check_equip_lock()
	if Armor == 'PDT' then
		equip(sets.PDT)
	elseif buffactive["Sublimation: Activated"] then
		equip(sets.Sublimation)
	elseif new == 'Engaged' then
		equip(sets.Melee)
	elseif new == 'Idle' then
		equipSet = sets.Idle
		if equipSet[IdleArray[IdleIndex]] then
			equipSet = equipSet[IdleArray[IdleIndex]]
		end
		if buffactive['Reive Mark'] then -- Equip Arciela's Grace +1 During Reive --
			equipSet = set_combine(equipSet,sets.Reive)
		end
		if world.area:endswith('Adoulin') then
			equipSet = set_combine(equipSet,{body="Councilor's Garb"})
		end
		equip(equipSet)
	elseif new == 'Resting' then
		equip(sets.Resting)
	end
	if StunIndex == 1 then
		equip(sets.Midcast.Stun)
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
	if not midaction() then
		status_change(player.status)
	end
end

-- In Game: //gs c (command), Macro: /console gs c (command), Bind: gs c (command) --
function self_command(command)
	if command == 'C1' then -- Magic Accuracy Toggle --
		AccIndex = (AccIndex % #AccArray) + 1
		add_to_chat(158,'Magic Accuracy Level: ' .. AccArray[AccIndex])
		status_change(player.status)
	elseif command == 'C2' then -- Stun Toggle --
		if StunIndex == 1 then
			StunIndex = 0
			add_to_chat(123,'Stun Set: [Unlocked]')
		else
			StunIndex = 1
			add_to_chat(158,'Stun Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C5' then -- Auto Update Gear Toggle --
		status_change(player.status)
		add_to_chat(158,'Auto Update Gear')
	elseif command == 'C3' then -- Obi Toggle --
		if Obi == 'ON' then
			Obi = 'OFF'
			add_to_chat(123,'Obi: [OFF]')
		else
			Obi = 'ON'
			add_to_chat(158,'Obi: [ON]')
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
	elseif command == 'C10' then -- Idris Toggle --
		if Idris == 'ON' then
			Idris = 'OFF'
			add_to_chat(123,'Idris: [OFF]')
		else
			Idris = 'ON'
			add_to_chat(158,'Idris: [ON]')
		end
		status_change(player.status)
	elseif command == 'C15' then -- LowNuke Toggle --
		if LowNuke == 'ON' then
			LowNuke = 'OFF'
			add_to_chat(123,'Low Nuke: [OFF]')
		else
			LowNuke = 'ON'
			add_to_chat(158,'Low Nuke: [ON]')
		end
		status_change(player.status)
	elseif command == 'C9' then -- MB Toggle --
		if MB == 'ON' then
			MB = 'OFF'
			add_to_chat(123,'MB: [OFF]')
		else
			MB = 'ON'
			add_to_chat(158,'MB: [ON]')
		end
		status_change(player.status)
	elseif command == 'C17' then -- Lock Main Weapon Toggle --
		if Lock_Main == 'ON' then
			Lock_Main = 'OFF'
			add_to_chat(123,'Main Weapon: [Unlocked]')
		else
			Lock_Main = 'ON'
			add_to_chat(158,'Main Weapon: [Locked]')
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
		add_to_chat(158,'Idle Set: '..IdleArray[IdleIndex])
		status_change(player.status)
	elseif command:match('^SC%d$') then
		send_command('//' .. sc_map[command])
	end
end

function check_equip_lock() -- Lock Equipment Here --
	if player.equipment.left_ring == "Warp Ring" or player.equipment.left_ring == "Capacity Ring" or player.equipment.right_ring == "Warp Ring" or player.equipment.right_ring == "Capacity Ring" then
		disable('ring1','ring2')
	elseif player.equipment.back == "Mecisto. Mantle" or player.equipment.back == "Aptitude Mantle +1" or player.equipment.back == "Aptitude Mantle" then
		disable('back')
	elseif Lock_Main == 'ON' then
		disable('main','sub')
	else
		enable('main','sub','ring1','ring2','back')
	end
end

function actualCost(originalCost)
	if buffactive["Penury"] then
		return originalCost*.5
	elseif buffactive["Light Arts"] then
		return originalCost*.9
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

function define_geomancy_values()
	geomancy = {
		Frailty = {bonus="Defense Down"},
		Torpor = {bonus="Evasion Down"},
		Languor = {bonus="Magic Evasion Down"},
		Focus = {bonus="Magic Accuracy"},
		Malaise = {bonus="Magic Defense Down"},
		Precision = {bonus="Accuracy"},
		Refresh = {bonus="Refresh"},
		Fade = {bonus="Magic Attack Down"},
		Wilt = {bonus="Attack Down"},
		Vex = {bonus="Magic Accuracy Down"},
		Slip = {bonus="Accuracy Down"},
		Acumen = {bonus="Magic Attack"},
		Fend = {bonus="Magic Defense"},
		Fury = {bonus="Attack"},
		Attunement = {bonus="Magic Evasion"},
		Voidance = {bonus="Evasion"},
		Barrier = {bonus="Defense"},
		Haste = {bonus="Haste"}
		}
end

function display_geomancy_info(spell)
	geoType=nil 
	string.gsub(spell.english.."-","-(.-)-",function(geo) geoType=geo end)
	geoInfo = geomancy[geoType]
	if geoInfo then
		add_to_chat(158, spell.english..' = '..tostring(geoInfo.bonus))
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
	if player.sub_job == 'RDM' then
		set_macro_page(1, 7)
	elseif player.sub_job == 'BLM' then
		set_macro_page(2, 7)
	elseif player.sub_job == 'WHM' then
		set_macro_page(3, 7)
	else
		set_macro_page(1, 7)
	end
end
-- Utility function for automatically adjusting the cure spell being used to match HP needs and MP limits.
-- Handle spell changes before attempting any precast stuff.
function refine_cure(spell, action, spellMap, eventArgs)
    -- Only handles single-target cures.
    if not spell.english:startswith('Cure') then
        return
    end
   
    -- Get the estimated amount of HP the target of the spell is below max.
    -- Returns nil for targets outside of alliance (no info available).
    local missingHP = get_targets_missing_hp(spell)
     
    local preferredCure = spell.english
   
        -- If we have an estimated missing HP value, we can adjust the preferred spell used.
    if missingHP then
        -- Whm has high skill and up to Cure VI
        if player.main_job == 'WHM' then
            if missingHP < 150 then
                preferredCure = 'Cure'
            elseif missingHP < 350 then
                preferredCure = 'Cure II'
            elseif missingHP < 650 then
                preferredCure = 'Cure III'
            elseif missingHP < 1000 then
                preferredCure = 'Cure IV'
            elseif missingHP < 1600 then
                preferredCure = 'Cure V'
            else
                preferredCure = 'Cure VI'
            end
                -- Rdm, Sch and Pld have high skill and up to Cure IV
        elseif player.main_job == 'BLM' or player.main_job == 'SCH' then
            if missingHP < 150 then
                preferredCure = 'Cure'
            elseif missingHP < 350 then
                preferredCure = 'Cure II'
            elseif missingHP < 650 then
                preferredCure = 'Cure III'
            else
                preferredCure = 'Cure IV'
            end
        -- Subbing /whm or /rdm gets you up to Cure IV
        elseif player.sub_job == 'WHM' or player.sub_job == 'RDM' then
            if missingHP < 150 then
                preferredCure = 'Cure'
            elseif missingHP < 300 then
                preferredCure = 'Cure II'
            elseif missingHP < 550 then
                preferredCure = 'Cure III'
            else
                preferredCure = 'Cure IV'
            end
        -- Subbing /sch or /pld gets you up to Cure III
        else
            if missingHP < 150 then
                preferredCure = 'Cure'
            elseif missingHP < 300 then
                preferredCure = 'Cure II'
            else
                preferredCure = 'Cure III'
            end
        end
    end
         
    local cure_mp_cost = {['Cure'] = 8, ['Cure II'] = 24, ['Cure III'] = 46, ['Cure IV'] = 88, ['Cure V'] = 135, ['Cure VI'] = 230}
    local mpCost = cure_mp_cost[preferredCure]
     
    if buffactive['Light Arts'] or buffactive['Addendum: White'] then
        mpCost = math.floor(mpCost * 0.9)
    elseif buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
        mpCost = math.floor(mpCost * 1.1)
    end
         
    local downgrade_msg
         
    -- Downgrade the spell to what we can actually afford
    if player.mp < mpCost and not (buffactive['Manafont'] or buffactive['Mana Well']) then
        if player.mp < 8 then
            add_to_chat(122, 'Insufficient MP ['..tostring(player.mp)..']. Cancelling.')
            eventArgs.cancel = true
            return
        elseif player.mp < 24 then
            preferredCure = 'Cure'
        elseif player.mp < 46 then
            preferredCure = 'Cure II'
        elseif player.mp < 88 then
            preferredCure = 'Cure III'
        elseif player.mp < 135 then
            preferredCure = 'Cure IV'
        elseif player.mp < 227 then
            preferredCure = 'Cure V'
        end
         
        downgrade_msg = 'Insufficient MP ['..tostring(player.mp)..']. Downgrading to '..preferredCure..'.'
    end
         
    if preferredCure ~= spell.english then
        eventArgs.cancel = true
        send_command('@input /ma "'..preferredCure..'" '..tostring(spell.target.raw))
        if downgrade then
            add_to_chat(122, downgrade_msg)
        end
        return
    end
         
        if missingHP and missingHP > 0 then
        add_to_chat(122,'Trying to cure '..tostring(missingHP)..' HP using '..preferredCure..'.')
    end
end
   
function get_targets_missing_hp(spell)
    local missingHP
         
    -- If curing ourself, get our exact missing HP
    if spell.target.type == "SELF" then
        missingHP = player.max_hp - player.hp
    -- If curing someone in our alliance, we can estimate their missing HP
    elseif spell.target.isallymember then
        local target = find_player_in_alliance(spell.target.name)
        local est_max_hp = target.hp / (target.hpp/100)
        missingHP = math.floor(est_max_hp - target.hp)
    end
     
    return missingHP
end
 
-- Global intercept on precast.
function user_precast(spell, action, spellMap, eventArgs)
    refine_cure(spell, action, spellMap, eventArgs)
end
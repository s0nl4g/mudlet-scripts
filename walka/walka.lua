scripts["walka"] = scripts["walka"] or {
    nums = {},
    objects = {}
}

function scripts.walka:process_nums(nums_obj)    
    scripts.walka.nums = nums_obj    
    scripts.windows:cleanContainerStatsUpForNums()
end
function scripts.walka:process_objects(objects)

    for k,v in pairs(scripts.walka.objects) do
        if not table.contains(scripts.walka.nums, tonumber(k)) then
            scripts.walka.objects[k] = nil
            scripts.windows:hideEnemyStatsFor(tonumber(k))
        end
    end    
    for k,v in pairs(objects) do
        scripts.walka.objects[k] = v        
    end

    --procesujemy stan walki
    scripts.walka:process_attacks();
    
end
function scripts.walka:process_attacks()
    for k,v in pairs(scripts.walka.objects) do        
        if v.team > 0 then            
            scripts.windows:showStatsFor(tonumber(k), v.desc, v.avatar == 1, false, 0)	            
        end
        if v.enemy and v.attack_num ~= 0 then
            if scripts.walka.objects[tostring(v.attack_num)] ~= nil and (scripts.walka.objects[tostring(v.attack_num)].team > 0 or scripts.walka.objects[tostring(v.attack_num)].avatar > 0) then
                local stat = scripts.windows:findElementById(v.attack_num, containerStats)
                if(stat ~= nil and stat.is_enemy == false) then		        
                    scripts.windows:showEnemyStatsFor(v.attack_num, tonumber(k), v.desc, true)                    
                end
                stat = scripts.windows:findElementById(tonumber(k), containerStats)
                if(stat ~= nil and stat.is_enemy == false) then		
                    scripts.windows:showEnemyStatsFor(tonumber(k), v.attack_num, scripts.walka.objects[tostring(v.attack_num)].desc, false)                    
                end
                raiseEvent("warlock.someoneAttacks", v.desc, scripts.walka.objects[tostring(v.attack_num)].desc)
            end
        end
        scripts.windows:setStatGauge(tonumber(k), "kondycja", v.hp + 1, #scripts.opisy_poziomow["kondycje"]);
        raiseEvent("warlock.hp_changed", v.desc, v.hp, #scripts.opisy_poziomow["kondycje"])
        scripts.windows:cleanupStatLeftovers()
    end
end
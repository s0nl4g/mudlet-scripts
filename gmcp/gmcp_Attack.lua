function gmcp_Attack()
	if(gmcp.Attack == nil) then return end
	local a = gmcp.Attack
	
	local stat = scripts.windows:findElementById(a.kogo.id, containerStats)
    
	if(stat ~= nil and stat.is_enemy == false) then		        
		scripts.windows:showEnemyStatsFor(a.kogo.id, a.kto.id, a.kto.nazwa, true)
	end

	stat = scripts.windows:findElementById(a.kto.id, containerStats)
	if(stat ~= nil and stat.is_enemy == false) then		
		scripts.windows:showEnemyStatsFor(a.kto.id, a.kogo.id, a.kogo.nazwa, false)
	end
	raiseEvent("warlock.someoneAttacks", a.kto.nazwa, a.kogo.nazwa)
end

if scripts.event_handlers["scripts/gmcp/gmcp_Attack"] then
    killAnonymousEventHandler(scripts.event_handlers["scripts/gmcp/gmcp_Attack"])
end

scripts.event_handlers["scripts/gmcp/gmcp_Attack"] = registerAnonymousEventHandler("gmcp.Attack", gmcp_Attack)
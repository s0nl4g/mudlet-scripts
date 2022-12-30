scripts["speedwalk"] = scripts["speedwalk"] or { speedWalkStep = 1, waiting = false, delay = 2, timer = 0  }


function scripts.speedwalk:abortSpeedWalk(komunikat)

	komunikat = komunikat or "    PRZERWANE CHODZENIE.\n"
	speedWalkDir = nil
	speedWalkPath = nil
	stepWalkStep = 1
    killTimer(scripts.speedwalk.timer)
    scripts.speedwalk.timer = 0
    scripts.speedwalk.waiting = false
	echo(komunikat)
end

function scripts.speedwalk:doSpeedWalkStep(event)
	
	if(speedWalkPath == nil or #speedWalkPath < 1) then return end
	if(scripts.speedwalk.speedWalkStep > #speedWalkPath) then
        scripts.speedwalk.waiting = false
		scripts.speedwalk:abortSpeedWalk("    CEL PODROZY OSIAGNIETY.\n")
		return
	end
	
	local expected = speedWalkPath[scripts.speedwalk.speedWalkStep - 1] or scripts.mapper.currentRoom.id
	if(scripts.mapper.currentRoom.id == tonumber(expected)) then
		local kier = speedWalkDir[scripts.speedwalk.speedWalkStep]
		if(kier == "up") then kier = "u"; end
		if(kier == "down") then kier = "d"; end
		scripts.speedwalk.timer = tempTimer(scripts.speedwalk.delay, function() send(kier, true) end)
	else
		scripts.speedwalk:abortSpeedWalk("    PRZERWANE CHODZENIE, NIEOCZEKIWANA LOKACJA.\n")
        scripts.speedwalk.waiting = false
	end
	scripts.speedwalk.speedWalkStep = scripts.speedwalk.speedWalkStep + 1
end

function doSpeedWalk()
   cecho("Droga do przejscia: " .. table.concat(speedWalkDir, ", ") .. "\n    Nacisnij <white:red>F12<reset> aby przerwac.\n")
   --echo("Rooms we'll pass through: " .. table.concat(speedWalkPath, ", ") .. "\n")
	scripts.speedwalk.speedWalkStep = 1
	scripts.speedwalk:doSpeedWalkStep()
end

function scripts.speedwalk:getRoomByExit(fromId, kierunek)
  local exits = getRoomExits(fromId)
  for dir, roomId in pairs(exits) do
    if(table.contains(scripts.mapper.kierunki[kierunek][1], dir)) then return roomId end
  end
  return nil
end

function scripts.speedwalk.kierunkiPoDrodze(k, v)
  local roomId = scripts.speedwalk:getRoomByExit(scripts.mapper.currentRoom.id, v)
  if(roomId ~= nil) then
    local rtype = scripts.mapper.env[getRoomEnv(roomId) - scripts.mapper.ENV_START_NUM].type
    return rtype == "ROOM_IN_ROAD"
  end
  return false
end

function scripts.speedwalk:lazikWalkStep()
	send("idz")
end

function scripts.speedwalk:wyjdzSpecjalnym()
	local cmdsmap = getSpecialExits(scripts.mapper.currentRoom.id) or {}
	local cmds = scripts.mapper.currentRoom.specialExits

	for k, v in pairs(cmdsmap) do
		for kk, vv in pairs(v) do
			if(table.index_of(cmds, kk) == nil) then
				table.insert(cmds, kk)
			end
		end
	end
	if(table.size(cmds) == 0) then
		echo("    Brak wyjsc specjalnych.\n")
		return
	end
	if(table.size(cmds) == 1) then
		send(cmds[1], true)
		return
	end
	if(table.contains(cmds, "wejscie")) then
		send("wejscie", true)
		return
	end
	if(table.contains(cmds, "schody")) then
		send("schody", true)
		return
	end
	if(table.contains(cmds, "wyjscie")) then
		send("wyjscie", true)
		return
	end
	echo("    Zbyt wiele wyjsc specjalnych!\n")
end

if scripts.event_handlers["scipts/mapper/speedwalk/newroom"] then
    killAnonymousEventHandler(scripts.event_handlers["scipts/mapper/speedwalk/newroom"])
end

scripts.event_handlers["scipts/mapper/speedwalk/newroom"] = registerAnonymousEventHandler("warlock.newRoom", "scripts.speedwalk:doSpeedWalkStep")




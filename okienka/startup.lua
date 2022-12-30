function scripts.windows:okienka_startup()
	if(not scripts.windows.win_created) then
		scripts.windows:createWindows();
		scripts.windows.win_created = true
	end
--	if(not stats_created) then
--		createStats();
--		stats_created = true
--	end
end

-- Tworzy glowne okno z dodatkowymi kontenerami po bokach.
function scripts.windows:createWindows()
	setBorderTop(scripts.windows.borderTop)
	setBorderBottom(scripts.windows.borderBottom)
  	setBorderLeft(scripts.windows.borderLeft)
  	setBorderRight(scripts.windows.borderRight)

	-- Dodatkowe paski po bokach i na dole
	containerLeft = Geyser.Container:new({
		name = "containerLeft", x = 0, y = 0,
		width = scripts.windows.borderLeft, height="100%"
	})
	containerTop = Geyser.Container:new({
		name = "containerTop", x = scripts.windows.borderLeft, y = 0,
		width = "100%", height=scripts.windows.borderTop
	})
	containerBottom = Geyser.Container:new({
		name = "containerBottom", x = scripts.windows.borderLeft, y = -scripts.windows.borderBottom,
		width = "100%", height=scripts.windows.borderBottom
	})

  -- UserWindow do wszystkich elementow dodatkowych do przesuwania po ekranie
  chatWindow = Geyser.UserWindow:new({
    name = "Rozmowy",
    x = "34%",
    y = "0%",
    width="33%", height ="20%",
    docked = true,
    dockPosition = "right"
  })
  mapWindow = Geyser.UserWindow:new({
    name = "Mapper",
    x = "-34%",
    y = "20%",
    width="33%", height ="40%",
    docked = true,
    dockPosition = "right"
  })
  statsWindow = Geyser.UserWindow:new({
    name = "Stats",
    x = "34%",
    y = "60%",
    width="33%", height ="40%",
    docked = true,
    dockPosition = "right"
  })

	-- Okienko z pelna mapa
	mapper = Geyser.Mapper:new({
		name = "mapper",
		--x = "-31%",
    --y = "12c",
		--width = "30%",
    --height = "40%"
    x = "10px",
    y = "5px",
    width = "100%-5px",
    height = "100%-10px",
    embedded = true,
    --dockPosition = "right"
	}, mapWindow)

	scripts.windows:createChatWindows(chatWindow);
	scripts.windows:createMinimap(containerLeft);
	scripts.windows:createSpecialExitsLine(containerBottom);
	scripts.windows:createStatsLayout(statsWindow)
end

function scripts.windows:createMinimap(parent)
	minimap = Geyser.MiniConsole:new({
		name="minimap", x = "-6c", y = "-4c",
		width = "5c", height = "4c",
		fontSize = 10
	}, parent)
	--minimap:setTextFormat(10, 50, 10, 255, 255, 255, 1, 0, 0);
	return minimap
end

function scripts.windows:createSpecialExitsLine(parent)
	minimapExits = Geyser.MiniConsole:new({
  		name="wyjscia", x = "1px", y = "-15px",
  		width="-1px", height="15px",
		wrapAt=1000,
	}, containerBottom)
	setTextFormat("wyjscia", 0, 20, 0, 200, 255, 200, 0, 0, 0)
	setBgColor("wyjscia", 0, 20, 0)
	return minimapExits
end

function userWindowResize()
    if scripts.windows.win_created then
      saveWindowLayout()
    end
end

if scripts.event_handlers["scipts/windows/startup/userWindowResize"] then
    killAnonymousEventHandler(scripts.event_handlers["scipts/windows/startup/userWindowResize"])
end

scripts.event_handlers["scipts/windows/startup/userWindowResize"] = registerAnonymousEventHandler("sysUserWindowResizeEvent", userWindowResize)


scripts.windows:okienka_startup()
loadWindowLayout()

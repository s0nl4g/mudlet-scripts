function podmiana_postepow_func()

	local kolor_postepow = "gold"

	local postepy = {
		["znikome"] = 0,
		["minimalne"] = 1,
		["nieznaczne"] = 2,
		["malutkie"] = 3,
		["male"] = 4,
		["nieduze"] = 5,
		["spore"] = 6,
		["znaczne"] = 7,
		["pokazne"] = 8,
		["duze"] = 9,
		["wielkie"] = 10,
		["wspaniale"] = 11,
		["wysmienite"] = 12,
		["ogromne"] = 13,
		["gigantyczne"] = 14,
		["kolosalne"] = 15,
		["niesamowite"] = 16,
		["fantastyczne"] = 17
	}

	local postepy_wartosc = postepy[matches[3]]

	selectString(matches[3], 1)
	fg(kolor_postepow)
	replace(matches[3].. " (" ..postepy_wartosc.."/17)")
	resetFormat()

end
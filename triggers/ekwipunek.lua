function trigger_ekwipunek_func()
    selectString(matches[1], 1);
    fg("dodger_blue");
    resetFormat();
end

function ocena_broni_func()

	local szybkoscMap = {
		["bardzo powoli"] = 1,
		["powoli"] = 2,
		["dosc wolno"] = 3,
		["w miare szybko"] = 4, 
		["szybko"] = 5,
		["bardzo szybko"] = 6,
		["blyskawicznie"] = 7
	}

	local skutecznoscMap

	if matches[3] == "on" then
		skutecznoscMap = {
			["kompletnie nieskuteczny"] = 1,
			["strasznie nieskuteczny"] = 2,
			["bardzo nieskuteczny"] = 3, 
			["raczej nieskuteczny"] = 4,
			["malo skuteczny"] = 5,
			["niezbyt skuteczny"] = 6, 
			["raczej skuteczny"] = 7,
			["dosyc skuteczny"] = 8,
			["calkiem skuteczny"] = 9, 
			["bardzo skuteczny"] = 10,
			["niezwykle skuteczny"] = 11,
			["wyjatkowo skuteczny"] = 12, 
			["zabojczo skuteczny"] = 13,
			["fantastycznie skuteczny"] = 14
		}
	else
		skutecznoscMap = {
			["kompletnie nieskuteczna"] = 1,
			["strasznie nieskuteczna"] = 2,
			["bardzo nieskuteczna"] = 3, 
			["raczej nieskuteczna"] = 4,
			["malo skuteczna"] = 5,
			["niezbyt skuteczna"] = 6, 
			["raczej skuteczna"] = 7,
			["dosyc skuteczna"] = 8,
			["calkiem skuteczna"] = 9, 
			["bardzo skuteczna"] = 10,
			["niezwykle skuteczna"] = 11,
			["wyjatkowo skuteczna"] = 12, 
			["zabojczo skuteczna"] = 13,
			["fantastycznie skuteczna"] = 14
		}
	end

	local wywazenieMap

	if matches[3] == "on" then
		wywazenieMap = {
			["wyjatkowo zle wywazony"] = 1,
			["bardzo zle wywazony"] = 2,
			["zle wywazony"] = 3,
			["bardzo kiepsko wywazony"] = 4,
			["kiepsko wywazony"] = 5,
			["przyzwoicie wywazony"] = 6,
			["srednio wywazony"] = 7,
			["niezle wywazony"] = 8,
			["dosc dobrze wywazony"] = 9,
			["dobrze wywazony"] = 10,
			["bardzo dobrze wywazony"] = 11,
			["doskonale wywazony"] = 12, 
			["perfekcyjnie wywazony"] = 13,
			["genialnie wywazony"] = 14
		}
	else
		wywazenieMap = {
			["wyjatkowo zle wywazona"] = 1,
			["bardzo zle wywazona"] = 2,
			["zle wywazona"] = 3,
			["bardzo kiepsko wywazona"] = 4,
			["kiepsko wywazona"] = 5,
			["przyzwoicie wywazona"] = 6,
			["srednio wywazona"] = 7,
			["niezle wywazona"] = 8,
			["dosc dobrze wywazona"] = 9,
			["dobrze wywazona"] = 10,
			["bardzo dobrze wywazona"] = 11,
			["doskonale wywazona"] = 12, 
			["perfekcyjnie wywazona"] = 13,
			["genialnie wywazona"] = 14
		}
	end

	local parowanieMap = {
		["wyjatkowo zle"] = 1,
		["bardzo zle"] = 2,
		["zle"] = 3,
		["bardzo kiepsko"] = 4, 
		["kiepsko"] = 5,
		["przyzwoicie"] = 6,
		["srednio"] = 7,
		["niezle"] = 8, 
		["dosc dobrze"] = 9,
		["dobrze"] = 10,
		["bardzo dobrze"] = 11,
		["doskonale"] = 12, 
		["perfekcyjnie"] = 13,
		["genialnie"] = 14
	}

	local typ = matches[2]
	local wywazenie = matches[4].." ["..wywazenieMap[matches[4]].."/14]"
	local skutecznosc = matches[5].." ["..skutecznoscMap[matches[5]].."/14]"
	local parowanie = matches[6].." ["..parowanieMap[matches[6]].."/14]"
	local szybkosc = matches[8].." ["..szybkoscMap[matches[8]].."/7]"
	local suma = wywazenieMap[matches[4]] + skutecznoscMap[matches[5]]

	deleteLine()
	cecho("<light_slate_blue>\n\n".. string.sub("Typ broni: <grey>" .. typ .. "                                 ", 0, 50))
	cecho("<light_slate_blue>".. string.sub("Suma: <grey>" .. suma .. "                                 ", 0, 50))
	cecho("<light_slate_blue>\n".. string.sub("Wywazenie: <grey>" .. wywazenie .. "                                 ", 0, 50))
	cecho("<light_slate_blue>".. string.sub("Skutecznosc: <grey>" .. skutecznosc .. "                                 ", 0, 50))
	cecho("<light_slate_blue>\n"    .. string.sub("Parowanie: <grey>" .. parowanie .. "                                 ", 0, 50))
	cecho("<light_slate_blue>".. string.sub("Szybkosc: <grey>" .. szybkosc .. "                                 ", 0, 50))

end

function poziom_zuzycia_func()

	local zniszczenieMap = {
		["moze peknac w kazdej chwili."] = 1,
		["wymaga natychmiastowej konserwacji."] = 2,
		["jest w bardzo zlym stanie."] = 3,
		["jest w zlym stanie."] = 4,
		["jest poszczerbiony."] = 5,
		["jest poszczerbiona."] = 5,
		["jest poszczerbione."] = 5,
		["jest lekko poszczerbiony."] = 6,
		["jest lekko poszczerbiona."] = 6,
		["jest lekko poszczerbione."] = 6,
		["widac na nim liczne slady walk."] = 7,
		["widac na niej liczne slady walk."] = 7,
		["widac na nim slady walk."] = 8,
		["widac na niej slady walk."] = 8,
		["jest w dobrym stanie."] = 9,
		["jest w znakomitym stanie."] = 10
	}

	local przetrwanieMap = {
		["jeszcze chwile sluzyc."] = {1, "0-4h"},
		["jeszcze krotko sluzyc."] = {2, "4-12h"},
		["jeszcze troche sluzyc."] = {3, "12-18h"},
		["jeszcze przecietnie dlugo sluzyc."] = {4, "18-24h"},
		["jeszcze dlugo sluzyc."] = {5, "1-3 dni"},
		["jeszcze bardzo dlugo sluzyc."] = {6, "3-7 dni"},
		["jeszcze nieprawdopodobnie dlugo sluzyc."] = {7, "7+ dni"},
		["jeszcze nieskonczenie dlugo sluzyc."] = {8, "PERM"},
		["wiecznie sluzyc."] = {8, "PERM"}
	}

	if zniszczenieMap[matches[2]] ~= nil then

		local poziom_zniszczenia = matches[2].." ["..zniszczenieMap[matches[2]].."/10]"
		local kolor_zniszczenia

		if zniszczenieMap[matches[2]] == 1 then
			kolor_zniszczenia = "255,0,0"
		elseif zniszczenieMap[matches[2]] == 2 then
			kolor_zniszczenia = "255,50,0"
		elseif zniszczenieMap[matches[2]] == 3 then
			kolor_zniszczenia = "255,100,0"
		elseif zniszczenieMap[matches[2]] == 4 then
			kolor_zniszczenia = "255,150,0"
		elseif zniszczenieMap[matches[2]] == 5 then
			kolor_zniszczenia = "255,200,0"
		elseif zniszczenieMap[matches[2]] == 6 then
			kolor_zniszczenia = "255,255,0"
		elseif zniszczenieMap[matches[2]] == 7 then
			kolor_zniszczenia = "200,255,0"
		elseif zniszczenieMap[matches[2]] == 8 then
			kolor_zniszczenia = "150,255,0"
		elseif zniszczenieMap[matches[2]] == 9 then
			kolor_zniszczenia = "100,255,0"
		elseif zniszczenieMap[matches[2]] == 10 then
			kolor_zniszczenia = "0,255,0"
		end

		deleteLine()
		decho("\nWyglada na to, ze <"..kolor_zniszczenia..">"..poziom_zniszczenia)

	end

	if przetrwanieMap[matches[3]] ~= nil then

		local poziom_przetrwania = matches[2] .. " [" .. przetrwanieMap[matches[3]][2] .. "]"
		local kolor_przetrwania

		if przetrwanieMap[matches[3]][1] == 1 then
			kolor_przetrwania = "56,153,153"
		elseif przetrwanieMap[matches[3]][1] == 2 then
			kolor_przetrwania = "72,169,163"
		elseif przetrwanieMap[matches[3]][1] == 3 then
			kolor_przetrwania = "88,185,174"
		elseif przetrwanieMap[matches[3]][1] == 4 then
			kolor_przetrwania = "104,201,184"
		elseif przetrwanieMap[matches[3]][1] == 5 then
			kolor_przetrwania = "120,217,195"
		elseif przetrwanieMap[matches[3]][1] == 6 then
			kolor_przetrwania = "136,233,205"
		elseif przetrwanieMap[matches[3]][1] == 7 then
			kolor_przetrwania = "152,249,216"
		elseif przetrwanieMap[matches[3]][1] == 8 then
			kolor_przetrwania = "168,247,237"
		end

		deleteLine()
		decho("\nWyglada na to, ze <"..kolor_przetrwania..">"..poziom_przetrwania)

	end

end
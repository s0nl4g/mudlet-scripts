scripts["spece"] = scripts["spece"] or {}

function scripts.spece:ustaw_kolor_i_prefiks_atakujacego(prefiks_speca, zmien_kolor)
    if czy_to_ty then
        if zmien_kolor then setFgColor(230 - (ipoz * 255 / max), 230 - (ipoz * 200 / max), 255) end
        prefix("<deep_sky_blue>["..prefiks_speca.."] ", cecho)
    else
        if zmien_kolor then setFgColor(255, 255 - (ipoz * 255 / max), 200 - (ipoz * 200 / max)) end
        prefix("<orange>["..prefiks_speca.."] ", cecho)
    end
end

function trigger_spec_autor_func(autor)
    czy_to_ty = false;
    if autor == "" then
        czy_to_ty = false
    else
        czy_to_ty = true
    end
end

function trigger_bractwo_spec_obrazenia_func()
    local bs_sily = {"delikatnym", "lekkim", "niezbyt silnym", "silnym", "mocnym", "poteznym", "niewiarygodnie poteznym"}
    local bs_rany = {"nikly slad|nieznaczny odprysk kostny|nieznaczny uszczerbek|nikla ranke",
                "niewielk(i|a) (slad|odprysk kostny|uszczerbek|rane)",
                "zauwazaln(y|a) (slad|odprysk kosci|uszczerbek|rane)",
                "spor(y|e|a) (slad|pekniecie|uszczerbek|rane)",
                "paskudn(y|e|a) (slad|polamane kosci|uszczerbek|rane)",
                "glebok(i|a) (slad|dziure|rane)|mocno i gleboko polamane kosci",
                "bruzde przedzielajaca niemalze na pol|gruchoczac i lamiac kosci|prawie smiertelny w skutkach brak|prawie smiertelna rane, tnac (wysuszone miesnie|miesnie i pryskajac krwia)",
                "bruzde na wylot|bezksztaltna mase polamanych kosci|zmasakrowane szczatki|straszliwie zmasakrowane cialo, ktore pada na ziemie( w kaluzy wlasnej krwi|)"
    }

    local ipoz, max, opis, sila, rana

    for a = 0,#matches-1,5 do
        -- kolor i styl dla calej linii
        selectCaptureGroup(a + 1)
        fg("PaleTurquoise")--; setBold(true)
        -- dalej osobne kolorki dla sily ciosu i poziomu zadanej rany
        sila = matches[a + 3]
        rana = matches[a + 5]
        selectCaptureGroup(a + 3)
        ipoz, max = scripts.opisy_poziomow:jakiPoziomOpisu(bs_sily, sila:lower())
        setFgColor(255, 255 - (ipoz * 255 / max), 200 - (ipoz * 200 / max));
        --replace(matches[a + 3] .. "(" .. ipoz .. ")")
        selectCaptureGroup(a + 5)
        ipoz, max = scripts.opisy_poziomow:jakiPoziomOpisu(bs_rany, rana:lower())
        setFgColor(255, 255 - (ipoz * 255 / max), 200 - (ipoz * 200 / max));
        --replace(matches[a + 5] .. "(" .. ipoz .. ")")
    end

    deselect()
    resetFormat()
end



function trigger_szermierze_spec_obrazenia_func(cios)
    selectCaptureGroup(2)

    if cios == "mija jednak cel" or cios == "uchyla sie" then
        fg'plum'
        scripts.spece:ustaw_kolor_i_prefiks_atakujacego("SZ 0/8", false)
	elseif cios == "nieznaczny uszczerbek" or cios == "niewielki uszczerbek" or cios == "zauwazalny uszczerbek" or cios == "spory uszczerbek" or cios == "gleboka dziure" or cios == "paskudny uszczerbek" or cios == "prawie smiertelny w skutkach brak" or cios == "zmasakrowane szczatki" then	
	    ipoz, max = scripts.opisy_poziomow:jakiPoziomOpisu(scripts.opisy_poziomow.szermierz_sila_speca_zywiolaki, cios:lower())
        scripts.spece:ustaw_kolor_i_prefiks_atakujacego("SZ "..ipoz.."/"..max-1, true)
    else
        ipoz, max = scripts.opisy_poziomow:jakiPoziomOpisu(scripts.opisy_poziomow.szermierz_sila_speca, cios:lower())
        scripts.spece:ustaw_kolor_i_prefiks_atakujacego("SZ "..ipoz.."/"..max-1, true)
    end
	
    resetFormat()
end

function trigger_szermierze_spec_rozbrojenie_func()
    local efekt = matches[2]
    scripts.spece:ustaw_kolor_i_prefiks_atakujacego("SZ-R", false)
    selectCaptureGroup(2)

    if efekt == "z okrzykiem bolu opuszcza" and czy_to_ty then
        fg'deep_sky_blue'
    elseif efekt == "z okrzykiem bolu opuszcza" and not czy_to_ty then
        fg'orange_red'
    else
        fg'plum'
    end

    resetFormat()    
end

function trigger_szermierze_spec_unik_func()
    local efekt = matches[2]
    scripts.spece:ustaw_kolor_i_prefiks_atakujacego("SZ-U", false)
    selectCaptureGroup(2)

    if efekt == "zmuszajac do odsloniecia sie" and czy_to_ty then
        fg'deep_sky_blue'
    elseif efekt == "zmuszajac do odsloniecia sie" and not czy_to_ty then
        fg'orange_red'
    else
        fg'plum'
    end
	
    resetFormat()
end
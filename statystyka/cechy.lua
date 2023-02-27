scripts["licznik_cech"] = scripts["licznik_cech"] or {}
    
  -- CECHY SILA
  scripts.licznik_cech.silaall = {}
  scripts.licznik_cech.silaall["slabiutk"] = 1;
  scripts.licznik_cech.silaall["slabowit"] = 2;
  scripts.licznik_cech.silaall["watl"] = 3;
  scripts.licznik_cech.silaall["cherlaw"] = 4;
  scripts.licznik_cech.silaall["slab"] = 5;
  scripts.licznik_cech.silaall["krzepk"] = 6;
  scripts.licznik_cech.silaall["siln"] = 7;
  scripts.licznik_cech.silaall["mocn"] = 8;
  scripts.licznik_cech.silaall["teg"] = 9;
  scripts.licznik_cech.silaall["potezn"] = 10;
  scripts.licznik_cech.silaall["mocarn"] = 11;
  scripts.licznik_cech.silaall["tytaniczn"] = 12;
  scripts.licznik_cech.silaall["wszechmocn"] = 13;


  -- CECHY ZRECZNOSC
  scripts.licznik_cech.zrecznoscall ={}
  scripts.licznik_cech.zrecznoscall["nieskoordynowan"] = 1;
  scripts.licznik_cech.zrecznoscall["niezdarn"] = 2;
  scripts.licznik_cech.zrecznoscall["niezreczn"] = 3;
  scripts.licznik_cech.zrecznoscall["niezgrabn"] = 4;
  scripts.licznik_cech.zrecznoscall["niewprawn"] = 5;
  scripts.licznik_cech.zrecznoscall["sprawn"] = 6;
  scripts.licznik_cech.zrecznoscall["zreczn"] = 7;
  scripts.licznik_cech.zrecznoscall["szybk"] = 8;
  scripts.licznik_cech.zrecznoscall["wprawn"] = 9;
  scripts.licznik_cech.zrecznoscall["zwinn"] = 10;
  scripts.licznik_cech.zrecznoscall["gibk"] = 11;
  scripts.licznik_cech.zrecznoscall["akrobatyczn"] = 12;
  scripts.licznik_cech.zrecznoscall["ekwilibrystyczn"] = 13;

  -- CECHY WYTRZYMALOSC
  scripts.licznik_cech.wytkaall ={}
  scripts.licznik_cech.wytkaall["delikatn"] = 1;
  scripts.licznik_cech.wytkaall["chorowit"] = 2;
  scripts.licznik_cech.wytkaall["rachityczn"] = 3;
  scripts.licznik_cech.wytkaall["mizern"] = 4;
  scripts.licznik_cech.wytkaall["kruch"] = 5;
  scripts.licznik_cech.wytkaall["dobrze zbudowan"] = 6;
  scripts.licznik_cech.wytkaall["wytrzymal"] = 7;
  scripts.licznik_cech.wytkaall["odporn"] = 8;
  scripts.licznik_cech.wytkaall["masywn"] = 9;
  scripts.licznik_cech.wytkaall["tward"] = 10;
  scripts.licznik_cech.wytkaall["umiesnion"] = 11;
  scripts.licznik_cech.wytkaall["muskularn"] = 12;
  scripts.licznik_cech.wytkaall["atletyczn"] = 13;

  -- CECHY INTELIGENCJA
  scripts.licznik_cech.intall = {}
  scripts.licznik_cech.intall["bezmysln"] = 1;
  scripts.licznik_cech.intall["ciemn"] = 2;
  scripts.licznik_cech.intall["tep"] = 3;
  scripts.licznik_cech.intall["nierozumn"] = 4;
  scripts.licznik_cech.intall["ograniczon"] = 5;
  scripts.licznik_cech.intall["rozgarniet"] = 6;
  scripts.licznik_cech.intall["pojetn"] = 7;
  scripts.licznik_cech.intall["zmysln"] = 8;
  scripts.licznik_cech.intall["inteligentn"] = 9;
  scripts.licznik_cech.intall["lotn"] = 10;
  scripts.licznik_cech.intall["bystr"] = 11;
  scripts.licznik_cech.intall["blyskotliw"] = 12;
  scripts.licznik_cech.intall["genialn"] = 13;

  -- CECHY MADROSC
  scripts.licznik_cech.madroscall = {}
  scripts.licznik_cech.madroscall["glupi"] = 1;
  scripts.licznik_cech.madroscall["durn"] = 2;
  scripts.licznik_cech.madroscall["zacofan"] = 3;
  scripts.licznik_cech.madroscall["niemadr"] = 4;
  scripts.licznik_cech.madroscall["niewyksztalcon"] = 5;
  scripts.licznik_cech.madroscall["roztropn"] = 6;
  scripts.licznik_cech.madroscall["wyksztalcon"] = 7;
  scripts.licznik_cech.madroscall["rozsadn"] = 8;
  scripts.licznik_cech.madroscall["logiczn"] = 9;
  scripts.licznik_cech.madroscall["madr"] = 10;
  scripts.licznik_cech.madroscall["uczon"] = 11;
  scripts.licznik_cech.madroscall["oswiecon"] = 12;
  scripts.licznik_cech.madroscall["wszechwiedzac"] = 13;

  -- CECHY ODWAGA
  scripts.licznik_cech.odwagaall={}
  scripts.licznik_cech.odwagaall["tchorzliw"] =1;
  scripts.licznik_cech.odwagaall["strachliw"] =2;
  scripts.licznik_cech.odwagaall["bojazliw"] =3;
  scripts.licznik_cech.odwagaall["lekliw"] =4;
  scripts.licznik_cech.odwagaall["niepewn"] =5;
  scripts.licznik_cech.odwagaall["zdecydowan"] =6;
  scripts.licznik_cech.odwagaall["niezachwian"] =7;
  scripts.licznik_cech.odwagaall["odwazn"] =8;
  scripts.licznik_cech.odwagaall["dzieln"] = 9;
  scripts.licznik_cech.odwagaall["nieugiet"] = 10;
  scripts.licznik_cech.odwagaall["mezn"] = 11;
  scripts.licznik_cech.odwagaall["bohatersk"] = 12;
  scripts.licznik_cech.odwagaall["heroiczn"] = 13;
    


function trigger_licznik_cech_cechy_func()  
  local sila = trim_string(matches[2])
  local zrecznosc = trim_string(matches[3])
  local wytrzymalosc = trim_string(matches[4])
  local inteligencja = trim_string(matches[5])
  local madrosc = trim_string(matches[6])
  local odwaga = trim_string(matches[7])
  selectCurrentLine()
  replace("")
  s = "<red>[cos poszlo nie tak]<reset>"
  z = "<red>[cos poszlo nie tak]<reset>"
  w = "<red>[cos poszlo nie tak]<reset>"
  i = "<red>[cos poszlo nie tak]<reset>"
  m = "<red>[cos poszlo nie tak]<reset>"
  o = "<red>[cos poszlo nie tak]<reset>"

  --sila
  --uciecie "jak na..."
  if string.find(sila, " ") then
    str = string.match(sila, '(.*) (.*) (.*) (.*)')
    str = string.sub(str, 0, string.len(str)-1)
  else
    str = string.sub(sila, 0, string.len(sila)-1)
  end

  if scripts.licznik_cech.silaall[str] then
    s_l = scripts.licznik_cech.silaall[str]
    if string.find(sila, "jak na legende") then
      s_l = s_l + 13
    elseif string.find(sila, "jak na polboga") or string.find(sila, "jak na polboginie")then
      s_l = s_l + 26
    elseif string.find(sila, "jak na boga") then
      s_l = s_l + 39
    end
    s = sila.."<yellow_green> ("..s_l..")<reset>"
  end


  --zrecznosc
  --uciecie "jak na..."
    if string.find(zrecznosc, " ") then
      str = string.match(zrecznosc, '(.*) (.*) (.*) (.*)')
      str = string.sub(str, 0, string.len(str)-1)
    else
      str = string.sub(zrecznosc, 0, string.len(zrecznosc)-1)
    end

    if scripts.licznik_cech.zrecznoscall[str] then
      z_l = scripts.licznik_cech.zrecznoscall[str]
      if string.find(zrecznosc, "jak na legende") then
        z_l = z_l + 13
      elseif string.find(zrecznosc, "jak na polboga") or string.find(zrecznosc, "jak na polboginie") then
        z_l = z_l + 26
      elseif string.find(zrecznosc, "jak na boga") then
        z_l = z_l + 39
      end
    z = zrecznosc.."<yellow_green> ("..z_l..")<reset>"
    end
    

    --wytka
    --uciecie "jak na..."
    if string.find(wytrzymalosc, " ") then
      if string.find(wytrzymalosc, " ") then
        str = "dobrze zbudowan"
      else
       str = string.match(wytrzymalosc, '(.*) (.*) (.*) (.*) (.*)')
       str = string.sub(str, 0, string.len(str)-1)
      end

    else
      str = string.sub(wytrzymalosc, 0, string.len(wytrzymalosc)-1)
    end
    if scripts.licznik_cech.wytkaall[str] then
      w_l = scripts.licznik_cech.wytkaall[str]
      if string.find(wytrzymalosc, "jak na legende") then
        w_l = w_l + 13
      elseif string.find(wytrzymalosc, "jak na polboga") or string.find(wytrzymalosc, "jak na polboginie") then
        w_l = w_l + 26
      elseif string.find(wytrzymalosc, "jak na boga") then
        w_l = w_l + 39
      end
    w = wytrzymalosc.."<yellow_green> ("..w_l..")<reset>"
    end
    
    --inteligencja
      --uciecie "jak na..."
    if string.find(inteligencja, " ") then
      str = string.match(inteligencja, '(.*) (.*) (.*) (.*)')
      str = string.sub(str, 0, string.len(str)-1)
    else
      str = string.sub(inteligencja, 0, string.len(inteligencja)-1)
    end
    
    if scripts.licznik_cech.intall[str] then
      i_l = scripts.licznik_cech.intall[str]
      if string.find(inteligencja, "jak na legende") then
        i_l = i_l + 13
      elseif string.find(inteligencja, "jak na polboga") then
        i_l = i_l + 26
      elseif string.find(inteligencja, "jak na boga") then
        i_l = i_l + 39
      end
    i = inteligencja.."<yellow_green> ("..i_l..")<reset>"
    end
    
    --madrosc
    --uciecie "jak na..."
    if string.find(madrosc, " ") then
      str = string.match(madrosc, '(.*) (.*) (.*) (.*)')
      str = string.sub(str, 0, string.len(str)-1)
    else
      str = string.sub(madrosc, 0, string.len(madrosc)-1)
    end
    
    if scripts.licznik_cech.madroscall[str] then
      m_l = scripts.licznik_cech.madroscall[str]
      if string.find(madrosc, "jak na legende") then
        m_l = m_l + 13
      elseif string.find(madrosc, "jak na polboga") then
        m_l = m_l + 26
      elseif string.find(madrosc, "jak na boga") then
        m_l = m_l + 39
      end
    m = madrosc.."<yellow_green> ("..m_l..")<reset>"
    end

    --odwaga
    --uciecie "jak na..."
    if string.find(odwaga, " ") then
      str = string.match(odwaga, '(.*) (.*) (.*) (.*)')
      str = string.sub(str, 0, string.len(str)-1)
    else
      str = string.sub(odwaga, 0, string.len(odwaga)-1)
    end
    
    
    if scripts.licznik_cech.odwagaall[str] then
      o_l = scripts.licznik_cech.odwagaall[str]
      if string.find(odwaga, "jak na legende") then
        o_l = o_l + 13
      elseif string.find(odwaga, "jak na polboga") then
        o_l = o_l + 26
      elseif string.find(odwaga, "jak na boga") then
        o_l = o_l + 39
      end
    o = odwaga.."<yellow_green> ("..o_l..")<reset>"
    end
    cecho("Jestes "..s..", "..z..", "..w..", "..i..", "..m.." i "..o..".")
    scripts.licznik_cech:cechy_policz_lvl(s_l,z_l,w_l,i_l,m_l,o_l)
  end

function scripts.licznik_cech:cechy_policz_lvl(sila,zrecznosc,wytrzymalosc,inteligencja,madrosc,odwaga)
  local level = sila+zrecznosc+wytrzymalosc+inteligencja+madrosc+odwaga
  local bojowe = sila+zrecznosc+wytrzymalosc
  local mentalne = inteligencja+madrosc
  local procentbojowych = bojowe/level*100
  local procentmentalnych = mentalne/level*100
  cecho("\n<dark_goldenrod>Masz "..level.."/312 cech. Bojowe: "..bojowe.." ("..math.floor(procentbojowych).."%), mentalne: "..mentalne.." ("..math.floor(procentmentalnych).."%).")
  end

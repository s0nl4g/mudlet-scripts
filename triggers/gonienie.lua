function triggers_gonienie_func()

	if multimatches[1][2] == multimatches[2][2] then

		escape_dir = multimatches[2][4]
		
		-- do ustawienia kolor strzalki
		arrow_color = "red"

		if escape_dir == "poludnie" then
			cecho("\n                  <" .. arrow_color .. ">#\n")
			cecho("                  <" .. arrow_color .. ">#\n")
			cecho("                <" .. arrow_color .. "># # #\n")
			cecho("                 <" .. arrow_color .. ">###\n")
			cecho("                  <" .. arrow_color .. ">#\n")
		elseif escape_dir == "polnoc" then
			cecho("\n                  <" .. arrow_color .. ">#\n")
			cecho("                 <" .. arrow_color .. ">###\n")
			cecho("                <" .. arrow_color .. "># # #\n")
			cecho("                  <" .. arrow_color .. ">#\n")
			cecho("                  <" .. arrow_color .. ">#\n")
		elseif escape_dir == "wschod" then
			cecho("\n                  <" .. arrow_color .. ">#\n")
			cecho("                   <" .. arrow_color .. ">#\n")
			cecho("              <" .. arrow_color .. ">#######\n")
			cecho("                   <" .. arrow_color .. ">#\n")
			cecho("                  <" .. arrow_color .. ">#\n")
		elseif escape_dir == "zachod" then
			cecho("\n                <" .. arrow_color .. ">#\n")
			cecho("               <" .. arrow_color .. ">#\n")
			cecho("              <" .. arrow_color .. ">#######\n")
			cecho("               <" .. arrow_color .. ">#\n")
			cecho("                <" .. arrow_color .. ">#\n")
		elseif escape_dir == "poludniowy-wschod" then
			cecho("\n               <" .. arrow_color .. ">#\n")
			cecho("                 <" .. arrow_color .. ">#\n")
			cecho("                   <" .. arrow_color .. ">#   #\n")
			cecho("                     <" .. arrow_color .. "># #\n")
			cecho("                   <" .. arrow_color .. "># # #\n")
		elseif escape_dir == "poludniowy-zachod" then
			cecho("\n                       <" .. arrow_color .. ">#\n")
			cecho("                     <" .. arrow_color .. ">#\n")
			cecho("               <" .. arrow_color .. ">#   #\n")
			cecho("               <" .. arrow_color .. "># #\n")
			cecho("               <" .. arrow_color .. "># # #\n")
		elseif escape_dir == "polnocny-wschod" then
			cecho("\n                   <" .. arrow_color .. "># # #\n")
			cecho("                     <" .. arrow_color .. "># #\n")
			cecho("                   <" .. arrow_color .. ">#   #\n")
			cecho("                 <" .. arrow_color .. ">#\n")
			cecho("               <" .. arrow_color .. ">#\n")
		elseif escape_dir == "polnocny-zachod" then
			cecho("\n               <" .. arrow_color .. "># # #\n")
			cecho("               <" .. arrow_color .. "># #\n")
			cecho("               <" .. arrow_color .. ">#   #\n")
			cecho("                     <" .. arrow_color .. ">#\n")
			cecho("                       <" .. arrow_color .. ">#\n")
		elseif escape_dir == "dol" then
			cecho("\n            <" .. arrow_color .. ">###\n")
			cecho("            <" .. arrow_color .. ">#  #\n")
			cecho("            <" .. arrow_color .. ">#  #\n")
			cecho("            <" .. arrow_color .. ">#  #\n")
			cecho("            <" .. arrow_color .. ">###\n")
		elseif escape_dir == "gore" then
			cecho("\n            <" .. arrow_color .. ">#  #\n")
			cecho("            <" .. arrow_color .. ">#  #\n")
			cecho("            <" .. arrow_color .. ">#  #\n")
			cecho("            <" .. arrow_color .. ">#  #\n")
			cecho("             <" .. arrow_color .. ">## \n")
		end

	end

end
_load_sushi

function fish_right_prompt
	if test "$theme_complete_path" = "yes"
		set cwd (prompt_pwd)
	else
		set cwd (basename (prompt_pwd))
	end

	right_context

	echo -n -s (yellow)"("(dim)$cwd(yellow)") "(off)
	echo -n -s (dim)(date +%H(yellow):(dim)%M(yellow):(dim)%S)(off)
end

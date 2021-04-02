_load_sushi

function fish_prompt
	set -l symbol "λ "
	set -l code $status

	left_context

	if test "$code" = 0
		echo -n -s (red)"$symbol"(off)
	else
		echo -n -s (dim)"$symbol"(off)
	end
end

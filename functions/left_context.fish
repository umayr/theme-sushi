_load_sushi

function left_context
	if test -n "$SSH_CLIENT"
		set -l host (hostname -s)
		set -l who (whoami)
		echo -n -s (red)"("(cyan)"$who"(red)":"(cyan)"$host"(red)") "(off)
	end

	if git::is_repo
		set -l branch (git::branch_name ^/dev/null)
		set -l ref (git show-ref --head --abbrev | awk '{print substr($0,0,7)}' | sed -n 1p)

		if git::is_stashed
			echo -n -s (white)"^"(off)
		end

		echo -n -s (red)"("(off)

		if git::is_dirty
			echo -n -s (white)"*"(off)
		end

		if command git symbolic-ref HEAD > /dev/null ^/dev/null
			if git::is_staged
				echo -n -s (cyan)"$branch"(off)
			else
				echo -n -s (yellow)"$branch"(off)
			end
		else
			echo -n -s (dim)"$ref"(off)
		end

		for remote in (git remote)
			set -l behind_count (echo (command git rev-list $branch..$remote/$branch ^/dev/null | wc -l | tr -d " "))
			set -l ahead_count (echo (command git rev-list $remote/$branch..$branch ^/dev/null | wc -l | tr -d " "))

			if test $ahead_count -ne 0; or test $behind_count -ne 0; and test (git remote | wc -l) -gt 1
				echo -n -s " "(orange)$remote(off)
			end

			if test $ahead_count -ne 0
				echo -n -s (white)" +"$ahead_count(off)
			end

			if test $behind_count -ne 0
				echo -n -s (white)" -"$behind_count(off)
			end
		end

		echo -n -s (red)") "(off)
	end
end

# Print grayed out last prompt while loading
function left_context_loading_indicator -a last_prompt
	echo -n -s "$last_prompt" | string replace -ra '\e\[[^m]*m' '' | read -l uncolored_last_prompt
	echo -n -s (dim)"$uncolored_last_prompt"(off)
end

_load_sushi

function fish_prompt
	set -l symbol "λ "
	set -l code $status

	if test -n "$ssh_client"
		set -l host (hostname -s)
		set -l who (whoami)
		echo -n -s (purple)"("(cyan)"$who"(purple)":"(cyan)"$host"(purple)") "(off)
	end

	if git::is_repo
		set -l branch (git::branch_name ^/dev/null)
		set -l ref (git show-ref --head --abbrev | awk '{print substr($0,0,7)}' | sed -n 1p)

		if git::is_stashed
			echo -n -s (white)"^"(off)
		end

		echo -n -s (purple)"("(off)

		if git::is_dirty
			printf (white)"*"(off)
		end

		if command git symbolic-ref HEAD > /dev/null ^/dev/null
			if git::is_staged
				printf (green)"$branch"(off)
			else
				printf (cyan)"$branch"(off)
			end
		else
			printf (dim)"$ref"(off)
		end

		for remote in (git remote)
			set -l behind_count (echo (command git rev-list $branch..$remote/$branch ^/dev/null | wc -l | tr -d " "))
			set -l ahead_count (echo (command git rev-list $remote/$branch..$branch ^/dev/null | wc -l | tr -d " "))

			if test $ahead_count -ne 0; or test $behind_count -ne 0; and test (git remote | wc -l) -gt 1
				echo -n -s " "(dark_purple)$remote(off)
			end

			if test $ahead_count -ne 0
				echo -n -s (white)" ↑"$ahead_count(off)
			end

			if test $behind_count -ne 0
				echo -n -s (white)" ↓"$behind_count(off)
			end
		end

		echo -n -s (purple)") "(off)
	end

	if test "$code" = 0
		echo -n -s (purple)"$symbol"(off)
	else
		echo -n -s (dim)"$symbol"(off)
	end
end

set -g CMD_DURATION 0

function yellow;	    set_color -o b58900; end
function orange;    	set_color -o cb4b16; end
function red;       	set_color -o d30102; end
function magenta;   	set_color -o d33682; end
function violet;    	set_color -o 6c71c4; end
function blue;      	set_color -o 268bd2; end
function cyan;      	set_color -o 2aa198; end
function green;     	set_color -o 859900; end
function tmp;			set_color -o fdf6e3; end
function dim;			set_color -o 333333; end
function off;			set_color -o normal; end

function fish_prompt
	set -l symbol		"λ "
  	set -l code 		$status

	if git_is_repo

		# λ														Sushi [07:12:20]
		# (master) λ											Sushi [07:12:20]
		# (master+4) λ											Sushi [07:12:20]
		# (*master+4) λ											Sushi [07:12:20]
		# #(*master+4) λ										Sushi [07:12:20]


		set -l branch			(git_branch_name)
		set -l remote			"origin"

		set -l behind_count		(echo (command git rev-list $branch..$remote/$branch ^/dev/null | wc -l | tr -d " "))
		set -l ahead_count		(echo (command git rev-list $remote/$branch..$branch ^/dev/null | wc -l | tr -d " "))
		
		if git_is_stashed
			echo -n -s (tmp)"^"(off)
		end

		echo -n -s (red)"("(off)
			if git_is_dirty
				printf (tmp)"*"(off)
			end

			if git_is_staged
				printf (cyan)"$branch"(off)
			else
				printf (yellow)"$branch"(off)
			end

			if test $ahead_count -ne 0
				echo -n -s (tmp)" +"$ahead_count(off)
			end

			if test $behind_count -ne 0
				echo -n -s (tmp)" -"$behind_count(off)
			end
		echo -n -s (red)") "(off)
	end

	if test "$code" = 0 
		echo -n -s (red)"$symbol"(off)
	else
		echo -n -s (dim)"$symbol"(off)
	end	

end
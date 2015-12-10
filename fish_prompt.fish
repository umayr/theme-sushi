function fish_prompt
	set -l symbol		"λ "
  	set -l code 		$status

	if git_is_repo

		set -l branch			(git_branch_name ^/dev/null)
		set -l remote			"origin"
        	set -l ref              	(git show-ref --head --abbrev | awk '{print substr($0,0,7)}' | sed -n 1p)
		
		if git_is_stashed
			echo -n -s (white)"^"(off)
		end

		echo -n -s (red)"("(off)
		
		if git_is_dirty
			printf (white)"*"(off)
		end
	        
	        if command git symbolic-ref HEAD > /dev/null ^/dev/null
	    		if git_is_staged
				printf (cyan)"$branch"(off)
		    	else
			    	printf (yellow)"$branch"(off)
	    		end
	        else
	        	printf (dim)"$ref"(off)
	        end

		if command git remote | grep $remote > /dev/null ^/dev/null
			set -l behind_count		(echo (command git rev-list $branch..$remote/$branch ^/dev/null | wc -l | tr -d " "))
			set -l ahead_count		(echo (command git rev-list $remote/$branch..$branch ^/dev/null | wc -l | tr -d " "))

			if test $ahead_count -ne 0
				echo -n -s (white)" +"$ahead_count(off)
			end

			if test $behind_count -ne 0
				echo -n -s (white)" -"$behind_count(off)
			end
		end

		echo -n -s (red)") "(off)
	end

	if test "$code" = 0 
		echo -n -s (red)"$symbol"(off)
	else
		echo -n -s (dim)"$symbol"(off)
	end	

end

set -g CMD_DURATION 0

function yellow;	    set_color -o b58900; end
function red;       	set_color -o d30102; end
function cyan;      	set_color -o 2aa198; end
function white;			set_color -o fdf6e3; end
function dim;			set_color -o 333333; end
function off;			set_color -o normal; end

function fish_right_prompt

	if test "$theme_complete_path" = "yes"
		set cwd (prompt_pwd)
	else
		set cwd (basename (prompt_pwd))

		if git_is_repo
			set root_folder (command git rev-parse --show-toplevel ^/dev/null)
			set parent_root_folder (dirname $root_folder)
			set cwd (echo $PWD | sed -e "s|$parent_root_folder/||")
		end
	end

	printf (yellow)"("(dim)$cwd(yellow)") "(off)
	printf (dim)(date +%H(yellow):(dim)%M(yellow):(dim)%S)(off)

end

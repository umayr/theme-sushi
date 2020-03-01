function orange
    set_color -o ffb86c
end

function yellow
    set_color -o b58900
end

function red
    set_color -o ff5555
end

function cyan
    set_color -o 8be9fd
end

function white
    set_color -o f8f8f2
end

function green
    set_color -o 50fa7b
end

function pink
    set_color -o ff79c6
end

function purple
    set_color -o bd93f9
end

function dark_purple
    set_color -o 6272a4
end

function grey
    set_color -o 44475a
end

function off
    set_color -o normal
end

function git::is_repo
	test -d .git; or command git rev-parse --git-dir >/dev/null ^/dev/null
end

function git::ahead -a ahead behind diverged none
	not git_is_repo; and return

	set -l commit_count (command git rev-list --count --left-right "@{upstream}...HEAD" ^/dev/null)

	switch "$commit_count"
  case ""
	  # no upstream
  case "0"\t"0"
	  test -n "$none"; and echo "$none"; or echo ""
  case "*"\t"0"
	  test -n "$behind"; and echo "$behind"; or echo "-"
  case "0"\t"*"
	  test -n "$ahead"; and echo "$ahead"; or echo "+"
  case "*"
	  test -n "$diverged"; and echo "$diverged"; or echo "±"
	end
end

function git::branch_name
	git_is_repo; and begin
		command git symbolic-ref --short HEAD ^/dev/null;
		or command git show-ref --head -s --abbrev | head -n1 ^/dev/null
	end
end

function git::is_dirty
	git_is_repo; and not command git diff --no-ext-diff --quiet --exit-code
end

function git::is_staged
	git_is_repo; and begin
		not command git diff --cached --no-ext-diff --quiet --exit-code
	end
end

function git::is_stashed
	git_is_repo; and begin
		command git rev-parse --verify --quiet refs/stash >/dev/null
	end
end

function git::is_touched
	git_is_repo; and begin
		test -n (echo (command git status --porcelain))
	end
end

function git::untracked
	git_is_repo; and begin
		command git ls-files --other --exclude-standard
	end
end

function fish_right_prompt
	if test "$theme_complete_path" = "yes"
		set cwd (prompt_pwd)
	else
		set cwd (basename (prompt_pwd))

		if git::is_repo
			set root_folder (command git rev-parse --show-toplevel ^/dev/null)
			set parent_root_folder (dirname $root_folder)
			set cwd (echo $PWD | sed -e "s|$parent_root_folder/||")
		end
	end

	printf (pink)"("(grey)$cwd(pink)") "(off)
	printf (grey)(date +%H(pink):(grey)%M(pink):(grey)%S)(off)
end

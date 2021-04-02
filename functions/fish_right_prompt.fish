_load_sushi

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

	command -sq kubectl; and k8s::current_context >/dev/null 2>/dev/null; and begin
		set -l k8s_namespace (k8s::current_namespace)
		if test -z "$k8s_namespace"
			printf (yellow)"("(dim)(k8s::current_context)(yellow)") "(off)
		else
			printf (yellow)"("(dim)(k8s::current_context)"/$k8s_namespace"(yellow)") "(off)
		end
	end

	if terraform::workspace
		set terraform_workspace_name (command cat .terraform/environment)
		printf (yellow)"("(dim)$terraform_workspace_name(yellow)") "(off)
	end

	printf (yellow)"("(dim)$cwd(yellow)") "(off)
	printf (dim)(date +%H(yellow):(dim)%M(yellow):(dim)%S)(off)
end

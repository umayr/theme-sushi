_load_sushi

function right_context
	if test "$theme_complete_path" != "yes" && git::is_repo
		set root_folder (command git rev-parse --show-toplevel ^/dev/null)
		set parent_root_folder (dirname $root_folder)
		set cwd (echo $PWD | sed -e "s|$parent_root_folder/||")
	end

	command -sq kubectl; and k8s::current_context >/dev/null 2>/dev/null; and begin
		set -l k8s_namespace (k8s::current_namespace)
		if test -z "$k8s_namespace"
			echo -n -s (yellow)"("(dim)(k8s::current_context)(yellow)") "(off)
		else
			echo -n -s (yellow)"("(dim)(k8s::current_context)"/$k8s_namespace"(yellow)") "(off)
		end
	end

	if terraform::workspace
		set terraform_workspace_name (command cat .terraform/environment)
		echo -n -s (yellow)"("(dim)$terraform_workspace_name(yellow)") "(off)
	end
end

# Print ellipse while loading
function right_context_loading_indicator
	echo -n -s (dim)"… "(off)
end

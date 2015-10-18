function ylw; set_color -o FFAA00; end
function red; set_color -o CC0000; end
function trd; set_color -o 666666; end
function dim; set_color -o 333333; end
function off; set_color normal; end


function fish_right_prompt
  
  if test "$theme_short_path" = 'yes'
    set cwd (basename (prompt_pwd))

    if git_is_repo
      set root_folder (command git rev-parse --show-toplevel ^/dev/null)
      set parent_root_folder (dirname $root_folder)
      set cwd (echo $PWD | sed -e "s|$parent_root_folder/||")
    end

  else
    set cwd (prompt_pwd)
  end

  printf (ylw)"$cwd"(off)

end

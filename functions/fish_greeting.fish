set -g CMD_DURATION 0

function dim
    set_color -o 4f4f4f
end

function off
    set_color -o normal
end

function fish_greeting
	echo (dim)(uname -mnprs)(off)
end

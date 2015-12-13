set -g CMD_DURATION 0

function yellow;	    set_color -o b58900; end
function red;       	set_color -o d30102; end
function cyan;      	set_color -o 2aa198; end
function white;			set_color -o fdf6e3; end
function dim;			set_color -o 4f4f4f; end
function off;			set_color -o normal; end

function fish_greeting
	echo (dim)(uname -mnprs)(off)
end

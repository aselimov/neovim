map <C-b> : w % <Bar> ! ./% <CR>

inoremap ;ph ####<CR>#Help<CR>####<CR>Help(){<CR>echo ""<CR>echo<CR>echo "Syntax: <++> [<++>] <++>"<CR>echo "options:"<CR>echo "<++>"<CR><BACKSPACE>}<ESC>5k0f"a
inoremap ;pf function fail {<CR>printf '%s\n' "$1" >&2<CR>exit "${2-1}"<CR>}
inoremap ;i if [ ]; then<CR><++><CR>fi<ESC>2k0f[a<Space>
inoremap ;pg args=()<CR>argnum=0<CR>while [ $# -gt 0 ]; do<CR>unset OPTIND<CR>unset OPTARG<CR>#Parse Flags<CR>while getopts 'h' options; do <CR>case $options in<CR>h)<CR>Help<CR>break;;<CR><++>)<CR><++>;;<CR>esac<CR>done<CR>shift $((OPTIND-1))<CR>args+=("$1")<CR> (( argnum++ ))<CR>shift<CR>done<ESC>13kf'la
inoremap ;pf ####<CR>#Error<CR>####<CR>function fail {<CR>printf '%s\n' "$1" >&2<CR>exit "${2-1}"<CR>}<CR>

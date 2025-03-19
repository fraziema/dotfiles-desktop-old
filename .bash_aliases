# misc
alias get='sudo aptitude install '
alias :q='exit'
alias ytmp3='yt-dlp -f 'ba' -x --audio-format mp3 '
alias filedate='date +%Y%m%d_%H%M%S'
alias vpn=/opt/cisco/anyconnect/bin/vpnui
alias jiggle='while true; do xdotool mousemove 250 0 mousemove restore; echo "-";sleep 500; done'

# feh aliases
alias slideshow='feh -D2 -FZz ' 
alias imgview='feh -g 1200x800 -.rZ'
alias wallp='feh --bg-max' 

# wget aliases
alias filerip='wget -e robots=off -r -nc -nd -np'
alias mirror='wget -e robots=off -r -nc -np'
alias imagerip='wget -e robots=off -r -nc -nd -np -A jpeg,jpg,bmp,gif,png'
alias siterip='wget -e robots=off -r -nc -np'

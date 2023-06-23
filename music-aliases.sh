
# This is spotify specific. playerctl works for any media player, so it's preferred
# . 6800547/sp
# alias play='sp-play'
# alias pause='sp-pause'

alias play='playerctl play'
alias pause='playerctl pause'
# alias spot='/bin/bash Mustream/play'

start_spotify() {
   # Test if spotify is open, if it is not, start it but disconnect it from this session
   if [[ -z $(pidof -s spotify) ]]; then
      spotify  2> /dev/null & disown
   fi
}

spot() {
   start_spotify
   /bin/bash ~/music-scripts/Mustream/play "$1"
}

alias spotBond='spot https://open.spotify.com/playlist/37i9dQZF1DX0ZzMQgXnSUD?si=dc9a0474a5524fb3'


alias play='playerctl play'
alias pause='playerctl pause'

start_spotify() {
   # Test if spotify is open, if it is not, start it but disconnect it from this session
   if [[ -z $(pidof -s spotify) ]]; then
      spotify  2> /dev/null & disown
   fi
}

spot() {
   start_spotify
   /bin/bash ~/music-scripts/Mustream/play "$@"
}

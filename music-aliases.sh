
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

# This function created with the assistance of Chat GPT3.5
# https://chat.openai.com/share/efe6d30b-4b44-4e75-8d9a-90e4eb25c825
vol() {
   local input="$1"

   if (( $(echo "$input < 1" | bc -l) )); then
      playerctl -p spotify volume "$input"
   else
      input=$(echo "scale=2; $input / 100" | bc -l)
      playerctl -p spotify volume "$input"
   fi
}

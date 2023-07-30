#!/bin/bash
# Path to your quotes file
# QUOTES_FILE="/home/aungnaingphyo/0-Github/MyMoti/myMoti.txt"

# # Function to display a random quote
# display_random_quote() {
#     num_lines=$(wc -l < "$QUOTES_FILE")
#     random_line=$((RANDOM % num_lines + 1))
#     sed -n "${random_line}p" "$QUOTES_FILE"
# }

# # Display a quote on the desktop
# gsettings set org.gnome.desktop.background picture-uri "file:///home/aungnaingphyo/Pictures/Wallpapers/wallpaper.jpg"
# notify-send "$(display_random_quote)"
# <===================>
#test new

QUOTES_FILE="/home/aungnaingphyo/0-Github/MyMoti/myMoti.txt"

# Function to display a random quote
display_random_quote() {
    num_lines=$(wc -l < "$QUOTES_FILE")
    random_line=$((RANDOM % num_lines + 1))
    sed -n "${random_line}p" "$QUOTES_FILE"
}

# Check if screen suspend is disabled. If it is set to 0, it means the screen suspend is disabled.
idle_delay=$(gsettings get org.gnome.desktop.session idle-delay)
# if [[ $idle_delay -eq 0 ]]; then
# Display a quote on the desktop and close after 5 seconds
gsettings set org.gnome.desktop.background picture-uri "file:///home/aungnaingphyo/Pictures/Wallpapers/wallpaper.jpg"

notify-send -u critical -t 3000 "$(display_random_quote)" &
PID=$!
sleep 5
kill $PID


# <=====================>
# <========works========>
# Function to display a random quote
# display_random_quote() {
#     num_lines=$(wc -l < "$QUOTES_FILE")
#     random_line=$((RANDOM % num_lines + 1))
#     sed -n "${random_line}p" "$QUOTES_FILE"
# }

# # Display a quote on the terminal
# echo "$(display_random_quote)"

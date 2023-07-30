#!/bin/bash
# Path to your quotes file
QUOTES_FILE="/home/aungnaingphyo/MyMoti/myMoti.txt"

# Function to display a random quote
display_random_quote() {
    num_lines=$(wc -l < "$QUOTES_FILE")
    random_line=$((RANDOM % num_lines + 1))
    sed -n "${random_line}p" "$QUOTES_FILE"
}

# Display a quote on the desktop
gsettings set org.gnome.desktop.background picture-uri "file:///home/aungnaingphyo/Pictures/Wallpapers/wallpaper.jpg"
notify-send "$(display_random_quote)"

# <========works========>
# Function to display a random quote
# display_random_quote() {
#     num_lines=$(wc -l < "$QUOTES_FILE")
#     random_line=$((RANDOM % num_lines + 1))
#     sed -n "${random_line}p" "$QUOTES_FILE"
# }

# # Display a quote on the terminal
# echo "$(display_random_quote)"
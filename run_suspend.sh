#run
#chmod +x run_suspend.sh

# Function to check if screen suspend is disabled
is_screen_suspend_disabled() {
    idle_delay=$(gsettings get org.gnome.desktop.session idle-delay)
    return $((idle_delay == 0))
}

# Function to display a random quote
display_random_quote() {
    num_lines=$(wc -l < "$QUOTES_FILE")
    random_line=$((RANDOM % num_lines + 1))
    sed -n "${random_line}p" "$QUOTES_FILE"
}

# Main function to check and run the quote display script
main() {
    QUOTES_FILE="/home/aungnaingphyo/0-Github/MyMoti/myMoti.txt"

    if is_screen_suspend_disabled; then
        # Display a quote on the desktop using notify-send with HTML tags
        #notify-send -i "/home/aungnaingphyo/Pictures/Wallpapers/wallpaper.jpg" "<b>Random Quote:</b> $(display_random_quote)"
        gsettings set org.gnome.desktop.background picture-uri "file:///home/aungnaingphyo/Pictures/Wallpapers/wallpaper.jpg"
        notify-send -u critical -t 3000 "$(display_random_quote)" &
        PID=$!
        sleep 5
        kill $PID
    fi
}

# Call the main function
main

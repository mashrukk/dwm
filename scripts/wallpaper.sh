#!/bin/bash

# Directory containing wallpapers
wallpaper_dir="$HOME/Pictures/Wallpapers"

# Check if feh is installed
if ! command -v feh &> /dev/null; then
    echo "Error: feh is not installed."
    exit 1
fi

# Check if the wallpaper directory exists
if [ ! -d "$wallpaper_dir" ]; then
    echo "Error: Wallpaper directory does not exist."
    exit 1
fi

# Function to display wallpaper options using dmenu
show_wallpaper_options() {
    # List all image files in the wallpaper directory
    wallpapers=$(find "$wallpaper_dir" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) -exec basename {} \; | sort)

    # Show wallpaper options using dmenu
    chosen_wallpaper=$(echo "$wallpapers" | dmenu -l 10)
    echo "$chosen_wallpaper"
}

# Main function
main() {
    # Display wallpaper options and set the chosen wallpaper
    chosen_wallpaper=$(show_wallpaper_options)

    # Set the chosen wallpaper using feh
    if [ -n "$chosen_wallpaper" ]; then
        feh --bg-fill "$wallpaper_dir/$chosen_wallpaper"
    fi
}

main

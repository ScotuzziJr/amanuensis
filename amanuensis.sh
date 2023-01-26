#!/bin/bash

save_pages() {
    export opentabs=$(find ~/ -name "recovery.jsonlz4" -type f);

    python3 amanuensis.py
}

restore_pages() {
    while read -r line; do
        firefox -new-tab "$line" 2>/dev/null &
        sleep 1
    done < "saved_urls.txt"
}

if [[ $# -eq 0 ]];then
    echo "No arguments supplied. Usage: ./amanuensis.sh [mode]"
    echo "mode: 'save' for saving the urls | 'restore' to restore tabs"
elif [[ "$1" == 'save' ]];then
    save_pages
elif [[ "$1" == 'restore' ]];then
    restore_pages
else
    echo "Invalid input"
fi

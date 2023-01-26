#!/bin/bash

check_dependecies() {
    if ! pip freeze | grep -q lz4 ;then
        pip install lz4
    fi
}

save_pages() {
    if [[ $1 == 'firefox' ]];then
        export opentabs=$(find ~/ -name "recovery.jsonlz4" -type f);
        export browser='firefox';
    else
        echo "We don't have support for this browser yet."
        exit 1
    fi
    python3 amanuensis.py
}

restore_pages() {
    if [[ $1 == 'firefox' ]]; then
        while read -r line; do
            firefox -new-tab "$line" 2>/dev/null &
            sleep 1
        done < "saved_urls.txt"
    elif [[ $1 == 'chrome' ]]; then
        while read -r line; do
            google-chrome "$line" 2>/dev/null &
            sleep 1
        done < "saved_urls.txt"
    else
        echo "We don't have support for this browser yet."
    fi
}

check_dependecies

if [[ $# -lt 2 ]];then
    echo "Missing arguments. Usage: ./amanuensis.sh [mode] [browser]"
    echo "mode: 'save' for saving the urls | 'restore' to restore tabs"
    echo "browser: 'firefox' | 'chrome'"
    exit 1
elif [[ $1 == 'save' ]];then
    save_pages $2
elif [[ $1 == 'restore' ]];then
    restore_pages $2
else
    echo "Invalid input"
fi

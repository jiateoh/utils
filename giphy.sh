#!/bin/bash
# Author: Jia (Jason) Teoh (jteoh)
RANDOM_GIF_SEARCH="http://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC&rating=g&tag="
RANDOM_STICKER_SEARCH="http://api.giphy.com/v1/stickers/random?api_key=dc6zaTOxFJmzC&rating=g&tag="
TRANSLATE_SEARCH="http://api.giphy.com/v1/gifs/translate?api_key=dc6zaTOxFJmzC&rating=g&s="

if [ "$#" -eq 0 ]; then
    search_type="gif"
    echo "Defaulting to random GIF search"
else
    search_type=$1
fi
case $search_type in
    gif)
        base_url=$RANDOM_GIF_SEARCH
        ;;
    sticker)
        base_url=$RANDOM_STICKER_SEARCH
        ;;
    translate)
        base_url=$TRANSLATE_SEARCH
        ;;
    *)
        echo "Invalid search type: $search_type must be one of 'gif', 'sticker', 'translate'"
        exit -1
esac

if [ "$#" -gt 1 ]; then
    orig_search=${@:2}
else
    orig_search="pugs"
    echo "Defaulting to search term 'pugs'"
fi
echo "Finding $search_type for '$orig_search'"

search=$(sed -e 's/  */\-/g' <<< $orig_search)
url="$base_url$search"
echo "Searching $url"
result=$(curl -s $url | python -c 'import sys, json; print json.load(sys.stdin)["data"]["url"]' | tr -d '\n')

if [[ -z "$result" ]]; then
    echo "Unable to find url. No results?"
    exit -1
fi
open "$result"
copy_string="$result ($orig_search)" 
if [[ $OSTYPE == "linux-gnu" ]]; then
    xclip -selection c <<< $copy_string
else 
    pbcopy <<< $copy_string
fi
echo "$copy_string"
#!/bin/bash
# Author Jia (Jason) Teoh (jteoh)
# USAGE: bash asky-io.sh <search_terms>
# You will first need to set the ASKY_KEY environment variable. A key can be acquired from https://asky.io
base_url="https://asky.io"
search_random_endpoint="${base_url}/api/art/search_random"

auth_str="Authorization: ${ASKY_KEY}"

if [ -z ${ASKY_KEY+x} ]; then
    echo "Please set environment variable ASKY_KEY first."
    exit -1
fi

if [ "$#" -eq 0 ]; then
    search_term="flex"
    echo "Defaulting to 'flex'"
else
    echo "Searching for $@"
    search_term=$@
fi

search_str="{ \"search_term\": \"${search_term}\" }"
json_data=$(curl -s -X POST -H "${auth_str}" -H "Content-Type: application/json" -d "${search_str}" $search_random_endpoint)
# echo $result | python -m json.tool
result=$(python -c 'import sys, json; print json.load(sys.stdin)[0]["content"].encode("utf-8")' <<< $json_data)
if [[ -z "$result" ]]; then
    echo "No results found!"
    exit -1
fi

# copy_txt="\`$result\`"
copy_txt="$result"
title=$(python -c 'import sys, json; print json.load(sys.stdin)[0]["title"]' <<< $json_data)
if [[ $OSTYPE == "linux-gnu" ]]; then
    xclip -selection c <<< $copy_txt
else 
    pbcopy <<< $copy_txt
fi
echo "$result ($search_term --> $title)"
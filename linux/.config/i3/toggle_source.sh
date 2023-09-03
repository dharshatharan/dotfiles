#! /usr/bin/env bash

set -eu

# Get the ID for the current DEFAULT_SOURCE
defaultSource=$(pactl info | grep "Default Source: " | awk '{ print $3 }')

# Query the list of all available sources
sources=()
i=0
while read line; do
    index=$(echo $line | awk '{ print $1 }')
    sources[${#sources[@]}]=$index

    # Find the current DEFAULT_SOURCE
    if grep -q "$defaultSource" <<< "$line"; then
        defaultIndex=$index
        defaultPos=$i
    fi

    i=$(( $i + 1 ))
done <<< "$(pactl list sources short)"

# Compute the ID of the new DEFAULT_SOURCE
newDefaultPos=$(( ($defaultPos + 1) % ${#sources[@]} ))
newDefaultSource=${sources[$newDefaultPos]}

# Update the DEFAULT_SOURCE
pacmd set-default-source $newDefaultSource

# Move all current recording streams to the new DEFAULT_SOURCE
while read stream; do
    # Check whether there is a stream recording in the first place
    if [ -z "$stream" ]; then
        break
    fi

    streamId=$(echo $stream | awk '{ print $1 }')
    echo $streamId
    pactl move-source-output $streamId @DEFAULT_SOURCE@ || true
done <<< "$(pactl list short source-outputs)"

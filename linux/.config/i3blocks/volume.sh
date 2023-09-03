# Get the default source and sink
volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk -F'/' '/front-left:/ {print $2}' | tr -d ' %')

# Print in the desired format
echo "$volume%"


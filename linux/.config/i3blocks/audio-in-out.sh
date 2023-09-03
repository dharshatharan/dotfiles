# Get the default source and sink
source=$(pactl info | grep "Default Source:" | awk '{ print $3 }' | sed -nE 's/.*-([^-]+)-[^-]+\..*/\1/p' | head -c 15)
sink=$(pactl info | grep "Default Sink:" | awk '{ print $3 }' | sed -nE 's/.*-([^-]+)-[^-]+\..*/\1/p' | head -c 15)

# Print in the desired format
echo "IN $source  OUT $sink"


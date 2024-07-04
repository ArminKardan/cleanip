#!/bin/bash
output_script="/etc/cleanip/cleanip.sh"

# Use a here document to write the content to the new shell script
cat << 'EOF' > $output_script
hi
EOF

# Make the new script executable
chmod +x $output_script

# Optionally, run the new script to verify it works
./$output_script



NEW_PATH="/etc/cleanip/cleanip.sh"
# Check if the path is already in the PATH
if [[ ":$PATH:" == *":$NEW_PATH:"* ]]; then
  echo "The path $NEW_PATH is already in the PATH."
else
  export PATH="$PATH:$NEW_PATH"
  echo "The path $NEW_PATH has been added to the PATH."
  echo "export PATH=\$PATH:$NEW_PATH" >> ~/.bashrc
  echo "The path $NEW_PATH has been added to ~/.bashrc to be permanent."
fi
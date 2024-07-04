#!/bin/bash
output_script="/etc/cleanip/cleanip.sh"

# Use a here document to write the content to the new shell script
cat << 'EOF' > $output_script
#!/bin/bash

URL="https://download.docker.com/linux/ubuntu/gpg"
STATUS=$(curl -o /dev/null -s -w "%{http_code}\n" "$URL")
if [ "$STATUS" -eq 200 ]; then
  echo "Hooray! Your Network IP is clean (Status: $STATUS)."
else
  echo "Network is dirty (Status: $STATUS)."
fi
EOF

# Make the new script executable
chmod +x $output_script



NEW_PATH=$(realpath "/etc/cleanip")
# Check if the path is already in the PATH
if [[ ":$PATH:" == *":$NEW_PATH:"* ]]; then
  echo "The path $NEW_PATH is already in the PATH."
else
  export PATH="$PATH:$NEW_PATH"
  # echo "The path $NEW_PATH has been added to the PATH."
  echo "export PATH=\$PATH:$NEW_PATH" >> ~/.bashrc
  # echo "The path $NEW_PATH has been added to ~/.bashrc to be permanent."
fi


echo "Use cleanip to check if your network is clean or not."


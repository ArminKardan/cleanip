#!/bin/bash
output_script="/usr/local/bin/cleanip"

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


echo "Use cleanip to check if your network is clean or not."


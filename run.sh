URL="https://download.docker.com/linux/ubuntu/gpg"
STATUS=$(curl -o /dev/null -s -w "%{http_code}\n" "$URL")
if [ "$STATUS" -eq 200 ]; then
  echo "Hooray! Your Network IP is clean (Status: $STATUS)."
else
  echo "Network is dirty (Status: $STATUS)."
fi
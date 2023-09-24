key="-H 'X-API-Key: '"
filename="manifest.json"
jq -r '.files[] | "\(.fileID) \(.projectID)"' $filename | while read -r fileID projectID; do
  url="https://api.curseforge.com/v1/mods/$projectID/files/$fileID/download-url"
  echo curl $key $url
  response=$(bash -c "curl -s $key $url")
  url2=$(jq -r '.data' <<< "$response")
  wget "$url2"
  done

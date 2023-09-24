key="-H 'X-API-Key: '"
filename="manifest.json"
jq -r '.files[] | "\(.fileID) \(.projectID)"' $filename | while read -r fileID projectID; do
  url="https://api.curseforge.com/v1/mods/$projectID/files/$fileID/download-url"
  echo curl $key $url
  response=$(bash -c "curl -s $key $url")
  url2=$(jq -r '.data' <<< "$response")
  wget "$url2"
  done
#jq -r '.files[] | "\(.fileID) \(.projectID)"' manifest.json | while read -r fileID projectID; do
#  url="https://api.curseforge.com/v1/mods/$projectID/files/$fileID/download-url"
#  response=$(curl -s -H 'X-API-Key: $2a$10$4yDFw3z3VkaVud7OskK.DOd5d8yByzliIq0vJdeTTjV1cMshQBuIu' $url )
#  url2=$(jq -r '.data' <<< "$response")
#  wget "$url2"
#  
#done
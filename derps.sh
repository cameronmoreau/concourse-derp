#/bin/bash

DATA=$(curl -A 'random' https://api.reddit.com/r/animalsbeingderps/new.json | jq .data.children[$(( ( RANDOM % 24 )  + 0 ))].data)
MEDIA=$(echo $DATA | jq -r .media.reddit_video.fallback_url)
URL=$(echo $DATA | jq -r .url)
FINAL_LINK=""


if [ $MEDIA != "null" ]; then
    FINAL_LINK=$MEDIA
else
    FINAL_LINK=$URL
fi

curl -X POST --data-urlencode "payload={\"text\": \"Done :dog: :cat:!\n<$FINAL_LINK>\"}" https://hooks.slack.com/services/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
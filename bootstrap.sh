#!/bin/bash

ADDR=${DOTVIS_SERVE_HOST:-localhost}
name=$1
echo "Project name: $name"
tmpfile=$(mktemp /tmp/layout.XXXXXX)
cat -> $tmpfile
sed -i "13i\ \ disableHostCheck: true," /opt/dotvis/pm/dev-server.js
echo "export default { dataUrl: '//$ADDR:8000/' };" > /opt/dotvis/pm/src/config.js
mkdir -p /opt/dotvis/data-stage/
cd /opt/dotvis/dot2pm && node layout.js $tmpfile
rm $tmpfile
# there's some bug in Pm or in the generated manifest, but the URL Pm is trying to hit always
# ends up being 'undefined' so accomodate for now
mkdir -p /opt/dotvis/data/$name/undefined
cp /opt/dotvis/data-stage/* /opt/dotvis/data/$name/undefined
cp /opt/dotvis/dot2pm/data/* /opt/dotvis/data/$name/undefined
echo '{"latest": "'$name'"}' > /opt/dotvis/data/$name/manifest.json
cd /opt/dotvis/data && python3 serve.py 8000 &
echo "Serving ... now access your graph at http://$ADDR:8081/#/galaxy/$name"
cd /opt/dotvis/pm && npm build
exec npm start 1>/dev/null

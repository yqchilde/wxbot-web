#!/bin/bash

cd wxbot-web || exit
version=$(git describe --abbrev=0 --tags)
sed -i -e "s/0.0.0/${version:1}/g" package.json
cat package.json

npm install
npm run build
cp -r dist ../
cd ../

mkdir compress
tar -czvf compress/wxbot-web.tar.gz -C dist/ .
rm -rf dist

#!/bin/bash

# 构建版本
cd wxbot-web || exit
version=$(git describe --abbrev=0 --tags)
sed -i -e "s/0.0.0/${version:1}/g" package.json
cat package.json

# 打包
npm install
npm run build
cp -r dist ../
cd ../

# 提交dist
cd web-dist || exit
find . \( -name "*.ico" -o -name "*.js" -o -name "*.css" -o -name "*.html" \) -type f -delete
cp -r ../dist/* .
git add .
git config --local user.name "yqchilde"
git config --local user.email "yqchilde@gmail.com"
git commit --allow-empty -m "feat: upload ${version} dist files" -a
git tag -a "$version" -m "release ${version}"
cd ../

# 压缩
mkdir compress
tar -czvf compress/wxbot-web.tar.gz -C dist/ .
rm -rf dist

#!/bin/sh

GIT_DEPLOY_REPO=git@github.com:meriadec/CSSBros.git
SITE_FOLDER=gh-pages

echo '> Cleaning old dist'
rm -rf $SITE_FOLDER
mkdir $SITE_FOLDER

echo '> Building'
cp -r site/* $SITE_FOLDER

echo '> Deploying'
cd $SITE_FOLDER && \
  echo '  - init deploy...' && \
  git init > /dev/null && \
  echo '  - adding files...' && \
  git add . > /dev/null && \
  echo '  - committing...' && \
  git commit -m "Deploy to GitHub Pages" > /dev/null && \
  echo '  - deploying to github...' && \
  git push --force "${GIT_DEPLOY_REPO}" master:gh-pages > /dev/null 2> /dev/null && \
  echo '> Done! open http://meriadec.github.io/CSSBros/'

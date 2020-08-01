#!/bin/sh
# Adapted from: https://gist.github.com/willprice/e07efd73fb7f13f917ea

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

copy_file() {
    cp test/dcm_dict.jl ./dcm_dict.jl
}

commit_file() {
  git checkout -b dcm_dict
  git add dcm_dict.jl
  git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
}

push_to_github() {
  git remote add origin-pages https://${GH_TOKEN}@github.com/notZaki/DICOM_Dictionary.jl > /dev/null 2>&1
  git push --quiet --set-upstream origin-pages dcm_dict
}

setup_git
copy_file
commit_file
push_to_github

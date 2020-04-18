#!/usr/bin/env bash

set -e
set -x

CURRENT_BRANCH="master"

function split()
{
    SHA1=`./bin/splitsh-lite --prefix=$1`
    git push $2 "$SHA1:refs/heads/$CURRENT_BRANCH" -f
}

function remote()
{
    git remote add $1 $2 || true
}

git pull origin ${CURRENT_BRANCH}

remote api git@github.com:percymamedy-wq/Api-Demo-MonoRepo.git
remote app git@github.com:percymamedy-wq/App-Demo-MonoRepo.git
remote trans git@github.com:percymamedy-wq/Translations-Demo-MonoRepo.git

split 'api' api
split 'app' app
split 'api/resources/lang' trans

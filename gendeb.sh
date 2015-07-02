#!/bin/bash

set -e

git clone http://github.com/tork-a/spur-release /tmp/tmp.gendeb.$$/super-release
cd /tmp/tmp.gendeb.$$/super-release
for pkg in spur spur_2dnav spur_bringup spur_controller spur_description spur_gazebo; 
do
    git checkout debian/indigo/trusty/$pkg
    ls -al 
    git-buildpackage -uc -us --git-ignore-branch --git-ignore-new
    git clean -xfd
    git checkout master
done
echo "deb files are generated under /tmp/tmp.gendeb.$$/"
ls -al /tmp/tmp.gendeb.$$/*.deb

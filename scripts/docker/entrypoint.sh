#!/bin/sh

current_dir=$PWD

cd ../../client/
yarn start &
cd $current_dir
cd ../../server
yarn start 
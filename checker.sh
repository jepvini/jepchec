#!/usr/bin/env bash

if [ -z "$1" ];
then
  echo "provide the folder name"
  exit
fi

for dir in "$1"/*/*/
do
  echo "$dir"
  songs="$(find "$dir" -maxdepth 1 -type f)"
  songs="$(echo "$songs" | sed 's/\/\//\//')" # in could terminate with a /
  flac -wt "$dir"*.flac
  if [ ! $? ];
  then
    echo "err"
  fi
done

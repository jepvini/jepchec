#!/usr/bin/env bash

if [ -z "$1" ];
then
  echo "provide the folder name"
  exit
fi

if [ "$1" = "-a" ];
then
  if [ -z "$2" ];
  then
    echo "provide the folder"
    exit
  fi
  for dir in "$2"/*/*
  do
    files=( "$dir"/*.flac )
    if [ "$(echo "$files" | grep "jpeg")" ];
    then
      continue
    elif [ "$(echo "$files" | grep "dsf")" ];
    then
      continue
    fi
    echo "$dir"
    flac -wts "$files"
  done
  exit
fi

for dir in "$1"/*/*/
do
  echo "$dir"
  songs="$(find "$dir" -maxdepth 1 -type f)"
  songs="$(echo "$songs" | sed 's/\/\//\//')" # in could terminate with a /
  flac -wt "$dir"*.flac
done

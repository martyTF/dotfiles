#!/usr/bin/env bash
ARTIST=$(playerctl metadata | grep "artist " | sed 's/'.*':artist *//')
TRACK=$(playerctl metadata | grep "title " | sed 's/'.*':title *//')
echo '{"text": "'$ARTIST - $TRACK'"}'

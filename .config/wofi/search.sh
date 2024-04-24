#!/usr/bin/env bash


searchterm=$(printf "" | wofi --conf=$HOME/.config/wofi/config_searchterm --style=$HOME/.config/wofi/style.css)

searchproviders="Ecosia YouTube Reddit"

searchprovider=$(printf '%s\n' $searchproviders | wofi --conf=$HOME/.config/wofi/config_searchprovider --style=$HOME/.config/wofi/style.css | awk '{print tolower($1)}')

case $searchprovider in
    youtube)
        firefox https://watch.marty.tf/search?q="$searchterm";;
    ecosia)
        firefox https://www.ecosia.org/search?q="$searchterm";;
    reddit)
        firefox https://libreddit.marty.tf/search?q="$searchterm";;

esac

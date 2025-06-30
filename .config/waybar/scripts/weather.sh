#!/bin/bash

# Use "Welcome, NC" as the location
LOCATION="Welcome,NC"

# Fetch the weather data and parse it
weather=$(curl -s "https://wttr.in/$LOCATION?format=j1")

if [ -z "$weather" ]; then
    echo "{\"text\":\"  N/A\", \"tooltip\":\"Weather service unavailable\"}"
    exit 1
fi

condition=$(echo "$weather" | jq -r '.current_condition[0].weatherDesc[0].value')
temp_f=$(echo "$weather" | jq -r '.current_condition[0].temp_F')
feels_like_f=$(echo "$weather" | jq -r '.current_condition[0].FeelsLikeF')

# See https://github.com/chubin/wttr.in/blob/master/share/weather-symbols-nerd-font-v2.txt
weather_icon="?"
case $(echo "$condition" | tr '[:upper:]' '[:lower:]') in
    "sunny"|"clear")
        weather_icon=""
        ;;
    "partly cloudy")
        weather_icon=""
        ;;
    "cloudy")
        weather_icon=""
        ;;
    "overcast")
        weather_icon=""
        ;;

    "mist"|"fog")
        weather_icon=""
        ;;
    "patchy rain possible"|"patchy light drizzle"|"light drizzle"|"patchy light rain"|"light rain"|"light rain shower")
        weather_icon="🌦"
        ;;
    "moderate rain at times"|"moderate rain"|"heavy rain at times"|"heavy rain"|"moderate or heavy rain shower"|"torrential rain shower")
        weather_icon="🌧"
        ;;
    "patchy snow possible"|"patchy light snow"|"light snow")
        weather_icon="🌨"
        ;;
    "moderate snow"|"patchy moderate snow"|"heavy snow"|"patchy heavy snow")
        weather_icon="❄"
        ;;
    "ice pellets"|"light sleet"|"moderate or heavy sleet")
        weather_icon=""
        ;;
    "thundery outbreaks possible"|"patchy light rain with thunder"|"moderate or heavy rain with thunder")
        weather_icon="⛈"
        ;;
    *)
        weather_icon="" # Default icon
        ;;
esac


echo "{\"text\":\"$weather_icon  $temp_f°F\", \"tooltip\":\"$condition. Feels like $feels_like_f°F\"}"

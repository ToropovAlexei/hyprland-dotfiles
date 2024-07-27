#!/usr/bin/env python

import json
import requests
from datetime import datetime

def get_color_from_temperature(temperature):
    clamped_temperature = max(min(temperature, 30), -30)

    min_temperature = -30
    max_temperature = 30

    min_color = "#89b4fa"
    max_color = "#f3e670"

    proportion = (clamped_temperature - min_temperature) / (max_temperature - min_temperature)

    r1, g1, b1 = int(min_color[1:3], 16), int(min_color[3:5], 16), int(min_color[5:7], 16)
    r2, g2, b2 = int(max_color[1:3], 16), int(max_color[3:5], 16), int(max_color[5:7], 16)

    r = int(r1 + proportion * (r2 - r1))
    g = int(g1 + proportion * (g2 - g1))
    b = int(b1 + proportion * (b2 - b1))

    color = f"#{r:02x}{g:02x}{b:02x}"

    return color

WEATHER_CODES = {
    '113': '☀️',
    '116': '⛅',
    '119': '☁️',
    '122': '☁️',
    '143': '☁️',
    '176': '🌧️',
    '179': '🌧️',
    '182': '🌧️',
    '185': '🌧️',
    '200': '⛈️',
    '227': '🌨️',
    '230': '🌨️',
    '248': '☁️',
    '260': '☁️',
    '263': '🌧️',
    '266': '🌧️',
    '281': '🌧️',
    '284': '🌧️',
    '293': '🌧️',
    '296': '🌧️',
    '299': '🌧️',
    '302': '🌧️',
    '305': '🌧️',
    '308': '🌧️',
    '311': '🌧️',
    '314': '🌧️',
    '317': '🌧️',
    '320': '🌨️',
    '323': '🌨️',
    '326': '🌨️',
    '329': '❄️',
    '332': '❄️',
    '335': '❄️',
    '338': '❄️',
    '350': '🌧️',
    '353': '🌧️',
    '356': '🌧️',
    '359': '🌧️',
    '362': '🌧️',
    '365': '🌧️',
    '368': '🌧️',
    '371': '❄️',
    '374': '🌨️',
    '377': '🌨️',
    '386': '🌨️',
    '389': '🌨️',
    '392': '🌧️',
    '395': '❄️'
}

data = {}


weather = requests.get("https://wttr.in/?format=j1").json()


def format_time(time):
    return time.replace("00", "").zfill(2)


def format_temp(temp):
    return (hour['tempC']+"°").ljust(3)


def format_chances(hour):
    chances = {
        "chanceoffog": "Fog",
        "chanceoffrost": "Frost",
        "chanceofovercast": "Overcast",
        "chanceofrain": "Rain",
        "chanceofsnow": "Snow",
        "chanceofsunshine": "Sunshine",
        "chanceofthunder": "Thunder",
        "chanceofwindy": "Wind"
    }

    conditions = []
    for event in chances.keys():
        if int(hour[event]) > 0:
            conditions.append(chances[event]+" "+hour[event]+"%")
    return ", ".join(conditions)

tempint = int(weather['current_condition'][0]['temp_C'])
icon = WEATHER_CODES[weather['current_condition'][0]['weatherCode']]


data['text'] = f"<span color='{get_color_from_temperature(tempint)}'>{icon} {tempint}°</span>"

data['tooltip'] = f"<b>{weather['current_condition'][0]['weatherDesc'][0]['value']} {tempint}°</b>\n"
data['tooltip'] += f"Feels like: {tempint}°\n"
data['tooltip'] += f"Wind: {weather['current_condition'][0]['windspeedKmph']}Km/h\n"
data['tooltip'] += f"Humidity: {weather['current_condition'][0]['humidity']}%\n"
for i, day in enumerate(weather['weather']):
    data['tooltip'] += f"\n<b>"
    if i == 0:
        data['tooltip'] += "Today, "
    if i == 1:
        data['tooltip'] += "Tomorrow, "
    data['tooltip'] += f"{day['date']}</b>\n"
    data['tooltip'] += f"⬆️ {day['maxtempF']}° ⬇️ {day['mintempF']}° "
    data['tooltip'] += f"🌅 {day['astronomy'][0]['sunrise']} 🌇 {day['astronomy'][0]['sunset']}\n"
    for hour in day['hourly']:
        if i == 0:
            if int(format_time(hour['time'])) < datetime.now().hour-2:
                continue
        data['tooltip'] += f"{format_time(hour['time'])} {WEATHER_CODES[hour['weatherCode']]} {format_temp(hour['tempC'])} {hour['weatherDesc'][0]['value']}, {format_chances(hour)}\n"


print(json.dumps(data))
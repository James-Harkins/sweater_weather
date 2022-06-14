# Sweater Weather

## Overview

Sweater Weather is a 4-day project assigned during Module 3 of Turing's Back-End Engineering program. Using Ruby on Rails, the API app exposes various endpoints for a hypothetical front-end application, which will allow users to see the current weather as well as the forecasted weather at the destination.

## Learning Goals

* Expose an API for CRUD functionality for Users in the database, which includes an authentication token
* Expose an API that aggregates data from multiple external API endpoints into single endpoints
* Research, select, and consume an API based on one's needs as a developer

## Endpoints

### Forecast

<<<<<<< HEAD
`GET /api/v1/forecast`

This endpoint returns a weather forecast for some location, including the current weather, daily weather for the next five days, and hourly weather for the next eight hours. It requires one query parameter, `location`, which should be a String containing a city and state separated by a comma, e.g., "denver,co".

Example response:
=======
`GET /api/v1/forecast` 

This endpoint returns a weather forecast for some location, including the current weather, daily weather for the next five days, and hourly weather for the next eight hours. It requires one query parameter, `location`, which should be a String containing a city and state separated by a comma, e.g., "denver,co".

Example response: 
>>>>>>> 9bbe698ea91215e86ef4cde67034118c48d5a39f

```ruby
{
    "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "datetime": "2022-06-14T16:03:43.000-06:00",
                "sunrise": "2022-06-14T05:31:26.000-06:00",
                "sunset": "2022-06-14T20:29:10.000-06:00",
                "temperature": 83.25,
                "feels_like": 80.83,
                "humidity": 22,
                "uvi": 4.75,
                "visibility": 10000,
                "conditions": "scattered clouds",
                "icon": "03d"
            },
            "daily_weather": [
                {
                    "date": "2022-06-15T13:00:00.000-06:00",
                    "sunrise": "2022-06-15T05:31:27.000-06:00",
                    "sunset": "2022-06-15T20:29:34.000-06:00",
                    "max_temp": 87.67,
                    "min_temp": 57.18,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "date": "2022-06-16T13:00:00.000-06:00",
                    "sunrise": "2022-06-16T05:31:29.000-06:00",
                    "sunset": "2022-06-16T20:29:55.000-06:00",
                    "max_temp": 94.44,
                    "min_temp": 65.21,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "date": "2022-06-17T13:00:00.000-06:00",
                    "sunrise": "2022-06-17T05:31:33.000-06:00",
                    "sunset": "2022-06-17T20:30:15.000-06:00",
                    "max_temp": 96.13,
                    "min_temp": 70.36,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "date": "2022-06-18T13:00:00.000-06:00",
                    "sunrise": "2022-06-18T05:31:39.000-06:00",
                    "sunset": "2022-06-18T20:30:34.000-06:00",
                    "max_temp": 97.43,
                    "min_temp": 71.62,
                    "conditions": "scattered clouds",
                    "icon": "03d"
                },
                {
                    "date": "2022-06-19T13:00:00.000-06:00",
                    "sunrise": "2022-06-19T05:31:47.000-06:00",
                    "sunset": "2022-06-19T20:30:50.000-06:00",
                    "max_temp": 92.89,
                    "min_temp": 69.12,
                    "conditions": "clear sky",
                    "icon": "01d"
                }
            ],
            "hourly_weather": [
                {
                    "time": "16:00",
                    "temperature": 83.25,
                    "conditions": "scattered clouds",
                    "icon": "03d"
                },
                {
                    "time": "17:00",
                    "temperature": 83.44,
                    "conditions": "scattered clouds",
                    "icon": "03d"
                },
                {
                    "time": "18:00",
                    "temperature": 83.55,
                    "conditions": "few clouds",
                    "icon": "02d"
                },
                {
                    "time": "19:00",
                    "temperature": 82.72,
                    "conditions": "few clouds",
                    "icon": "02d"
                },
                {
                    "time": "20:00",
                    "temperature": 79.54,
                    "conditions": "few clouds",
                    "icon": "02d"
                },
                {
                    "time": "21:00",
                    "temperature": 72.55,
                    "conditions": "clear sky",
                    "icon": "01n"
                },
                {
                    "time": "22:00",
                    "temperature": 68.13,
                    "conditions": "clear sky",
                    "icon": "01n"
                },
                {
                    "time": "23:00",
                    "temperature": 64.58,
                    "conditions": "clear sky",
                    "icon": "01n"
                }
            ]
        }
    }
}
```

### Backgrounds

<<<<<<< HEAD
`GET /api/v1/backgrounds`

This endpoint returns data for some background image of the desired location. It requires one query parameter, `location`, which should be a String containing a city and state separated by a comma, e.g., "denver,co".

Example response:
=======
`GET /api/v1/backgrounds` 

This endpoint returns data for some background image of the desired location. It requires one query parameter, `location`, which should be a String containing a city and state separated by a comma, e.g., "denver,co". 

Example response: 
>>>>>>> 9bbe698ea91215e86ef4cde67034118c48d5a39f

```ruby
{
    "data": {
        "type": "image",
        "id": null,
        "attributes": {
            "image": {
                "location": "denver,co",
                "image_url": "https://images.unsplash.com/photo-1602967689755-6bc05c2d3c5b?crop=entropy&cs=tinysrgb&fm=jpg&ixid=MnwzMzY1Mzh8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjbyUyQ3NreWxpbmV8ZW58MHwwfHx8MTY1NTIzNTY2OA&ixlib=rb-1.2.1&q=80",
                "credit": {
                    "source": "Unsplash",
                    "photographer_info": {
                        "name": "Acton Crawford",
                        "username": "acton_crawford",
                        "link": "https://api.unsplash.com/users/acton_crawford"
                    }
                }
            }
        }
    }
}
```

### Users

<<<<<<< HEAD
`POST /api/v1/users`

This endpoint creates a new `User` entry in the database when successful parameters are passed through, and returns the `email` attribute of that new `User` and a newly-generated `api_key`. It requires three parameters, which should be passed in as a raw json payload in the body of the request:
=======
`POST /api/v1/users` 

This endpoint creates a new `User` entry in the database when successful parameters are passed through, and returns the `email` attribute of that new `User` and a newly-generated `api_key`. It requires three parameters, which should be passed in as a raw json payload in the body of the request: 
>>>>>>> 9bbe698ea91215e86ef4cde67034118c48d5a39f
```ruby
{
  "email": "whatever@example.com",
  "password": "password",
  "password_confirmation": "password"
}
```

<<<<<<< HEAD
Example response:
=======
Example response: 
>>>>>>> 9bbe698ea91215e86ef4cde67034118c48d5a39f

```ruby
{
    "data": {
        "id": "2",
        "type": "users",
        "attributes": {
            "email": "whatever@example.com",
            "api_key": "e5e46dde00803382a2b3"
        }
    }
}
```

### Sessions

<<<<<<< HEAD
`POST /api/v1/sessions`

This endpoint locates some `User` entry in the database when successfully authenticated, and returns the `email` attribute of that `User` their `api_key`. It requires two parameters, which should be passed in as a raw json payload in the body of the request:
=======
`POST /api/v1/sessions` 

This endpoint locates some `User` entry in the database when successfully authenticated, and returns the `email` attribute of that `User` their `api_key`. It requires two parameters, which should be passed in as a raw json payload in the body of the request: 
>>>>>>> 9bbe698ea91215e86ef4cde67034118c48d5a39f
```ruby
{
  "email": "whatever@example.com",
  "password": "password"
}
```

<<<<<<< HEAD
Example response:
=======
Example response: 
>>>>>>> 9bbe698ea91215e86ef4cde67034118c48d5a39f

```ruby
{
    "data": {
        "id": "2",
        "type": "users",
        "attributes": {
            "email": "whatever@example.com",
            "api_key": "e5e46dde00803382a2b3"
        }
    }
}
```

### Road Trip

<<<<<<< HEAD
`POST /api/v1/road_trip`

This endpoint returns data for a Road Trip from some origin to some destination, including the travel time and the weather at destination. It requires three parameters, which should be passed in as a raw json payload in the body of the request:
=======
`POST /api/v1/road_trip` 

This endpoint returns data for a Road Trip from some origin to some destination, including the travel time and the weather at destination. It requires three parameters, which should be passed in as a raw json payload in the body of the request: 
>>>>>>> 9bbe698ea91215e86ef4cde67034118c48d5a39f
```ruby
{
  "origin": "Denver, CO",
  "destination": "Pueblo, CO",
  "api_key": "e5e46dde00803382a2b3"
}
```

<<<<<<< HEAD
Example response:
=======
Example response: 
>>>>>>> 9bbe698ea91215e86ef4cde67034118c48d5a39f

```ruby
{
    "data": {
        "id": null,
        "type": "roadtrip",
        "attributes": {
            "start_city": "Denver, CO",
            "end_city": "Pueblo, CO",
            "travel_time": "1 hour(s) and 45 minutes",
            "weather_at_eta": {
                "temperature": "93.51 F",
                "conditions": "clear sky"
            }
        }
    }
}
```

## Database Schema

![image](https://user-images.githubusercontent.com/93609855/173699247-1a7fe460-104c-471f-aa4e-42d5cf67db94.png)

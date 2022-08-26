import 'package:flutter/foundation.dart';

class Met_Model {
  final String icoMet;
  final String Desc;
  final double temp;

  Met_Model({required this.icoMet, required this.Desc, required this.temp});

  factory Met_Model.fromJson(Map<String, dynamic> JsonData) {
    return Met_Model(
      icoMet: JsonData['icon'],
      Desc: JsonData['description'],
      temp: JsonData['temp'],
    );
  }
 
 
  // Met_Model mm = Met_Model.fromJson({
  //   "coord": {"lon": -9.5982, "lat": 30.4202},
  //   "weather": [
  //     {
  //       "id": 803,
  //       "main": "Clouds",
  //       "description": "broken clouds",
  //       "icon": "04d"
  //     }
  //   ],
  //   "base": "stations",
  //   "main": {
  //     "temp": 27.25,
  //     "feels_like": 28.32,
  //     "temp_min": 27.25,
  //     "temp_max": 27.25,
  //     "pressure": 1011,
  //     "humidity": 59,
  //     "sea_level": 1011,
  //     "grnd_level": 1008
  //   },
  //   "visibility": 10000,
  //   "wind": {"speed": 2.49, "deg": 207, "gust": 3.34},
  //   "clouds": {"all": 77},
  //   "dt": 1661445524,
  //   "sys": {
  //     "type": 1,
  //     "id": 2393,
  //     "country": "MA",
  //     "sunrise": 1661407869,
  //     "sunset": 1661454620
  //   },
  //   "timezone": 3600,
  //   "id": 2561668,
  //   "name": "Agadir",
  //   "cod": 200
  // });

  
}


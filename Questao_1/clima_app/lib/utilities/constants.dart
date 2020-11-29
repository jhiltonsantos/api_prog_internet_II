import 'package:flutter/material.dart';

const apiKey = 'b05124d95faebf72fd97a662c3f297d6';
const openWeatherMap = 'https://api.openweathermap.org/data/2.5/weather';

const kTempTextStyle = TextStyle(
  fontFamily: 'Roboto-Bold',
  fontSize: 80.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Roboto-Bold',
  fontSize: 35.0,
);

const kButtonTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 37.0,
  fontFamily: 'Roboto-Bold',
  fontWeight: FontWeight.w300
);

const kConditionTextStyle = TextStyle(
  fontSize: 80.0,
);

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.black12,
  icon: Icon(
    Icons.map,
    color: Colors.white,
  ),
  hintText: 'Nome da Cidade...',
  hintStyle: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
    borderSide: BorderSide.none,
  ),
);

const kTextDateFormat = TextStyle(
  fontSize: 20.0,
  fontFamily: 'RobotoRegular'
);

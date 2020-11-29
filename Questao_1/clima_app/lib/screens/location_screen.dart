import 'package:climaapp/screens/loading_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:climaapp/utilities/constants.dart';
import 'package:climaapp/services/weather.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});

  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();

  int temperature;
  String weatherIcon;
  String city;
  String message;
  int condition;

  DateTime now = DateTime.now();
  String formattedDate;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        message = 'Sem dados de clima';
        city = '';
        return;
      }
      temperature = (weatherData['main']['temp']).toInt();
      city = weatherData['name'];
      condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      message = weather.getMessage(temperature);
    });
  }

  @override
  Widget build(BuildContext context) {
    formattedDate = DateFormat('EEE d MMM').format(now);

    String backgroundImage() {
      int hour = now.hour.toInt();
      if (condition < 600) {
        return 'images/nublado.jpg';
      } else {
        if (hour >= 6 && hour <= 18) {
          return 'images/ensolarado.jpg';
        } else {
          return 'images/noite.jpg';
        }
      }
    }

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(backgroundImage()),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.8), BlendMode.dstATop),
            ),
          ),
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: FlatButton(
                          onPressed: () async {
                            var weatherData =
                                await weather.getLocationWeather();
                            updateUI(weatherData);
                          },
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.near_me,
                              color: Colors.white,
                              size: 30.0,
                            ),
                          ),
                          color: Colors.black12,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(50.0))),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                          onPressed: () async {
                            var typedName = await Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return CityScreen();
                            }));

                            if (typedName != null) {
                              var weatherData =
                                  await weather.getCityWeather(typedName);
                              updateUI(weatherData);
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.map,
                              color: Colors.white,
                              size: 30.0,
                            ),
                          ),
                          color: Colors.black12,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(50.0))),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                  child: Text('$formattedDate', style: kTextDateFormat),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        '$temperature°',
                        style: kTempTextStyle,
                      ),
                      Text(
                        '$weatherIcon',
                        style: kConditionTextStyle,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SizedBox(),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "$message em $city!",
                    textAlign: TextAlign.right,
                    style: kMessageTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Você tem certeza?'),
            content: new Text('Você irá sair da aplicação'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: new Text('Não'),
              ),
              new FlatButton(
                onPressed: () {
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                },
                child: new Text('Sim'),
              ),
            ],
          ),
        ) ??
        false;
  }
}

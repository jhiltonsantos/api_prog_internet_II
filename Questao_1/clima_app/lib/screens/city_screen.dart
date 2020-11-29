import 'dart:math';

import 'package:flutter/material.dart';
import 'package:climaapp/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  final _random = new Random();

  int next() => _random.nextInt(7);

  String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/home${next()}.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 30.0,
                            ),
                          ),
                          color: Colors.black12,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(50.0))),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Obter Cidade',
                        style: kButtonTextStyle,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  decoration: kTextFieldInputDecoration,
                  onChanged: (value) {
                    cityName = value;
                  },
                ),
              ),
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context, cityName);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(Icons.search),
                  ),
                  color: Colors.black12,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(50.0))),
            ],
          ),
        ),
      ),
    );
  }
}

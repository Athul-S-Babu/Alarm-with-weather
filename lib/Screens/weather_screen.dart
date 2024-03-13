import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/weatherprovider.dart';

class WeatherScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent.shade400,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('Weather App'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Image.asset('images/cloc.gif'),
              SizedBox(height: 70),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (Provider.of<WeatherProvider>(context).weather != null)
                    Text(
                      'Temperature in ${Provider.of<WeatherProvider>(context).weather!.cityName}: ${Provider.of<WeatherProvider>(context).weather!.temperature.toStringAsFixed(1)}°C',
                      style: TextStyle(fontSize: 24),
                    ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(labelText: 'Enter a city'),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.redAccent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      await Provider.of<WeatherProvider>(context, listen: false)
                          .fetchWeather(_controller.text);
                    },
                    child: Text('Get Weather',
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:alarm_with_weather/Screens/weather_screen.dart';
import 'package:flutter/material.dart';

import 'alarm_screen.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white12,
        appBar: AppBar(
          title: Text('Alarm App with Weather'),
          backgroundColor: Colors.orange,
        ),
        body: Container(
          child: Column(
            children: [
              Image.asset('images/cloc.gif'),
              SizedBox(
                height: 70,
              ),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.lightBlue.shade300),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  child: Text('Alarm Screen',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      )),
                  onPressed: () {
                    // Navigate to the SecondScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AlarmScreen()),
                    );
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.yellowAccent),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  child: Text('Weather Screen',
                      style: TextStyle(color: Colors.black, fontSize: 15)),
                  onPressed: () {
                    // Navigate to the SecondScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WeatherScreen()),
                    );
                  },
                ),
              ]),
            ],
          ),
        ),
      ),

      title: 'Alarm App Weather',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Set HomeScreen as the default route
    );
  }
}

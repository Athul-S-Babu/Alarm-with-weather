import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/alarm_provider.dart';
import 'Provider/weatherprovider.dart';
import 'Screens/dashboard.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AlarmProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => WeatherProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    );
  }
}

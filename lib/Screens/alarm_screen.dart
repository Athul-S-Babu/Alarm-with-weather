import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../Provider/alarm_provider.dart';

class AlarmScreen extends StatelessWidget {
  const AlarmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text('Alarm App'),
      ),
      body: Consumer<AlarmProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.alarms.length,
            itemBuilder: (context, index) {
              final alarm = provider.alarms[index];
              return ListTile(
                title: Text('${alarm.hour}:${alarm.minute}'),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => provider.removeAlarm(alarm),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          );
          if (time != null) {
            final now = DateTime.now();
            final alarmTime =
                DateTime(now.year, now.month, now.day, time.hour, time.minute);
            Provider.of<AlarmProvider>(context, listen: false)
                .addAlarm(alarmTime);
          }
        },
        child: Icon(Icons.alarm),
      ),
    );
  }
}

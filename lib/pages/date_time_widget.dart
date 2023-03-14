import 'package:flutter/material.dart';

class DateTimeWidget extends StatefulWidget {
  const DateTimeWidget({Key? key}) : super(key: key);

  @override
  _DateTimeWidgetState createState() => _DateTimeWidgetState();
}

class _DateTimeWidgetState extends State<DateTimeWidget> {
  DateTime dateTime = DateTime.now();
  DateTime dateTimeInHM = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Date and Time',
                style: TextStyle(fontSize: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        final date = await pickDate();
                        if (date == null) {
                          return;
                        }
                        final newDatetime = DateTime(
                          dateTime.year,
                          dateTime.month,
                          dateTime.day,
                          // dateTime.hour,
                          // dateTime.minute,
                        );
                        setState(() {
                          dateTime = date;
                        });
                      },
                      child: Text(
                          '${dateTime.year}/${dateTime.month}/${dateTime.day}')),
                  const SizedBox(
                    width: 15,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        final time = await pickTime();
                        if (time == null) {
                          return;
                        }
                        final newDatetime = DateTime(
                          dateTime.year,
                          dateTime.month,
                          dateTime.day,
                          time.hour,
                          time.minute,
                        );
                        setState(() {
                          dateTime = newDatetime;
                        });
                      },
                      child: Text('${dateTime.hour}:${dateTime.minute}')),
                ],
              ),
              ElevatedButton(
                  onPressed: pickDateTime,
                  child: Text(
                      '${dateTimeInHM.year}/${dateTimeInHM.month}/${dateTimeInHM.day} ${dateTimeInHM.hour}:${dateTimeInHM.minute}'))
            ],
          ),
        ));
  }

  Future pickDateTime() async {
    DateTime? date = await pickDate();
    if (date == null) {
      return;
    }

    TimeOfDay? time = await pickTime();
    if (time == null) return;

    final dateTimeMin = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    setState(() {
      dateTimeInHM = dateTimeMin;
    });
  }

  Future<TimeOfDay?> pickTime() => showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
      );

  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100));
}

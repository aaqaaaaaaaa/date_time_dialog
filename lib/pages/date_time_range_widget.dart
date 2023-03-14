import 'package:flutter/material.dart';

class DateTimeRangeWidget extends StatefulWidget {
  const DateTimeRangeWidget({Key? key}) : super(key: key);

  @override
  _DateTimeRangeWidgetState createState() => _DateTimeRangeWidgetState();
}

class _DateTimeRangeWidgetState extends State<DateTimeRangeWidget> {
  DateTimeRange dateTimeRange =
      DateTimeRange(start: DateTime(2021, 11, 13), end: DateTime(2022, 12, 31));

  @override
  Widget build(BuildContext context) {
    final start = dateTimeRange.start;
    final end = dateTimeRange.end;
    final difference = dateTimeRange.duration;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Date Range',
            style: TextStyle(fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    flex: 3,
                    child: ElevatedButton(
                      child: Text('${start.year}/${start.month}/${start.day}'),

                      ///после загрузки бблиотеки intl  нужно
                      ///написать внутри текста DateFormat('yyyy/MM/dd').format(start);
                      onPressed: pickDateRange,
                    )),
                Expanded(child: Card()),
                Expanded(
                    flex: 3,
                    child: ElevatedButton(
                      child: Text('${end.year}/${end.month}/${end.day}'),

                      ///DateFormat('yyyy/MM/dd').format(end);
                      ///это нужно чтобы добавить 0 если число <10
                      onPressed: pickDateRange,
                    )),
              ],
            ),
          ),
          Text('Difference in days: ${difference.inDays}')
        ],
      ),
    );
  }

  Future pickDateRange() async {
    DateTimeRange? dateTime = await showDateRangePicker(
      context: context,
      initialDateRange: dateTimeRange,
      firstDate: DateTime(1990),
      lastDate: DateTime(2100),
    );
    if (dateTime == null) {
      return;
    }
    setState(() {
      dateTimeRange = dateTime;
    });
  }
}


































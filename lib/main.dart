import 'package:date_time_dialog/pages/date_time_range_widget.dart';
import 'package:date_time_dialog/pages/date_time_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;
  final pages = [
    const DateTimeWidget(),
    const DateTimeRangeWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: NavigationBar(
        height: 60,
        selectedIndex: index,
        onDestinationSelected: (index) => setState(() => this.index = index),
        animationDuration: const Duration(seconds: 3),
        destinations: const [
          NavigationDestination(
              selectedIcon: Icon(
                Icons.calendar_today,
              ),
              icon: Icon(Icons.calendar_today),
              label: 'Date'),
          NavigationDestination(
              selectedIcon: Icon(Icons.calendar_today_outlined),
              icon: Icon(Icons.calendar_today_outlined),
              label: 'Range Data')
        ],
      ),
    );
  }
}

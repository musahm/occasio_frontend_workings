import 'package:flutter/material.dart';
import 'package:occasio_frontend_workings/dependency_injection.dart'
    as dependency_injection;
import 'package:occasio_frontend_workings/features/dashboard/presentation/pages/dashboardScreen.dart';

void main() {
  dependency_injection.setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Dashboard(),
    );
  }
}

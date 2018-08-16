import 'package:flutter/material.dart';
import 'package:flutter_samples/views/api_page.dart';
import 'package:flutter_samples/views/main_page.dart';
import 'package:flutter_samples/views/tracker_page.dart';
import 'package:flutter_samples/views/anims_page.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter samples',
        theme: new ThemeData(
          primarySwatch: Colors.red,
        ),

        home: new MainPage(),
        routes: <String, WidgetBuilder>{
          '/TrackerPage': (BuildContext context) => new TrackerPage(),
          '/AnimsPage': (BuildContext context) => new AnimsPage(),
          '/ApiPage': (BuildContext context) => new ApiPage()
        });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_samples/view_models/main_page_view_model.dart';

class MainPage extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MainPage> {
  final _viewModel = new MainPageViewModel();

  @override
  Widget build(BuildContext context) {
    _viewModel.create(context);

    return new Scaffold(
        appBar: new AppBar(title: new Text(_viewModel.title)),
        body: buildLayout());
  }

  Widget buildLayout() {
    return Builder(builder: (context) {
      _viewModel.create(context);

      // Create and return your actual layout below
      var layout = new Column(children: <Widget>[
        new ListTile(
          leading: const Icon(Icons.location_on),
          title: new Text(
              "Tracker will track your location and calculate the distance you've walked."),
        ),
        new FlatButton(
          onPressed: _viewModel.openTracker,
          child: new Text("Open tracker"),
        ),
        const Divider(
          height: 1.0,
        )
      ]);

      return layout;
    });
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}

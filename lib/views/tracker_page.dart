import 'package:flutter/material.dart';
import 'package:flutter_samples/view_models/tracker_page_view_model.dart';

class TrackerPage extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<TrackerPage> {
  final _viewModel = new TrackerPageViewModel();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text(_viewModel.title)),
        body: buildLayout(),
        floatingActionButton: StreamBuilder<bool>(
            stream: _viewModel.enabled.stream,
            builder: (context, snapshot) {
              return new FloatingActionButton(
                  onPressed: _viewModel.onFabClick,
                  tooltip: 'Track',
                  child:
                      new Icon(snapshot.data ? Icons.stop : Icons.play_arrow));
            }));
  }

  Widget buildLayout() {
    return Builder(builder: (context) {
      _viewModel.create(context);

      // Create and return your actual layout below
      var layout = new Center(
          child: StreamBuilder<String>(
              stream: _viewModel.description.stream,
              builder: (context, snapshot) {
                return new Text(snapshot.data);
              }));

      return layout;
    });
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}

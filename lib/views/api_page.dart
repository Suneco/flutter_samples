import 'package:flutter/material.dart';
import 'package:flutter_samples/view_models/api_page_view_model.dart';

class ApiPage extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<ApiPage> {
  final _viewModel = new ApiPageViewModel();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text(_viewModel.title)),
        body: buildLayout());
  }

  Widget buildLayout() {
    return Builder(builder: (context) {
      _viewModel.create(context, this);

      // Create and return your actual layout below
      var layout = Center(
          child: FutureBuilder<dynamic>(
              future: _viewModel.fetchPost(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data['title']);
                }
                if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
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

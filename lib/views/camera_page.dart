import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_samples/view_models/camera_page_view_model.dart';

class CameraPage extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<CameraPage> {
  final _viewModel = new CameraPageViewModel();

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
      var layout = new Column(children: <Widget>[
        new ListTile(
          leading: const Icon(Icons.camera),
          title: new Text("Take a picture using your camera."),
        ),
        new FlatButton(
          onPressed: _viewModel.takePicture,
          child: new Text("Take picture"),
        ),
        const Divider(
          height: 1.0,
        ),
        new ListTile(
          leading: const Icon(Icons.photo),
          title: new Text("Pick a picture from your gallery."),
        ),
        new FlatButton(
          onPressed: _viewModel.pickPicture,
          child: new Text("Open gallery"),
        ),
        const Divider(
          height: 1.0,
        ),
        StreamBuilder<File>(
            stream: _viewModel.image.stream,
            builder: (context, snapshot) {
              var result = snapshot.data;
              if (result == null) {
                return new Text('No image selected.');
              }
              return new Image.file(result);
            })
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

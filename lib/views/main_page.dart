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
    _viewModel.create(context, this);

    return new Scaffold(
        appBar: new AppBar(title: new Text(_viewModel.title)),
        body: buildLayout(),
        // Drawer is the MasterDetail thingy
        drawer: Drawer(
            child: ListView(padding: EdgeInsets.zero, children: <Widget>[
          DrawerHeader(
              child: Text('I am your master'),
              decoration: BoxDecoration(color: Colors.redAccent)),
          ListTile(
              leading: const Icon(Icons.account_balance),
              title: Text('I am one of your items'),
              onTap: () {
                // Do something in the view model
                Navigator.pop(context);
              })
        ])));
  }

  Widget buildLayout() {
    return Builder(builder: (context) {
      _viewModel.create(context, this);

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
        ),
        new ListTile(
          leading: const Icon(Icons.accessibility),
          title: new Text("Anims will show some basic animations."),
        ),
        new FlatButton(
          onPressed: _viewModel.openAnims,
          child: new Text("Open anims"),
        ),
        const Divider(
          height: 1.0,
        ),
        new ListTile(
          leading: const Icon(Icons.settings_ethernet),
          title: new Text("API will make an API request and shows the results."),
        ),
        new FlatButton(
          onPressed: _viewModel.openApi,
          child: new Text("Open API"),
        ),
        const Divider(
          height: 1.0,
        ),
        new ListTile(
          leading: const Icon(Icons.camera_alt),
          title: new Text("Camera lets you take and browse pictures."),
        ),
        new FlatButton(
          onPressed: _viewModel.openCamera,
          child: new Text("Open Camera"),
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

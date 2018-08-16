import 'package:flutter/cupertino.dart';
import 'package:flutter_samples/view_models/cupertino_page_view_model.dart';

class CupertinoPage extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<CupertinoPage> {
  final _viewModel = new CupertinoPageViewModel();

  @override
  Widget build(BuildContext context) {
    return new CupertinoPageScaffold(
        child: new CustomScrollView(slivers: <Widget>[
      CupertinoSliverNavigationBar(
          largeTitle: Text(_viewModel.title), trailing: Text("Edit")),
      SliverFillRemaining(child: buildLayout())
    ]));
  }

  Widget buildLayout() {
    return Builder(builder: (context) {
      _viewModel.create(context, this);

      // Create and return your actual layout below
      var layout = Center(
          child: CupertinoButton(
              child: Text("Click me!"),
              color: CupertinoColors.activeBlue,
              onPressed: _viewModel.onClick));

      return layout;
    });
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}

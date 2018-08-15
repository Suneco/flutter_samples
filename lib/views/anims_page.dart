import 'package:flutter/material.dart';
import 'package:flutter_samples/view_models/anims_page_view_model.dart';

// https://github.com/salihgueler/flutter-animations/blob/master/lib/easinganimationwidget.dart

class AnimsPage extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<AnimsPage> with TickerProviderStateMixin {
  final _viewModel = new AnimsPageViewModel();

  @override
  Widget build(BuildContext context) {
    _viewModel.create(context, this);

    return new Scaffold(
        appBar: new AppBar(title: new Text(_viewModel.title)),
        body: buildLayout());
  }

  Widget buildLayout() {
    return Builder(builder: (context) {
      _viewModel.create(context, this);

      final double width = MediaQuery.of(context).size.width;
      _viewModel.controller.forward();

      // Create and return your actual layout below
      var layout = AnimatedBuilder(
          animation: _viewModel.controller,
          builder: (BuildContext context, Widget child) {
            return new AnimatedBuilder(
                animation: _viewModel.controller,
                builder: (BuildContext context, Widget child) {
                  return Scaffold(
                      body: Transform(
                          transform: Matrix4.translationValues(
                              _viewModel.animation.value * width, 0.0, 0.0),
                          // You can put your own layout here which will be animated
                          child: new Center(
                              child:
                                  new Text("I am some nice animated text"))));
                });
          });

      return layout;
    });
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}

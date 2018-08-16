import 'package:flutter/widgets.dart';
import 'package:flutter_samples/interfaces/view_model_base.dart';

class MainPageViewModel implements IViewModelBase {
  BuildContext context;
  final title = "Main";

  @override
  void create(BuildContext context, State state) {
    this.context = context;
  }

  @override
  void dispose() {
    context = null;
  }

  void openTracker() {
    Navigator.pushNamed(context, '/TrackerPage');
  }

  void openAnims() {
    Navigator.pushNamed(context, '/AnimsPage');
  }

  void openApi() {
    Navigator.pushNamed(context, '/ApiPage');
  }

  void openCamera() {
    Navigator.pushNamed(context, '/CameraPage');
  }

  void openCupertino() {
    Navigator.pushNamed(context, '/CupertinoPage');
  }
}

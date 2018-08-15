import 'package:flutter/widgets.dart';
import 'package:flutter_samples/interfaces/view_model_base.dart';

class MainPageViewModel implements IViewModelBase {
  BuildContext context;
  final title = "Main";

  @override
  void create(BuildContext context) {
    this.context = context;
  }

  @override
  void dispose() {
    context = null;
  }

  void openTracker() {
    Navigator.pushNamed(context, '/TrackerPage');
  }
}

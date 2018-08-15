import 'package:flutter/widgets.dart';
import 'package:flutter_samples/interfaces/view_model_base.dart';

class AnimsPageViewModel implements IViewModelBase {
  BuildContext context;
  final title = "Anims";

  AnimationController controller;
  Animation animation;

  @override
  void create(BuildContext context, State state) {
    this.context = context;

    controller = AnimationController(
        vsync: state as TickerProvider, duration: Duration(seconds: 4));

    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.elasticIn,
    ));
    animation.addStatusListener(handler);
  }

  void handler(status) {
    if (status == AnimationStatus.completed) {
      animation.removeStatusListener(handler);
      controller.reset();
      animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller,
        curve: Curves.elasticIn,
      ));
      animation.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.pop(context);
        }
      });
      controller.forward();
    }
  }

  @override
  void dispose() {
    context = null;
  }
}

import 'package:flutter/widgets.dart';

abstract class IViewModelBase {
  void create(BuildContext context, State state);
  void dispose();
}

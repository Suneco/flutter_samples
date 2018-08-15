import 'package:flutter/widgets.dart';

abstract class IViewModelBase {
  void create(BuildContext context);
  void dispose();
}

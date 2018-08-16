import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_samples/interfaces/view_model_base.dart';

class CupertinoPageViewModel implements IViewModelBase {
  BuildContext context;
  final title = "Cupertino";

  @override
  void create(BuildContext context, State state) {
    this.context = context;
  }

  void onClick() {
    showDialog(
        context: this.context,
        builder: (_) => new CupertinoAlertDialog(
                title: Text("Hi there!"),
                content: Text("I am some fancy alert dialog to notify you :)"),
                actions: <Widget>[
                  new CupertinoDialogAction(
                    child: Text("Cancel"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  new CupertinoDialogAction(
                      child: Text('Confirm'),
                      onPressed: () {
                        Navigator.pop(context);
                      })
                ]));
  }

  @override
  void dispose() {
    context = null;
  }
}

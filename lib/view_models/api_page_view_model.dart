import 'dart:async';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_samples/interfaces/view_model_base.dart';
import 'package:http/http.dart' as http;

class ApiPageViewModel implements IViewModelBase {
  BuildContext context;
  final title = "API";

  @override
  void create(BuildContext context, State state) {
    this.context = context;
  }

  Future<dynamic> fetchPost() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/posts/1');

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  void dispose() {
    this.context = null;
  }
}

import 'dart:async';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_samples/interfaces/view_model_base.dart';
import 'package:image_picker/image_picker.dart';

class CameraPageViewModel implements IViewModelBase {
  BuildContext context;
  final title = "Camera";

  final image = StreamController<File>.broadcast();

  @override
  void create(BuildContext context, State state) {
    this.context = context;
  }

  Future takePicture() async {
    var result = await ImagePicker.pickImage(source: ImageSource.camera);
    image.add(result);
  }

  Future pickPicture() async {
    var result = await ImagePicker.pickImage(source: ImageSource.gallery);
    image.add(result);
  }

  @override
  void dispose() {
    this.context = null;
    image.close();
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_samples/interfaces/view_model_base.dart';
import 'package:location/location.dart';
import 'package:flutter_samples/utils/geo_utils.dart';

class TrackerPageViewModel implements IViewModelBase {
  BuildContext _context;

  final title = "Tracker";
  final description = StreamController<String>.broadcast();

  final enabled = StreamController<bool>.broadcast();

  var _running = false;
  var _firstResult = true;
  var _currentDistance = 0.0;
  var _previousLng = 0.0;
  var _previousLat = 0.0;

  @override
  Future create(BuildContext context) async {
    _context = context;
    enabled.add(false);
    description.add("Page is loaded.");
  }

  void onFabClick() {
    if (_running) {
      enabled.add(false);

      _running = false;
      _firstResult = true;
      _currentDistance = 0.0;
      _previousLng = 0.0;
      _previousLat = 0.0;

      final snackBar = SnackBar(content: Text('Listening for updates stopped'));
      Scaffold.of(_context).showSnackBar(snackBar);
      return;
    }

    enabled.add(true);

    var location = new Location();

    location.onLocationChanged.listen((Map<String, double> currentLocation) {
      final snackBar = SnackBar(content: Text('Got location update!'));
      Scaffold.of(_context).showSnackBar(snackBar);

      var currentLat = currentLocation["latitude"];
      var currentLng = currentLocation["longitude"];

      if (!_firstResult) {
        var distance = GeoUtils.distanceInKmBetweenEarthCoordinates(
            currentLat, currentLng, _previousLat, _previousLng);

        _currentDistance += distance;
        description.add("Current walked distance is $_currentDistance km");
      } else {
        _firstResult = false;
      }

      _previousLat = currentLat;
      _previousLng = currentLng;
    });

    _running = true;

    final snackBar = SnackBar(content: Text('Listening for updates started'));
    Scaffold.of(_context).showSnackBar(snackBar);
  }

  @override
  void dispose() {
    _context = null;
    description.close();
  }
}

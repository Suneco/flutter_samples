import 'dart:async';
import 'dart:math';

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

  var _listener;
  var _running = false;
  var _firstResult = true;
  var _currentDistance = 0.0;
  var _previousLng = 0.0;
  var _previousLat = 0.0;

  @override
  Future create(BuildContext context, State state) async {
    _context = context;

    // For streams it's important to set initial values here
    enabled.add(false);
    description.add("Press the button below to start tracking.");
  }

  void onFabClick() {
    if (_running) {
      enabled.add(false);

      _listener?.cancel();
      _running = false;
      _firstResult = true;
      _currentDistance = 0.0;
      _previousLng = 0.0;
      _previousLat = 0.0;

      description.add("Press the button below to start tracking.");

      final snackBar = SnackBar(content: Text('Listening for updates stopped'));
      Scaffold.of(_context).showSnackBar(snackBar);
      return;
    }

    enabled.add(true);

    var location = new Location();
    _listener = location.onLocationChanged
        .listen((Map<String, double> currentLocation) {
      var currentLat = currentLocation["latitude"];
      var currentLng = currentLocation["longitude"];

      if (!_firstResult) {
        var distance = GeoUtils.distanceInKmBetweenEarthCoordinates(
            currentLat, currentLng, _previousLat, _previousLng);

        // round values to a precision with 2
        var factor = pow(10, 2);
        distance = (distance * factor).round() / factor;

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
    _running = false;
    description.close();
  }
}

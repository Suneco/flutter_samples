# Flutter Samples

This repository contains several useful elements for building
a new Flutter application. Currently the following examples
are included:

  - GPS distance tracker
  - Animations
  - API calls
  - Camera/Gallery interaction
  - iOS and Material design elements

## Architecture
This application contains a MVVM structure. Every `View` is
responsible for showing the UI, while a `ViewModel` delivers
data to the `View` and handles all business logic.

In this repo you will find all the views in the `/view` folder
and all `ViewModels` inside the `/view_models` folder.

The most important element being used to render the UI on 
changes is the `Stream` class. In a `ViewModel` you should
define a `StreamController` for every property that could be
changed in the business logic. When you want to change a
property in the `ViewModel`, you need to call `add()` on that
property. The UI will then automatically update that part of the
view structure.

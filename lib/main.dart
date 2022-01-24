import 'package:flutter/material.dart';
import 'package:weather_app/src/core/app.dart';
import 'package:weather_app/src/core/platforms/local_storage/local_storage.dart';

import './src/injector.dart' as i;

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await i.initializeDependencies();

  await i.injector<LocalStorage>().init();

  runApp(const App());
}


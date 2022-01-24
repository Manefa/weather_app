import 'package:flutter/material.dart';
import 'package:weather_app/src/core/app.dart';
import 'package:weather_app/src/core/platforms/local_storage/local_storage.dart';
import 'package:weather_app/src/core/platforms/simple_bloc_delegate.dart';
import 'package:bloc/bloc.dart';


import './src/injector.dart' as i;

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await i.initializeDependencies();
  Bloc.observer = SimpleBlocDelegate();
  await i.injector<LocalStorage>().init();

  runApp(const App());
}


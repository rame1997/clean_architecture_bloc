import 'package:clean_art_project/app.dart';
import 'package:clean_art_project/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  BlocOverrides.runZoned(
        () {
      runApp(const QuoteApp());
    },
    blocObserver: AppBlocObserver(),
  );
}
 
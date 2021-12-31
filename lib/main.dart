import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_event_approach/blocs/barrell.dart';
import 'package:flutter_event_approach/views/screen_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MultiBlocProvider(providers: [
          BlocProvider<ScreenHandlerBloc>(
              create: (BuildContext context) => ScreenHandlerBloc()),
          BlocProvider<AuthBloc>(
              create: (BuildContext context) => AuthBloc(
                  screenHandlerBloc:
                      BlocProvider.of<ScreenHandlerBloc>(context)))
        ], child: const ScreenHandler()));
  }
}

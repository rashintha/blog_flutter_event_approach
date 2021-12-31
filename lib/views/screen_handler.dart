import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_event_approach/blocs/screen/barrell.dart';
import 'package:flutter_event_approach/utils/barrell.dart';
import 'package:flutter_event_approach/views/home/home_screen.dart';
import 'package:flutter_event_approach/views/login/login_screen.dart';

class ScreenHandler extends StatefulWidget {
  const ScreenHandler({Key? key}) : super(key: key);

  @override
  _ScreenHandlerState createState() => _ScreenHandlerState();
}

class _ScreenHandlerState extends State<ScreenHandler> {
  late ScreenHandlerBloc _screenHandlerBloc;

  @override
  void initState() {
    super.initState();

    _screenHandlerBloc = BlocProvider.of<ScreenHandlerBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _screenHandlerBloc,
        builder: (BuildContext context, ScreenHandlerState screenHandlerState) {
          return Stack(children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: _primaryScreen(screenHandlerState),
            )
          ]);
        });
  }

  Widget _primaryScreen(ScreenHandlerState screenHandlerState) {
    if (screenHandlerState.screen == Screens.login) {
      return const LoginScreen();
    } else if (screenHandlerState.screen == Screens.home) {
      return const HomeScreen();
    }

    return const Text("No Screen");
  }
}

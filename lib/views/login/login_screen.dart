import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_event_approach/blocs/barrell.dart';
import 'package:flutter_event_approach/utils/barrell.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  late AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();

    _authBloc = BlocProvider.of<AuthBloc>(context);

    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder(
            bloc: _authBloc,
            builder: (BuildContext context, AuthState authState) {
              return Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Center(
                      child: Stack(
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Center(
                              child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 32),
                                  child: const Align(
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    ),
                                    alignment: Alignment.topCenter,
                                  ),
                                ),
                                TextFormField(
                                  controller: usernameController,
                                  textAlign: TextAlign.left,
                                  decoration: const InputDecoration(
                                      hintText: "User Name",
                                      hintStyle: TextStyle(
                                          color: Colors.black38, fontSize: 14),
                                      border: InputBorder.none),
                                ),
                                TextFormField(
                                  controller: passwordController,
                                  textAlign: TextAlign.left,
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                      hintText: "Password",
                                      hintStyle: TextStyle(
                                          color: Colors.black38, fontSize: 14),
                                      border: InputBorder.none),
                                ),
                                GestureDetector(
                                    child: const Text(
                                      "LOGIN",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onTap: () => {
                                          _authBloc.add(Login(
                                              username: usernameController.text,
                                              password:
                                                  passwordController.text))
                                        }),
                                authState.status == UserStatus.invalidUser
                                    ? Container(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: const Text(
                                          "Invalid User",
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      )
                                    : Container()
                              ],
                            ),
                          )))
                    ],
                  )));
            }));
  }
}

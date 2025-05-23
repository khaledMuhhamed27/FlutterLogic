import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_logic/auth/login/bloc/login_bloc.dart';
import 'package:flutter_logic/auth/login/repository/login_repo.dart';
import 'package:flutter_logic/auth/login/screen/login_screen.dart';
import 'package:flutter_logic/auth/login/service/login_service.dart';
import 'package:flutter_logic/auth/register/bloc/register_bloc.dart';
import 'package:flutter_logic/auth/register/repository/register_repo.dart';
import 'package:flutter_logic/auth/register/service/register_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // register
        BlocProvider(
          create: (context) => RegisterBloc(
            registerRepo: RegisterRepo(
              registerService: RegisterService(),
            ),
          ),
        ),
        // login
        BlocProvider(
          create: (context) => LoginBloc(
            loginRepo: LoginRepo(
              loginService: LoginService(),
            ),
          ),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const LoginScreen(),
      ),
    );
  }
}

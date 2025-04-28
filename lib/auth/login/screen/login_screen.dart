import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_logic/auth/login/bloc/login_bloc.dart';
import 'package:flutter_logic/auth/register/screen/register_screen.dart';
import 'package:flutter_logic/auth/widgets/form_field.dart';
import 'package:flutter_logic/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // obscure
  bool isVisibelity = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Login Screen",
          style: TextStyle(color: Colors.black54),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 20.0, left: 20.0, bottom: 70),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // login logo
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Image.asset(
                    "assets/images/login.png",
                    fit: BoxFit.contain,
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                ),
                // email Title
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Email",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                // email input
                FormFieldClass(
                  controller: emailController,
                  hittile: "Ex@gmail.com",
                  validator: (value) =>
                      value!.isEmpty ? "Email cannot be blank" : null,
                ),
                // space
                SizedBox(height: 20),
                // password Title
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Password",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                // password
                TextFormField(
                  // controller]
                  controller: passwordController,
                  validator: (value) =>
                      value!.isEmpty ? "Password cannot be blank" : null,
                  // Style
                  decoration: InputDecoration(
                    hintText: "password",
                    hintStyle: TextStyle(
                      color: Colors.blue.shade200,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isVisibelity = !isVisibelity;
                        });
                      },
                      icon: isVisibelity
                          ? Icon(
                              Icons.visibility_off,
                              color: Colors.blue,
                            )
                          : Icon(Icons.visibility, color: Colors.blue),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 0.2,
                          color: Colors.blue,
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 0.2,
                          color: Colors.blue,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 0.5,
                          color: Colors.blue,
                        )),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 0.2,
                          color: Colors.blue,
                        )),
                  ),
                  // cureser
                  cursorColor: Colors.blueAccent,
                  // obscure
                  obscureText: isVisibelity,
                ),
                // space
                SizedBox(height: 50),
                // button
                BlocListener<LoginBloc, LoginState>(
                  listener: (context, state) async {
                    if (state is LoginSuccess) {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setInt(
                          'user_id', state.loginResponse.data!.user!.id!);
                      await prefs.setString(
                          'token', state.loginResponse.data!.token!);
                      // show Dialog success
                      // ignore: use_build_context_synchronously
                      successAwsome(context).show();
                    } else if (state is LoginFailure) {
                      awosmedialogerror(context, state.message).show();
                    }
                  },
                  child: BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      final isLoading = state is LoginLoading;

                      return MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        minWidth: MediaQuery.of(context).size.width * 90,
                        padding: EdgeInsets.all(12),
                        color: Colors.blue,
                        onPressed: isLoading
                            ? null
                            : () {
                                if (formKey.currentState!.validate()) {
                                  context.read<LoginBloc>().add(
                                        LoginUserEvent(
                                          email: emailController.text,
                                          password: passwordController.text,
                                        ),
                                      );
                                }
                              },
                        child: isLoading
                            ? CircularProgressIndicator(
                                strokeWidth: 1,
                                color: Colors.blueAccent,
                              )
                            : Text(
                                "Login",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                      );
                    },
                  ),
                ),
                // space
                SizedBox(height: 50),
                //  jump to register screeen
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "You don't have an account! Click to Register",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black45,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Successs
  AwesomeDialog successAwsome(BuildContext context) {
    return AwesomeDialog(
        dismissOnTouchOutside: false,
        dialogBackgroundColor: Colors.white,
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.scale,
        title: "Success",
        titleTextStyle: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        desc:
            "Login is done!👍👍👍👍👍👍                                    Click for go to HomeScreen",
        descTextStyle: TextStyle(
          color: Colors.blue,
        ),
        // BTN

        btnOk: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          color: Colors.blue,
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          },
          child: Text(
            "OK",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ));
  }

  // Error Alert
  AwesomeDialog awosmedialogerror(BuildContext context, dynamic state) {
    return AwesomeDialog(
        dialogBackgroundColor: Colors.white,
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: "Failed",
        titleTextStyle: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        desc: state,
        descTextStyle: TextStyle(
          color: Colors.blue,
        ),
        btnOkOnPress: () {},
        btnOk: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          color: Colors.blue,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "OK",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ));
  }
}

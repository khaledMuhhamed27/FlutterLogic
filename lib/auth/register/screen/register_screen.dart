import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_logic/auth/login/screen/login_screen.dart';
import 'package:flutter_logic/auth/register/bloc/register_bloc.dart';
import 'package:flutter_logic/auth/widgets/form_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // obscure
  bool isVisibelity = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Register Screen",
          style: TextStyle(color: Colors.black54),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            right: 12.0,
            left: 12.0,
            bottom: 100,
          ),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Image.asset(
                    "assets/images/addus.png",
                    fit: BoxFit.contain,
                    width: MediaQuery.of(context).size.width * 0.35,
                    height: MediaQuery.of(context).size.height * 0.35,
                  ),
                ),
                // 1
                // Name Title
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Name",
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
                  controller: nameController,
                  hittile: "enter your name",
                ),
                // 2
                // Email Title
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
                  hittile: "enter your email",
                ),
                // 3
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Passowrd",
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

                  // Style
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.blue.shade200),
                    hintText: "enter password",
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
                // 3
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Confirm Password",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                // Confirm Password
                TextFormField(
                  // controller]
                  controller: passwordConfirmController,

                  // Style
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.blue.shade200),
                    hintText: "enter password again",
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
                // 4
                // 2
                // Email Title
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Phone",
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
                  controller: phoneController,
                  hittile: "enter your phone number",
                  keyboardType: TextInputType.phone,
                ),

                SizedBox(height: 50),
                // button
                BlocListener<RegisterBloc, RegisterState>(
                  listener: (context, state) async {
                    if (state is RegisterSuccess) {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setInt(
                          'user_id', state.registerResponse.data.user.id);
                      await prefs.setString(
                          'token', state.registerResponse.data.accessToken);
                      // show Dialog success
                      successAwsome(context).show();
                    } else if (state is RegisterFailure) {
                      awosmedialogerror(context, state.message).show();
                    }
                  },
                  child: BlocBuilder<RegisterBloc, RegisterState>(
                    builder: (context, state) {
                      final isLoading = state is RegisterLoading;
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
                                context.read<RegisterBloc>().add(
                                    RegisterUserEvent(
                                        name: nameController.text,
                                        email: emailController.text,
                                        password: passwordController.text,
                                        confirmPassword:
                                            passwordConfirmController.text,
                                        phone: phoneController.text));
                              },
                        child: isLoading
                            ? CircularProgressIndicator(
                                strokeWidth: 1,
                                color: Colors.blueAccent,
                              )
                            : Text(
                                "Register",
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
                SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "You have already an account! Click for login.",
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
            "Registeration is done!👍👍👍👍👍👍                                    Click for verification email",
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
            print("go to otp email");
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

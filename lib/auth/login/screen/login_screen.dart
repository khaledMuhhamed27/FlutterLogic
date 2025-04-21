import 'package:flutter/material.dart';
import 'package:flutter_logic/auth/register/screen/register_screen.dart';
import 'package:flutter_logic/auth/widgets/form_field.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login Screen",
          style: TextStyle(color: Colors.black54),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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

              // Style
              decoration: InputDecoration(
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
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              minWidth: MediaQuery.of(context).size.width * 90,
              padding: EdgeInsets.all(12),
              color: Colors.blue,
              onPressed: () {
                print("User Email IS : ${emailController.text}");
                print("User Password IS : ${passwordController.text}");
              },
              child: Text(
                "Login",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18,
                ),
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
                    fontWeight: FontWeight.bold, color: Colors.black45),
              ),
            )
          ],
        ),
      ),
    );
  }
}

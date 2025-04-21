import 'package:flutter/material.dart';
import 'package:flutter_logic/auth/widgets/form_field.dart';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              minWidth: MediaQuery.of(context).size.width * 90,
              padding: EdgeInsets.all(12),
              color: Colors.blue,
              onPressed: () {
                print("User Name IS : ${nameController.text}");
                print("User Email IS : ${emailController.text}");
                print("User Password IS : ${passwordController.text}");
                print("User Phone IS : ${phoneController.text}");
              },
              child: Text(
                "Register",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

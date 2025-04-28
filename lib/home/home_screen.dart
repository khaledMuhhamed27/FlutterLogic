import 'package:flutter/material.dart';
import 'package:flutter_logic/auth/widgets/my_cards.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person, size: 30),
                  Text(
                    "Welcome to home Screen MR :",
                    style: TextStyle(
                      color: Colors.black45,
                    ),
                  ),
                  Text(
                    "Khaled",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              // 1
              MyAwesomeCard(),
              //
              CharacterCard(
                imageUrl: "assets/images/download.jpeg",
                name: "Hamed Adim",
                description: "The Best Wizard ",
                rating: 4.9,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

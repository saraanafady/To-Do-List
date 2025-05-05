import 'package:flutter/material.dart';
import '../components/onboarding_widgets.dart';
import 'second_screen.dart'; // for navigation

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            buildSkipButton(context),
            Expanded(
              child: buildContent(
                context,
                'assets/1.png',
                'Welcome to the App',
                'This is your first step',
                nextScreen: const SecondScreen(),
                buttonText: 'Next',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

import '../components/onboarding_widgets.dart'; // adjust if needed
import 'third_screen.dart'; // for navigation

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            buildSkipButton(context),
            Expanded(
              child: buildContent(
                context,
                'assets/2.png',
                'Create daily routine',
                'In UpTodo, you can create your personalized routine to stay productive',
                nextScreen: const ThirdScreen(),
                buttonText: 'NEXT',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

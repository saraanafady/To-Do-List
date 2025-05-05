import 'package:flutter/material.dart';
import '../components/onboarding_widgets.dart';
import 'start_screen.dart';
class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

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
                'assets/3.png',
                'Organize your tasks',
                'You can organize your daily tasks by adding your tasks into separate categories',
                nextScreen: const StartScreen(),
                buttonText: 'GET STARTED',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
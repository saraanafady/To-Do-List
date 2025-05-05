import 'package:flutter/material.dart';
import '../components/custom_button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              const Spacer(flex: 1),
              const Text(
                'Welcome to UpTodo',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              const Text(
                'Please login to your account or create new account to continue',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(flex: 2),
              CustomButton(
                text: 'LOGIN',
                isPrimary: true,
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                  // Navigate to login screen
                },
              ),
              const SizedBox(height: 16),
              CustomButton(
                text: 'CREATE ACCOUNT',
                isPrimary: false,
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                  // Navigate to create account screen
                },
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
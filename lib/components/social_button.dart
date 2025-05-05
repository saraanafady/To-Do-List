import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String text;
  final String imagePath; 
  final VoidCallback? onPressed;

  const SocialButton({
    super.key,
    required this.text,
    required this.imagePath, 
    this.onPressed, required int width, required int height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 12, 
              backgroundImage: AssetImage(imagePath), 
            ),
            SizedBox(width: 10), 
            Text(text),
          ],
        ),
      ),
    );
  }
}

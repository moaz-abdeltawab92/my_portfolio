import 'package:flutter/material.dart';
import 'package:portfolio_website/Responsive/responsive.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.isMobile(context) ? 40 : 80,
      ),
      child: Column(
        children: [
          const Center(
            child: Text(
              "About Me",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "I'm Moaz Ayman, a Flutter developer passionate about building seamless and user-friendly mobile applications.\n\nWith a strong background in Flutter, Dart, Firebase, API integration, UI/UX design, and State Management, I strive to develop high-quality apps that provide an excellent user experience.\n\nI am always eager to learn, grow, and take on new challenges in mobile app development.\n\nThank you for visiting my portfolio! Feel free to explore my projects and reach out if you're interested in collaborating or connecting.",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: Responsive.isMobile(context) ? 18 : 20,
            ),
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }
}

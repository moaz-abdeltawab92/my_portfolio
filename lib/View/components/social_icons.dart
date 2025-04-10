import 'package:flutter/material.dart';
import 'package:portfolio_website/Responsive/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIcons extends StatelessWidget {
  const SocialIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 5,
      top: Responsive.isMobile(context)
          ? Responsive.heightOfScreen(context) * 0.1
          : Responsive.heightOfScreen(context) * 0.2,
      child: const SizedBox(
        height: 250,
        width: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SocialIconDesign(
                socialLink: "https://www.linkedin.com/in/moaz-ayman-a59230296/",
                iconUrl:
                    'https://static.vecteezy.com/system/resources/previews/016/716/470/non_2x/linkedin-icon-free-png.png'),
            SocialIconDesign(
                socialLink:
                    "https://www.facebook.com/share/1XKarLmjTS/", // link to open
                iconUrl: // icon link from google
                    'https://cdn-icons-png.freepik.com/256/733/733547.png?ga=GA1.1.529126097.1726008930'),
            SocialIconDesign(
                socialLink: "https://github.com/moaz-abdeltawab92",
                iconUrl:
                    'https://cdn-icons-png.freepik.com/256/11023/11023876.png'),
            SocialIconDesign(
                socialLink: "https://mailto:moazayman128@gmail.com",
                iconUrl:
                    'https://cdn-icons-png.freepik.com/512/5968/5968534.png?ga=GA1.1.529126097.1726008930'),
            SocialIconDesign(
                socialLink: "https://wa.me/+201017645365",
                iconUrl:
                    'https://cdn-icons-png.freepik.com/512/15707/15707820.png?ga=GA1.1.529126097.1726008930'),
          ],
        ),
      ),
    );
  }
}

class SocialIconDesign extends StatelessWidget {
  final String iconUrl;
  final String socialLink;
  const SocialIconDesign({
    super.key,
    required this.iconUrl,
    required this.socialLink,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      backgroundColor: Colors.transparent,
      onPressed: () {
        launchUrl(
          Uri.parse(socialLink),
        );
      },
      child: Image.network(
        iconUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}

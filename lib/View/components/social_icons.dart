import 'package:flutter/material.dart';
import 'package:portfolio_website/Responsive/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIcons extends StatelessWidget {
  const SocialIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 10,
      top: Responsive.isMobile(context)
          ? Responsive.heightOfScreen(context) * 0.1
          : Responsive.heightOfScreen(context) * 0.2,
      child: const SizedBox(
        height: 290,
        width: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SocialIconDesign(
                socialLink: "https://www.linkedin.com/in/moaz-ayman-a59230296/",
                iconUrl:
                    'https://static.vecteezy.com/system/resources/previews/016/716/470/non_2x/linkedin-icon-free-png.png'),
            SocialIconDesign(
                socialLink:
                    "https://www.facebook.com/share/1XKarLmjTS/",
                iconUrl:
                    'https://cdn-icons-png.freepik.com/256/733/733547.png?ga=GA1.1.529126097.1726008930'),
            SocialIconDesign(
                socialLink: "https://github.com/moaz-abdeltawab92",
                iconUrl:
                    'https://cdn-icons-png.freepik.com/256/11023/11023876.png'),
            SocialIconDesign(
                socialLink: "mailto:moazayman128@gmail.com",
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

class SocialIconDesign extends StatefulWidget {
  final String iconUrl;
  final String socialLink;

  const SocialIconDesign({
    super.key,
    required this.iconUrl,
    required this.socialLink,
  });

  @override
  State<SocialIconDesign> createState() => _SocialIconDesignState();
}

class _SocialIconDesignState extends State<SocialIconDesign> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.25 : 1.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutCubic,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.18),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(0, 3),
                    )
                  ]
                : [],
          ),
          child: FloatingActionButton.small(
            elevation: _isHovered ? 6 : 0,
            highlightElevation: 8,
            backgroundColor: Colors.transparent,
            onPressed: () async {
              final Uri url = Uri.parse(widget.socialLink);
              if (await canLaunchUrl(url)) {
                await launchUrl(url, mode: LaunchMode.externalApplication);
              }
            },
            child: Image.network(
              widget.iconUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

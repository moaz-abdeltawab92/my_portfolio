import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/Responsive/responsive.dart';
import 'package:portfolio_website/Utils/colors.dart';

class TopSkills extends StatelessWidget {
  const TopSkills({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "My Top Skills",
          style: GoogleFonts.poppins(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.isMobile(context)
                ? 10
                : Responsive.widthOfScreen(context) / 4,
          ),
          child: const Wrap(
            children: [
              SkillCard(
                url:
                    'https://cdn.iconscout.com/icon/free/png-256/flutter-2038877-1720090.png',
              ),
              SkillCard(
                url:
                    'https://avatars.githubusercontent.com/u/1609975?s=280&v=4',
              ),
              SkillCard(
                  url:
                      'https://miro.medium.com/v2/resize:fit:300/1*R4c8lHBHuH5qyqOtZb3h-w.png'),
              SkillCard(
                  url:
                      'https://cdn-icons-png.flaticon.com/512/1493/1493169.png'),
              SkillCard(
                  url:
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/GitHub_Invertocat_Logo.svg/180px-GitHub_Invertocat_Logo.svg.png'),
              SkillCard(
                  url:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSK1L7i-1THdq2vhnZfzoDOjnAJlqbmP7f7VIkim87VhdHofnN7meQYO1h50Ab9nkxVpsA&usqp=CAU'),
              SkillCard(
                  url:
                      'data:image/png;base64,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'),
            ],
          ),
        ),
      ],
    );
  }
}

class SkillCard extends StatefulWidget {
  final String url;
  const SkillCard({super.key, required this.url});

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.identity()..scale(_isHovered ? 1.1 : 1.0),
          child: DecoratedBox(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: shadoColor,
                  blurRadius: _isHovered ? 12 : 6,
                  spreadRadius: _isHovered ? 8 : 4,
                ),
              ],
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: SizedBox(
              height: !Responsive.isMobile(context)
                  ? Responsive.widthOfScreen(context) / 7
                  : 80,
              width: !Responsive.isMobile(context)
                  ? Responsive.widthOfScreen(context) / 7
                  : 80,
              child: Padding(
                padding: Responsive.isMobile(context)
                    ? const EdgeInsets.all(10)
                    : const EdgeInsets.all(30),
                child: Image.network(widget.url),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/Responsive/responsive.dart';
import 'package:portfolio_website/View/screens/project_details_page.dart';
import 'package:portfolio_website/models/project_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:animate_do/animate_do.dart';
import 'package:visibility_detector/visibility_detector.dart';

class RecentProject extends StatefulWidget {
  const RecentProject({super.key});

  @override
  State<RecentProject> createState() => _RecentProjectState();
}

class _RecentProjectState extends State<RecentProject> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('recent-projects-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2 && !_isVisible) {
          setState(() {
            _isVisible = true;
          });
        }
      },
      child: Column(
        children: [
          FadeInDown(
            animate: _isVisible,
            duration: const Duration(milliseconds: 800),
            child: Text(
              "Some of My Recent Projects",
              style: GoogleFonts.poppins(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          AnimationLimiter(
            child: Wrap(
              children: List.generate(
                projects.length > 9 ? 9 : projects.length,
                (index) => AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 600),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: ProjectCard(
                        buttonText: "Details",
                        projectModel: projects[index],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final ProjectModel projectModel;
  final String? url;
  final String buttonText;
  const ProjectCard({
    super.key,
    required this.projectModel,
    this.url,
    required this.buttonText,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;
  bool _isFlipped = false;

  bool _isArabic(String text) {
    // Check if the text contains a significant number of Arabic characters
    final arabicRegExp = RegExp(r'[\u0600-\u06FF]');
    return arabicRegExp.hasMatch(text);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(_isFlipped ? 3.14159 : 0)
            ..scale(_isHovered ? 1.03 : 1.0),
          transformAlignment: Alignment.center,
          child: DecoratedBox(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: _isHovered
                      ? const Color(0xffAF8F6F).withOpacity(0.4)
                      : Colors.grey,
                  blurRadius: _isHovered ? 20 : 4,
                  spreadRadius: _isHovered ? 8 : 3,
                ),
              ],
              borderRadius: BorderRadius.circular(10),
              gradient: _isHovered
                  ? LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white,
                        const Color(0xffC1BAA1).withOpacity(0.1),
                      ],
                    )
                  : null,
              color: _isHovered ? null : Colors.white,
              border: _isHovered
                  ? Border.all(
                      color: const Color(0xffAF8F6F).withOpacity(0.3),
                      width: 2,
                    )
                  : null,
            ),
            child: SizedBox(
              width: Responsive.isMobile(context)
                  ? Responsive.widthOfScreen(context) * 0.9
                  : Responsive.widthOfScreen(context) / 4,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 100,
                      width: 100,
                      transform: Matrix4.identity()
                        ..scale(_isHovered ? 1.1 : 1.0),
                      child: Image.asset(
                        widget.projectModel.imgURL,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Text(
                    widget.projectModel.projectName,
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color:
                          _isHovered ? const Color(0xffAF8F6F) : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      widget.projectModel.description!,
                      maxLines: 10,
                      style: const TextStyle(
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis,
                      ),
                      textDirection: _isArabic(widget.projectModel.description!)
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                      bottom: 6,
                    ),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: _isHovered
                            ? const LinearGradient(
                                colors: [
                                  Color(0xffAF8F6F),
                                  Color(0xffC1BAA1),
                                ],
                              )
                            : null,
                      ),
                      child: TextButton(
                        onPressed: () {
                          if (widget.url != null) {
                            launchUrl(
                              Uri.parse(widget.url!),
                            );
                          } else {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        ProjectDetailsPage(
                                  project: widget.projectModel,
                                ),
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  const begin = Offset(1.0, 0.0);
                                  const end = Offset.zero;
                                  const curve = Curves.easeInOutCubic;
                                  var tween = Tween(begin: begin, end: end)
                                      .chain(CurveTween(curve: curve));
                                  var offsetAnimation = animation.drive(tween);
                                  return SlideTransition(
                                    position: offsetAnimation,
                                    child: child,
                                  );
                                },
                                transitionDuration:
                                    const Duration(milliseconds: 400),
                              ),
                            );
                          }
                        },
                        child: Text(
                          widget.buttonText,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: _isHovered ? Colors.white : Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

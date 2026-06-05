import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/Responsive/responsive.dart';
import 'package:portfolio_website/models/project_model.dart';
import 'package:portfolio_website/Utils/colors.dart';
import 'package:portfolio_website/View/components/project_name_title.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailsPage extends StatefulWidget {
  final ProjectModel project;

  const ProjectDetailsPage({super.key, required this.project});

  @override
  State<ProjectDetailsPage> createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends State<ProjectDetailsPage> {
  final PageController _pageController = PageController();
  Timer? _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < widget.project.images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  bool _isArabic(String text) {
    final arabicRegExp = RegExp(r'[\u0600-\u06FF]');
    return arabicRegExp.hasMatch(text);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: ProjectNameTitle(
          projectName: widget.project.projectName,
          tagline: widget.project.tagline,
          nameFontSize: Responsive.isMobile(context) ? 20 : 24,
          taglineFontSize: Responsive.isMobile(context) ? 14 : 16,
          nameColor: textColor,
        ),
        backgroundColor: appBarColor,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: Responsive.isDesktop(context)
                    ? MediaQuery.of(context).size.width * 0.9
                    : Responsive.isTablet(context)
                        ? MediaQuery.of(context).size.width * 0.9
                        : MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Responsive.isMobile(context)
                          ? 200
                          : 550, // Reverted height
                      width: MediaQuery.of(context).size.width,
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: widget.project.images.length,
                        onPageChanged: (index) {
                          setState(() {
                            _currentPage = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: Responsive.isDesktop(context)
                                ? EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.15) // Reverted padding
                                : EdgeInsets.zero,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                widget.project.images[index],
                                fit: BoxFit.fill, // Reverted fit
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: SmoothPageIndicator(
                        controller: _pageController,
                        count: widget.project.images.length,
                        effect: const WormEffect(
                          dotHeight: 8,
                          dotWidth: 8,
                          activeDotColor: primaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        color: cardColor,
                        child: Padding(
                          padding: const EdgeInsets.all(25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ProjectNameTitle(
                                projectName: widget.project.projectName,
                                tagline: widget.project.tagline,
                                nameFontSize:
                                    Responsive.isMobile(context) ? 26 : 38,
                                taglineFontSize:
                                    Responsive.isMobile(context) ? 18 : 24,
                                nameColor: textColor,
                                textAlign: TextAlign.start,
                              ),
                              const SizedBox(height: 15),
                              Text(
                                widget.project.detailedDescription ??
                                    'No description available.',
                                style: GoogleFonts.poppins(
                                  fontSize:
                                      Responsive.isMobile(context) ? 17 : 19,
                                  color: Colors.black54,
                                  height: 1.6,
                                ),
                                textDirection: _isArabic(
                                        widget.project.detailedDescription ??
                                            '')
                                    ? TextDirection.rtl
                                    : TextDirection.ltr,
                              ),
                              const SizedBox(height: 25),
                              if (widget.project.skills != null &&
                                  widget.project.skills!.isNotEmpty)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Skills:",
                                      style: GoogleFonts.nunito(
                                        fontSize: Responsive.isMobile(context)
                                            ? 19
                                            : 22,
                                        fontWeight: FontWeight.bold,
                                        color: textColor,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Wrap(
                                      spacing: 10.0,
                                      runSpacing: 6.0,
                                      children: widget.project.skills!
                                          .map((skill) => Chip(
                                                label: Text(skill),
                                                backgroundColor: secondaryColor
                                                    .withOpacity(0.4),
                                                labelStyle: GoogleFonts.nunito(
                                                    color: textColor,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ))
                                          .toList(),
                                    ),
                                    const SizedBox(height: 25),
                                  ],
                                ),
                              Center(
                                child: Wrap(
                                  spacing: 15,
                                  runSpacing: 15,
                                  alignment: WrapAlignment.center,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    if (widget.project.isPrivate)
                                      Chip(
                                        label: Text(
                                          'Private',
                                          style: GoogleFonts.nunito(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        avatar: const Icon(
                                          Icons.lock,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                        backgroundColor:
                                            const Color(0xFFC62828),
                                      ),
                                    if (!widget.project.isPrivate &&
                                        widget.project.playStoreLink != null)
                                      StoreBadgeButton(
                                        imageUrl: 'asset/images/play_store_badge.png',
                                        linkUrl: widget.project.playStoreLink!,
                                      ),
                                    if (!widget.project.isPrivate &&
                                        widget.project.appStoreLink != null)
                                      StoreBadgeButton(
                                        imageUrl: 'asset/images/app_store_badge.png',
                                        linkUrl: widget.project.appStoreLink!,
                                      ),
                                    if (!widget.project.isPrivate &&
                                        widget.project.githubLink != null)
                                      ElevatedButton.icon(
                                        onPressed: () {
                                          if (widget.project.githubLink !=
                                              null) {
                                            launchUrl(Uri.parse(
                                                widget.project.githubLink!));
                                          }
                                        },
                                        icon: const Icon(Icons.link, size: 22),
                                        label: Text(
                                          (widget.project.githubLink != null
                                              ? 'GitHub'
                                              : 'Demo'),
                                          style: GoogleFonts.nunito(
                                              fontSize: 19,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: primaryColor,
                                          foregroundColor: Colors.white,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 25, vertical: 16),
                                          textStyle:
                                              GoogleFonts.nunito(fontSize: 19),
                                        ),
                                      ),
                                    if (!widget.project.isPrivate &&
                                        widget.project.downloadLink != null)
                                      ElevatedButton.icon(
                                        onPressed: () {
                                          if (widget.project.downloadLink !=
                                              null) {
                                            launchUrl(Uri.parse(
                                                widget.project.downloadLink!));
                                          }
                                        },
                                        icon: const Icon(Icons.download,
                                            size: 22),
                                        label: Text(
                                          (widget.project.downloadLink != null
                                              ? 'Download'
                                              : 'Demo'),
                                          style: GoogleFonts.nunito(
                                              fontSize: 19,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: primaryColor,
                                          foregroundColor: Colors.white,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 25, vertical: 16),
                                          textStyle:
                                              GoogleFonts.nunito(fontSize: 19),
                                        ),
                                      ),
                                    if (!widget.project.isPrivate &&
                                        widget.project.demoLink != null)
                                      ElevatedButton.icon(
                                        onPressed: () {
                                          if (widget.project.demoLink != null) {
                                            launchUrl(Uri.parse(
                                                widget.project.demoLink!));
                                          }
                                        },
                                        icon: const Icon(Icons.link, size: 22),
                                        label: Text(
                                          (widget.project.demoLink != null
                                              ? 'Demo'
                                              : 'Download'),
                                          style: GoogleFonts.nunito(
                                              fontSize: 19,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: primaryColor,
                                          foregroundColor: Colors.white,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 25, vertical: 16),
                                          textStyle:
                                              GoogleFonts.nunito(fontSize: 19),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StoreBadgeButton extends StatefulWidget {
  final String imageUrl;
  final String linkUrl;

  const StoreBadgeButton({
    super.key,
    required this.imageUrl,
    required this.linkUrl,
  });

  @override
  State<StoreBadgeButton> createState() => _StoreBadgeButtonState();
}

class _StoreBadgeButtonState extends State<StoreBadgeButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedScale(
        scale: _isHovered ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: InkWell(
          onTap: () {
            launchUrl(Uri.parse(widget.linkUrl));
          },
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            widget.imageUrl,
            height: 55,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

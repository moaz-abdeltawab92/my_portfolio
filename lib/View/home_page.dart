import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/Responsive/responsive.dart';
import 'package:portfolio_website/Utils/colors.dart';
import 'package:portfolio_website/View/Components/about_me.dart';
import 'package:portfolio_website/View/Components/drawer.dart';
import 'package:portfolio_website/View/Components/prfile_and_intro.dart';
import 'package:portfolio_website/View/Components/recent_project.dart';
import 'package:portfolio_website/View/Components/social_icons.dart';
import 'package:portfolio_website/View/Components/top_skill.dart';
import 'package:portfolio_website/View/components/contact_form.dart';
import 'package:portfolio_website/Utils/section_keys.dart';
import 'package:portfolio_website/View/components/topbar.dart';

class DeveloperPortFolio extends StatelessWidget {
  DeveloperPortFolio({super.key});
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  final PortfolioSectionKeys _sectionKeys = PortfolioSectionKeys();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Moaz Ayman",
          style: GoogleFonts.nunito(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        backgroundColor: appBarColor,
        elevation: 3,
        toolbarHeight: 70,
        actions: [
          Responsive.isMobile(context)
              ? Padding(
                  padding: const EdgeInsets.only(right: 13),
                  child: IconButton(
                    onPressed: () {
                      _globalKey.currentState!.openEndDrawer();
                    },
                    icon: const Icon(
                      Icons.menu,
                      color: textColor,
                      size: 35,
                    ),
                  ),
                )
              : TopBar(
                  sectionKeys: _sectionKeys,
                ),
        ],
      ),
      endDrawer: Responsive.isMobile(context)
          ? MyDrawer(sectionKeys: _sectionKeys)
          : null,
      body: SafeArea(
        child: Stack(
          children: [
            // for Body parts
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  const ProfileAndIntro(),
                  SizedBox(height: Responsive.isMobile(context) ? 40 : 0),
                  Container(
                    key: _sectionKeys.aboutKey,
                    child: const AboutMe(),
                  ),
                  const SizedBox(height: 55),
                  Container(
                    key: _sectionKeys.skillsKey,
                    child: const TopSkills(),
                  ),
                  const SizedBox(height: 55),
                  Container(
                    key: _sectionKeys.projectsKey,
                    child: const RecentProject(),
                  ),
                  const SizedBox(height: 55),
                  Container(
                    key: _sectionKeys.contactKey,
                    child: const ContactForm(),
                  ),
                  const SizedBox(height: 55),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            const SocialIcons()
          ],
        ),
      ),
    );
  }
}

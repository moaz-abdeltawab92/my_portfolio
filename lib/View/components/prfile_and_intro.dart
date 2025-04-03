import 'package:flutter/material.dart';
import 'package:portfolio_website/Responsive/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileAndIntro extends StatelessWidget {
  const ProfileAndIntro({super.key});

  void _launchURL() async {
    final Uri url = Uri.parse(
        "https://drive.google.com/file/d/1WE6A_nVd9eC0ugx_WczjxXEluEkvzjT5/view?usp=drive_link");
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw "Could not launch $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 70,
        ),
        child: Column(
          children: [
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 50,
              runSpacing: 20,
              children: [
                SizedBox(
                  width: Responsive.isMobile(context)
                      ? Responsive.widthOfScreen(context)
                      : Responsive.widthOfScreen(context) / 2,
                  child: Center(
                    child: SizedBox(
                      height: 300,
                      width: Responsive.isMobile(context)
                          ? Responsive.widthOfScreen(context) * 0.85
                          : 450,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 8,
                              spreadRadius: 5,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Hello!",
                                style: TextStyle(
                                  fontSize:
                                      Responsive.isMobile(context) ? 36 : 40,
                                  color: const Color(0xffAF8F6F),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Text(
                                "I'm Moaz Ayman,\na Passionate Mobile App Developer,\nSpecializing in Flutter App Development.",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Center(
                                child: InkWell(
                                  onTap: _launchURL,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 30),
                                    decoration: BoxDecoration(
                                      color: const Color(0xffAF8F6F),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Text(
                                      "Check Out My CV",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
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
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: Responsive.isMobile(context)
                        ? Responsive.widthOfScreen(context) * 0.8
                        : Responsive.widthOfScreen(context) / 3,
                    height: Responsive.isMobile(context)
                        ? Responsive.heightOfScreen(context) / 4
                        : Responsive.heightOfScreen(context) - 170,
                    child: Image.asset(
                      "asset/images/me.jpg",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

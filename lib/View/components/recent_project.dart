import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/Responsive/responsive.dart';
import 'package:portfolio_website/models/project_model.dart';
import 'package:url_launcher/url_launcher.dart';

class RecentProject extends StatelessWidget {
  const RecentProject({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Some of My Recent Projects",
          style: GoogleFonts.poppins(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          children: [
            ProjectCard(
              buttonText: "Download now",
              projectModel: projects[0],
              url: "https://tazkira.netlify.app/",
            ),
            ProjectCard(
              buttonText: "Check it out",
              projectModel: projects[1],
              url: "https://github.com/moaz-abdeltawab92/Doctor-Hunt-App",
            ),
            ProjectCard(
              buttonText: "Check it out",
              projectModel: projects[2],
              url: "https://github.com/moaz-abdeltawab92/News-App",
            ),
            ProjectCard(
              buttonText: "Check it out",
              projectModel: projects[3],
              url: "https://github.com/moaz-abdeltawab92/Notes-App",
            ),
            ProjectCard(
              buttonText: "Check it out",
              projectModel: projects[4],
              url: "https://github.com/moaz-abdeltawab92/bookly_app.git",
            ),
          ],
        )
      ],
    );
  }
}

class ProjectCard extends StatelessWidget {
  final ProjectModel projectModel;
  final String url;
  final String buttonText;
  const ProjectCard(
      {super.key,
      required this.projectModel,
      required this.url,
      required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: DecoratedBox(
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 4,
            spreadRadius: 3,
          ),
        ], borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: SizedBox(
          width: Responsive.isMobile(context)
              ? Responsive.widthOfScreen(context) * 0.9
              : Responsive.widthOfScreen(context) / 4,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(projectModel.imgURL),
              ),
              Text(
                projectModel.projectName,
                style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  projectModel.description!,
                  maxLines: 5,
                  style: const TextStyle(
                    fontSize: 16,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                  bottom: 6,
                ),
                child: TextButton(
                  onPressed: () {
                    launchUrl(
                      Uri.parse(url),
                    );
                  },
                  child: Text(
                    buttonText,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

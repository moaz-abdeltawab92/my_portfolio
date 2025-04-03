class ProjectModel {
  final String imgURL;
  final String projectName;
  final String? description;

  ProjectModel({
    required this.imgURL,
    required this.projectName,
    this.description,
  });
}

List<ProjectModel> projects = [
  ProjectModel(
    description:
        "تطبيق ديني بسيط يجمع بين: القرآن الكريم (قراءة)، أذكار الصباح والمساء، سبحة إلكترونية لأذكار متنوعة، أدعية من القرآن والسنة، تتبع الصلاة لمتابعة الفروض اليومية، وأحاديث نبوية",
    imgURL: 'asset/images/tazkira.png',
    projectName: 'تَذْكِرَة',
  ),
  ProjectModel(
    description:
        "Doctor Hunt is a Flutter application that makes it easy to find and connect with doctors based on specialization and location, providing real-time search results and detailed doctor profiles with contact information and availability.",
    imgURL: 'asset/images/doc.png',
    projectName: 'Doctor Hunt App',
  ),
  ProjectModel(
    description:
        "A News App using an API provides users with the latest news articles and updates by fetching data from various news sources. The app can categorize news by topics such as sports, technology, Health, and entertainment.",
    imgURL: 'asset/images/newsssss.png',
    projectName: 'News App',
  ),
  ProjectModel(
    description:
        " Notes App is a robust and user-friendly application built to streamline the process of creating, editing, and managing notes. With a clean and intuitive interface, the app ensures that users can focus on their tasks without distractions.",
    imgURL: 'asset/images/notes.png',
    projectName: 'Notes App',
  ),
  ProjectModel(
    description:
        "Toku App is an engaging and interactive way to learn Japanese, covering essential topics like numbers, colors, family terms, and common phrases. With built-in audio pronunciations, users can enhance their listening skills and perfect their pronunciation effortlessly. Designed for a fun and immersive learning experience, the app helps learners grasp new words with ease.",
    imgURL: 'asset/images/toku.png',
    projectName: 'Toku App',
  ),
];

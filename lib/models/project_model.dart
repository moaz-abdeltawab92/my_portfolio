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
        "تطبيق ديني بسيط يجمع بين: القرآن الكريم (قراءة)، أذكار متنوعة، سبحة إلكترونية، أدعية من القرآن والسنة، تتبع الصلاة لمتابعة الفروض اليومية، وأحاديث نبوية. هدف التطبيق هو تسهيل الوصول إلى الأذكار والعبادات اليومية.",
    imgURL: 'asset/images/tazkirra.png',
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
        "Bookly App offers a collection of free books with the ability to preview their content. Easily search and find the book you’re looking for in seconds.",
    imgURL: 'asset/images/book.png',
    projectName: 'Bookly App',
  ),
];

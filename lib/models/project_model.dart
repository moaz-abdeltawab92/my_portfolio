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
  ProjectModel(
    description:
        "Routiner App is a modern Android app built with Jetpack Compose to help you track your daily habits and progress easily. You can add habits, get reminders, and view your stats in a simple interface. This project was developed collaboratively as part of the Digital Egypt Pioneers Initiative (DEPI), where I contributed to the mobile app development.",
    imgURL: 'asset/images/routiner.png',
    projectName: 'Routiner App',
  ),
  ProjectModel(
    description:
        "لوحة تحكم متكاملة لإدارة المطاعم والكافيهات، تتيح لك متابعة التقارير والإحصائيات لحظيًا، إدارة المنيو والمخزون والمصروفات، تحليل الأرباح، واستخراج تقارير مفصلة بضغطة زر. كل ذلك من خلال واجهة سهلة تدعم العربية والإنجليزية، لتبقى دائمًا على اطلاع كامل بكل تفاصيل عملك.",
    imgURL: 'asset/images/poss.png',
    projectName: 'Panda POS Admin',
  ),
  ProjectModel(
    description:
        "تطبيق كاشير ذكي وسريع مصمم لتسهيل عمليات البيع اليومية في المطاعم والكافيهات. يمكنك من تسجيل الطلبات بدقة، ربط مباشر مع الإدارة، تحديث المخزون تلقائيًا، وتقليل الأخطاء البشرية. يصدر فاتورة مع كل طلب. واجهة استخدام بسيطة تدعم تعدد اللغات وتضمن تجربة سلسة للكاشير والعملاء.",
    imgURL: 'asset/images/casheir.png',
    projectName: 'Panda POS Cashier',
  ),
];

class ProjectModel {
  final String imgURL;
  final String projectName;
  final String? description;
  final List<String> images;
  final String? detailedDescription;
  final String? githubLink;
  final String? downloadLink;
  final String? demoLink;
  final List<String>? skills;
  final bool isPrivate;

  ProjectModel({
    required this.imgURL,
    required this.projectName,
    this.description,
    this.demoLink,
    required this.images,
    this.detailedDescription,
    this.githubLink,
    this.downloadLink,
    this.skills,
    this.isPrivate = false,
  });
}

List<ProjectModel> projects = [
  ProjectModel(
    description:
        """تطبيق ديني شامل يجمع بين القرآن الكريم والأذكار والسبحة الإلكترونية والأدعية.""",
    imgURL: 'asset/tazkira/icon.png',
    projectName: 'تَذْكِرَة',
    images: [
      'asset/tazkira/7.png',
      'asset/tazkira/8.png',
      'asset/tazkira/9.png',
      'asset/tazkira/10.png'
    ],
    detailedDescription:
        """تطبيق ديني بسيط يجمع بين القرآن الكريم (قراءة واستماع)،مواقيت الصلاة حسب موقعك , أذكار الصباح والمساء واذكار اخري متنوعة، سبحة إلكترونية، أدعية من القرآن والسنة، تتبع الصلاة لمتابعة الفروض اليومية، وأحاديث نبوية. هدف التطبيق هو تسهيل الوصول إلى الأذكار والعبادات اليومية من مكان واحد، مع تصميم بسيط وسهل الاستخدام.""",
    downloadLink:
        "https://play.google.com/store/apps/details?id=com.moaz.tazkira",
    skills: [
      'Flutter',
      'Dart',
      "Google Maps Live Location",
      'Firebase',
      "Responsive Design",
      "Local Storage",
    ],
    isPrivate: false,
  ),
  ProjectModel(
    description:
        """A restaurant management app that lets owners control menus, track performance, and manage their business easily.""",
    imgURL: 'asset/takka/eats.png',
    projectName: 'Takka',
    images: [
      'asset/takka/login.png',
      'asset/takka/dashboard.png',
      'asset/takka/social.png',
      'asset/takka/info.png'
    ],
    demoLink:
        "https://drive.google.com/file/d/1VgLF6qrjozypDzQCrIcWO_qccFaDUCc7/view?usp=drive_link",
    detailedDescription:
        """Takka is a comprehensive restaurant management system built with Flutter. It provides a powerful control panel for restaurant owners to manage digital menus, monitor performance metrics, and customize their online presence dynamically. The app follows a clean and scalable architecture with full Arabic and English support.""",
    skills: [
      'Flutter',
      'Dart',
      "Cubit",
      "Clean Architecture",
      "Login With Google",
      "Dependency Injection",
      "Localization Support Arabic and English",
      "API",
      "UI/UX",
      "Local Storage",
      "Responsive Design",
      "Code Quality",
    ],
    isPrivate: false,
  ),
  ProjectModel(
    description:
        """A learning platform for students and admins with AI-powered assistance and role-based dashboards.""",
    imgURL: 'asset/iti/app_icon.jpg',
    projectName: 'ITI Learning Platform',
    images: [
      'asset/iti/st1.png',
      'asset/iti/st2.png',
      'asset/iti/st3.png',
      'asset/iti/adminview.png',
      'asset/iti/mangerview.png'
    ],
    detailedDescription:
        """An educational Flutter application developed to streamline learning for Students, Admins, and Super Admins. It provides AI-powered study assistance, track-based courses, and resource management with real-time dashboards for each role. The platform offers a seamless, interactive experience designed to enhance education through smart technology integration.""",
    downloadLink: "https://itiwebview.netlify.app/",
    skills: [
      'Flutter',
      'Dart',
      "Push Notification",
      "Responsive Design",
      "Theming Support Light and Dark Mode",
      "Localization Support Arabic and English",
      'Firebase',
      "Authentication",
      "Local Storage",
      "Chatbot",
      "Cubit",
    ],
    isPrivate: false,
  ),
  ProjectModel(
    description:
        """لوحة تحكم متكاملة لإدارة المطاعم والكافيهات ومتابعة التقارير لحظيًا.""",
    imgURL: 'asset/pos/panda_logo.jpg',
    projectName: 'Panda POS Admin',
    images: [
      'asset/pos/p1.png',
      'asset/pos/p2.png',
      'asset/pos/p3.png',
    ],
    detailedDescription:
        """لوحة تحكم شاملة لإدارة المطاعم والكافيهات، تمكّنك من متابعة التقارير والإحصائيات لحظيًا، إدارة المنيو والمخزون والمصروفات،مع امكانية اصدار بيانات العملاء الحاليين ومتابعة طلابتهم لحظيا مع العدد، وتحليل الأرباح بسهولة. تدعم الواجهة اللغتين العربية والإنجليزية وتوفر أدوات تحليلية متقدمة لمساعدة أصحاب الأعمال في اتخاذ قرارات دقيقة.""",
    skills: [
      'Flutter',
      'Dart',
      "Firebase",
      "Shared Preferences",
      "Localization Support Arabic and English",
      'Admin Panel',
      "Responsive Design",
    ],
    demoLink: "https://pandapos.netlify.app/",
    isPrivate: false,
  ),
  ProjectModel(
    description:
        """تطبيق كاشير بسيط وسريع لتنظيم عمليات البيع في المطاعم والكافيهات.""",
    imgURL: 'asset/pos/panda_logo.jpg',
    projectName: 'Panda POS Cashier',
    images: ['asset/pos/ca1.png', 'asset/pos/ca2.png'],
    detailedDescription:
        """تطبيق كاشير ذكي وسريع مصمم لتسهيل عمليات البيع اليومية في المطاعم والكافيهات. يتيح تسجيل الطلبات، إصدار الفواتير، ومزامنة البيانات مع الإدارة لحظيًا. يتميز بواجهة بسيطة متعددة اللغات، مع ميزات مثل تقسيم الفواتير لتجربة استخدام مرنة وسلسة.""",
    skills: [
      'Flutter',
      'Dart',
      "Firebase",
      "Shared Preferences",
      "Localization Support Arabic and English",
      'POS System',
      "Responsive Design",
    ],
    demoLink: "https://pandapos.netlify.app/",
    isPrivate: false,
  ),
  ProjectModel(
    description:
        """Android app built with Jetpack Compose to help users track habits and daily progress easily.""",
    imgURL: 'asset/routiner/rIcon.jpg',
    projectName: 'Routiner App',
    images: [
      'asset/routiner/r1.jpg',
      'asset/routiner/r2.jpg',
      'asset/routiner/r3.jpg',
      'asset/routiner/r4.jpg',
      'asset/routiner/r5.jpg',
      'asset/routiner/r6.jpg',
    ],
    detailedDescription:
        """Routiner App is a modern Android app built with Jetpack Compose that helps users create and track daily habits. It allows adding custom habits, setting reminders, and viewing progress analytics. The app was developed collaboratively as part of the Digital Egypt Pioneers Initiative (DEPI), focusing on intuitive design and smooth user experience.""",
    githubLink: "https://github.com/OmarKhaled2092001/Habit-Tracker-App.git",
    skills: [
      'Jetpack Compose',
      'Android',
      "Firebase",
      "Login With Google",
      "Authentication",
      'Kotlin',
      'MVVM',
      'Room Database',
      'Android Architecture Components'
    ],
    isPrivate: true,
  ),
  ProjectModel(
    description:
        """A medical app to help users find doctors by specialization and location easily.""",
    imgURL: 'asset/doctor/docicon.png',
    projectName: 'Doctor Hunt App',
    images: [
      'asset/doctor/doc.png',
      'asset/doctor/doc22.png',
    ],
    detailedDescription:
        """Doctor Hunt is a Flutter app that allows users to search and connect with doctors based on specialization and location. It provides detailed profiles, contact information, and real-time availability. The app focuses on simplicity, secure data handling, and efficient search functionality for an optimal user experience.""",
    githubLink: "https://github.com/moaz-abdeltawab92/Doctor-Hunt-App",
    skills: [
      'Flutter',
      'Dart',
      "Authentication",
      "Cubit",
      "Local Storage",
      "Clean Architecture",
      "Dependency Injection",
    ],
    isPrivate: false,
  ),
  ProjectModel(
    description:
        """A clean and simple notes app to create, edit, and manage personal notes easily.""",
    imgURL: 'asset/notes/noticon.png',
    projectName: 'Notes App',
    images: [
      'asset/notes/n1.png',
      'asset/notes/n2.png',
      'asset/notes/n3.png',
    ],
    detailedDescription:
        """Notes App is a user-friendly application built with Flutter to help users create, edit, and manage notes efficiently. It features a clean design, supports local storage with SQLite, and provides smooth performance for daily productivity.""",
    githubLink: "https://github.com/moaz-abdeltawab92/Notes-App",
    skills: [
      'Flutter',
      'Dart',
      'Firebase',
      "Authentication",
      "Login With Google",
      'Local Storage',
    ],
    isPrivate: false,
  ),
  ProjectModel(
    description:
        """Bookly App lets users explore free e-books and preview content quickly.""",
    imgURL: 'asset/book/bookicon.jpg',
    projectName: 'Bookly App',
    images: [
      'asset/book/book.png',
    ],
    detailedDescription:
        """Bookly App provides a wide selection of free books with the ability to search, preview, and read them easily. It integrates the Google Books API and offers a simple interface with a built-in reader for a smooth reading experience.""",
    githubLink: "https://github.com/moaz-abdeltawab92/bookly_app.git",
    skills: [
      'Flutter',
      'Dart',
      'Google Books API',
      "Cubit",
      "MVVM Architecture",
      "Dependency Injection",
    ],
    isPrivate: false,
  ),
];

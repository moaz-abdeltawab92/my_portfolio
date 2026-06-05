class ProjectModel {
  final String imgURL;
  final String projectName;
  final String? tagline;
  final String? description;
  final List<String> images;
  final String? detailedDescription;
  final String? githubLink;
  final String? downloadLink;
  final String? demoLink;
  final String? playStoreLink;
  final String? appStoreLink;
  final List<String>? skills;
  final bool isPrivate;
  final int? downloadCount;

  ProjectModel({
    required this.imgURL,
    required this.projectName,
    this.tagline,
    this.description,
    this.demoLink,
    required this.images,
    this.detailedDescription,
    this.githubLink,
    this.downloadLink,
    this.playStoreLink,
    this.appStoreLink,
    this.skills,
    this.isPrivate = false,
    this.downloadCount,
  });
}

List<ProjectModel> projects = [
  ProjectModel(
    description:
        """قرآن كامل، أذكار، مواقيت صلاة، قبلة، تتبع صلوات، سبحة، أدعية، وأحاديث. معظم المميزات تعمل بدون إنترنت.""",
    imgURL: 'asset/tazkira/icon.png',
    projectName: 'تَذْكِرَة',
    tagline: 'رفيق المسلم اليومي',
    images: [
      'asset/tazkira/7.png',
      'asset/tazkira/8.png',
      'asset/tazkira/9.png',
      'asset/tazkira/10.png'
    ],
    detailedDescription:
        """تَذْكِرَة — رفيق المسلم اليومي

تطبيق تَذْكِرَة هو رفيقك اليومي لكل مسلم يسعى للاقتراب من الله وتنظيم عباداته بطريقة سهلة وعملية. يجمع أهم العبادات اليومية في مكان واحد، مع إمكانية استخدام معظم الخصائص بدون إنترنت وتصميم بسيط يناسب جميع الأعمار.

القرآن الكريم: مصحف كامل للقراءة والاستماع، تفسير ميسر أثناء القراءة، وإمكانية التحميل للاستخدام Offline.

الأذكار اليومية: أذكار الصباح والمساء والنوم، وأذكار متنوعة (الأذان، بعد الصلاة، الوضوء، المسجد، الطعام، دخول وخروج المنزل، الاستيقاظ، الشكر، والاستغفار).

السبحة الإلكترونية: سبحة رقمية مع إحصائيات توضح عدد مرات كل ذكر لمتابعة تقدمك.

مواقيت الصلاة: عرض دقيق لمواقيت الصلاة اليومية في الصفحة الرئيسية حسب موقعك الجغرافي.

تتبع الصلاة: تسجيل ومتابعة الصلوات الخمس يوميًا، مع إحصائيات Streak والأيام المتتالية وقيام الليل.

الإشعارات والتنبيهات: تذكير بالأذكار والأدعية، تنبيه قبل كل صلاة، تذكير يوم الجمعة (سورة الكهف والصلاة على النبي)، تذكير يومي بسورة الملك قبل النوم، وتنبيه الثلث الأخير من الليل للقيام.

الأدعية والأحاديث النبوية: أدعية مأثورة من القرآن والسنة، وأحاديث مصنفة حسب الموضوع (الإيمان، الصلاة، الصبر، التوكل، الإحسان، وغيرها).

أسماء الله الحسنى: عرض كامل مع شرح مبسط لمعاني كل اسم.

اتجاه القبلة: تحديد اتجاه القبلة بدقة باستخدام مستشعرات الهاتف.

السنن والآداب الإسلامية: مجموعة من السنن النبوية والآداب اليومية مع الأدلة من القرآن والسنة.

البودكاستات الدينية: قائمة مقترحة (السيرة النبوية، التزكية، الفقه، وغيرها) مع التوجيه للاستماع من المصادر الأصلية.

مميزات إضافية: ختمة رمضان الذكية (ختمة واحدة أو ختمتين)، تعديل التاريخ الهجري حسب موقعك، مشاركة الآيات القرآنية كصور، وآية أو حديث يومي في الصفحة الرئيسية.

تطبيق واحد يجمع أهم ما يحتاجه المسلم يوميًا — بتجربة استخدام مريحة ومحتوى موثوق.""",
    playStoreLink:
        "https://play.google.com/store/apps/details?id=com.moaz.tazkira",
    appStoreLink:
        "https://apps.apple.com/eg/app/%D8%AA%D8%B0%D9%83%D8%B1%D8%A9-%D8%B1%D9%81%D9%8A%D9%82-%D8%A7%D9%84%D9%85%D8%B3%D9%84%D9%85-%D8%A7%D9%84%D9%8A%D9%88%D9%85%D9%8A/id6757756421",
    skills: [
      'Flutter',
      'Dart',
      'Location Services',
      'Push Notifications',
      'Offline Support',
      'Local Storage',
      'Responsive Design',
      'Audio Playback',
    ],
    isPrivate: false,
    downloadCount: 1500,
  ),
  ProjectModel(
    description:
        """منيو رقمي احترافي، QR Code للمشاركة، روابط السوشيال ميديا، وتحديثات لحظية — كلها من مكان واحد.""",
    imgURL: 'asset/takka/eats.png',
    projectName: 'تكة',
    tagline: 'Takka Smart',
    images: [
      'asset/takka/login.png',
      'asset/takka/dashboard.png',
      'asset/takka/social.png',
      'asset/takka/info.png'
    ],
    demoLink:
        "https://drive.google.com/file/d/1VgLF6qrjozypDzQCrIcWO_qccFaDUCc7/view?usp=drive_link",
    detailedDescription:
        """تكة — Takka Smart

تطبيق تكة هو شريكك الذكي لإدارة تواجدك الرقمي وتسهيل وصول العملاء لخدماتك. صُمم خصيصاً ليمنح أصحاب المطاعم والكافيهات تحكماً كاملاً وسهلاً في قائمة منتجاتهم وروابط التواصل الخاصة بهم.

المنيو الرقمي: أنشئ ونظم قائمة طعامك بسهولة — أضف الأقسام (مقبلات، حلويات، مشروبات، أطباق رئيسية) مع إمكانية إضافة وتعديل وحذف الأصناف، وصور عالية الجودة لكل صنف، والتحكم في ظهور الأقسام وإخفائها بضغطة زر.

مشاركة سريعة عبر QR: احصل على رابط مباشر ورمز استجابة سريعة (QR Code) مجاني واحترافي لتمكين عملائك من الوصول للمنيو بمجرد مسح الكود بكاميرا الهاتف.

روابط السوشيال ميديا: اجمع كل روابط منصات التواصل (واتساب، فيسبوك، انستجرام، تيك توك) في صفحة واحدة منسقة لزيادة متابعيك وعملائك.

تحديثات لحظية: أي تعديل تقوم به على التطبيق يظهر فوراً لعملائك — بدون الحاجة لإعادة طباعة المنيو.

تسجيل دخول آمن: تجربة استخدام آمنة وسريعة مع خيارات تسجيل دخول متعددة (بما في ذلك Google) لحماية بياناتك.

مبني بـ Flutter مع Clean Architecture ودعم كامل للغتين العربية والإنجليزية.""",
    skills: [
      'Flutter',
      'Dart',
      'Cubit',
      'Clean Architecture',
      'Google Sign In',
      'QR Code',
      'Localization AR/EN',
      'Dependency Injection',
      'Responsive Design',
      'UI/UX',
    ],
    isPrivate: false,
    playStoreLink: "https://play.google.com/store/apps/details?id=com.takkasmart.eats",
    appStoreLink: "https://apps.apple.com/us/app/%D8%AA%D9%83%D8%A9-takka-smart/id6756178095",
  ),
  ProjectModel(
    description:
        """حجز سريع، اختيار الخدمة، تحديد الميعاد، وخدمة لحد باب البيت — مع إشعارات لكل تحديث.""",
    imgURL: 'asset/halak/icon.png',
    projectName: 'حلاقك',
    tagline: 'Halaktak',
    images: [
      'asset/halak/screens.png',
      'asset/halak/booking.png',
    ],
    detailedDescription:
        """حلاقك — Halaktak

تعبت من الزحمة والانتظار في صالونات الحلاقة؟ تطبيق حلاقك بيخليك تحجز حلاقتك وأنت في مكانك بكل سهولة.

للعميل:
حجز سريع وسهل في ثوانٍ — اختار الخدمة اللي تناسبك (حلاقة شعر، دقن، تجميل)، حدد المعاد المناسب، واكتب عنوانك، والحلاق يوصلك لحد باب البيت. تابع حجزك أول بأول مع الحلاق واحصل على إشعارات بكل تحديث على طلبك.

للحلاق:
لوحة تحكم لمراجعة الطلبات وقبولها أو رفضها، مع إدارة كاملة للمواعيد — تحكم يومي وأسبوعي في الجدول — ومنع الحجز المزدوج تلقائيًا.

كل حاجة معمولة عشان توفر وقتك وتريحك من أي زحمة أو انتظار.""",
    playStoreLink: "https://play.google.com/store/apps/details?id=com.moaz.halaak",
    skills: [
      'Flutter',
      'Dart',
      'Firebase Authentication',
      'Cloud Firestore',
      'Cloudinary',
      'Push Notifications',
      'Role-Based Access',
      'Booking System',
      'Location Services',
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

];

final int playStoreAppsCount =
    projects.where((p) => p.playStoreLink != null).length;

final int appStoreAppsCount =
    projects.where((p) => p.appStoreLink != null).length;

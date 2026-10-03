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
  final bool isGraduationProject;
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
    this.isGraduationProject = false,
    this.downloadCount,
  });
}

List<ProjectModel> projects = [
  ProjectModel(
    description:
        """خليك مكانك واطلب كل اللي تحتاجه من مطاعم، سوبرماركت، صيدليات، وطلبات خاصة لباب البيت.""",
    imgURL: 'asset/khalik_maknak/logo.jpg',
    projectName: 'خليك مكانك',
    tagline: 'Khalik Makanak',
    images: [
      'asset/khalik_maknak/kh1.png',
      'asset/khalik_maknak/kh2.png',
      'asset/khalik_maknak/kh3.png',
      'asset/khalik_maknak/kh4.png',
    ],
    detailedDescription: """خليك مكانك — Khalik Makanak

تطبيق متكامل لتوصيل طلبات المطاعم، السوبر ماركت، الصيدليات، والطرود الخاصة، يربط كافة أطراف العملية مع تحول تلقائي للواجهات بناءً على دور المستخدم (Role-Based):

للعميل:
• تصفح المطاعم، الكافيهات، السوبرماركت، والصيدليات واختيار الوجبات والمقاضي.
• طلبات خاصة وطرود: إمكانية إرسال واستلام أي شحنة أو طرد من أي مكان لمكان آخر.
• حفظ العناوين: إدخال وتسمية العناوين المختلفة (البيت، العمل) للطلب أسرع كل مرة.
• محفظة إلكترونية: حساب مالي داخل التطبيق واسترداد فوري للأموال عند أي تعديل.
• تتبع لحظي ونقاط ولاء: متابعة حالة الطلب خطوة بخطوة بالإشعارات، وتجميع نقاط ولاء لاستبدالها بمكافآت.

المطعم:
• استقبال الطلبات الجديدة فور ورودها وتأكيدها ومتابعة حالات التحضير.

للمندوب:
• استقبال طلبات التوصيل وتأكيد الاستلام وتحديث الحالة حتى التسليم للعميل.

للأدمن (من داخل التطبيق):
• لوحة تحكم كاملة لمتابعة كافة العمليات والطلبات لحظيًا، وإدارة بيانات النظام والمستخدمين والمندوبين والمطاعم.""",
    playStoreLink:
        "https://play.google.com/store/apps/details?id=com.moaz.khalik.makanak",
    appStoreLink:
        "https://apps.apple.com/us/app/%D8%AE%D9%84%D9%8A%D9%83-%D9%85%D9%83%D8%A7%D9%86%D9%83/id6810070733",
    skills: [
      'Flutter',
      'Dart',
      'Cubit',
      'Clean Architecture',
      'SignalR',
      'GetIt',
      'Dio',
      'Firebase Messaging',
      'Flutter ScreenUtil',
      'Secure Storage',
      'Role-Based Access',
    ],
    isPrivate: false,
  ),
  ProjectModel(
    description:
        """تطبيق متكامل لحجز ملاعب كرة القدم والبادل، عرض الملاعب القريبة، تصفح المواعيد المتاحة، عروض ترويجية، ومشاركة الحجز عبر واتساب.""",
    imgURL: 'asset/sa3a/logo.png',
    projectName: 'Sa3a',
    tagline: 'ساعة',
    images: [
      'asset/sa3a/s3a1.png',
      'asset/sa3a/sa3a2.png',
      'asset/sa3a/sa3a3.png',
    ],
    detailedDescription: """Sa3a - ساعة

تطبيق متكامل لحجز ملاعب كرة القدم والبادل في مصر، يهدف لتسهيل عملية البحث والتنسيق بين اللاعبين وأصحاب الملاعب وتوفير تجربة حجز سلسة وسريعة.

 اللاعبين:
• تصفح الملاعب القريبة: عرض الملاعب بناءً على موقعك الجغرافي (GPS) مع إمكانية الفلترة بالرياضة (كرة قدم / بادل)، المسافة، السعر، والتقييم.
• تفاصيل ومواعيد الملعب: عرض الصور، المرافق المتاحة، التقييمات، وأوقات الملاعب المتاحة والمحجوزة بشكل بصري واضح مع تمييز أسعار النهار والليل.
• حجز سريع في 3 خطوات: اختيار اليوم والوقت المتاح مع إصدار كود حجز فريد .
• مشاركة عبر WhatsApp: مشاركة تفاصيل الحجز بضغطة زر مع أصدقائك بنص جاهز ومصمم للتنسيق الفوري.
• تذكيرات وإشعارات: تذكير أوتوماتيكي قبل موعد المباراة بساعتين لتجنب النسيان، ومتابعة حالة الحجز (مؤكد / معلق / ملغي).
• إدارة الحجوزات والمفضلة: صفحة "حجوزاتي" لمتابعة الحجوزات السابقة والقادمة مع ميزة "احجز تاني" لإنشاء نفس الحجز بضغطة واحدة، وتقييم الملاعب بعد انتهاء المباراة.

لأصحاب الملاعب (الفيندورز):
• إدارة اليوميات والحجوزات: متابعة وتأكيد أو إلغاء الحجوزات مع إمكانية التواصل المباشر مع اللاعبين عبر الاتصال أو WhatsApp.
• حجز المواعيد يدوياً: إغلاق وتأمين الساعات المحجوزة خارج التطبيق لتفادي التعارض المزدوج.
• ترويج الساعات الفاضية (Promo Offers): إنشاء عروض تخفيض سريعة على الساعات المتاحة وإرسال إشعارات فورية للاعبين القريبين من الملعب.
• إدارة مواعيد العمل: تحديد مواعيد الفتح والإغلاق الأسبوعية وتخصيص إغلاق مؤقت للصيانة أو الإجازات.
• رمز الاستجابة السريع QR Code: كود QR خاص بكل ملعب يتيح للعملاء المسح المباشر للوصول لصفحة الملعب داخل التطبيق.

""",
    playStoreLink:
        "https://play.google.com/store/apps/details?id=com.moaz.sa3a",
    appStoreLink: "https://apps.apple.com/us/app/sa3a/id6806839459",
    skills: [
      'Flutter',
      'Dart',
      'Firebase',
      'Push Notifications',
      'Location Services (GPS)',
      'WhatsApp Integration',
      'OTP Authentication',
      'QR Code',
      'Role-Based Access',
      'Responsive Design',
      'UI/UX',
    ],
    isPrivate: false,
  ),
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
    detailedDescription: """تَذْكِرَة — رفيق المسلم اليومي

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
    downloadCount: 2000,
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
    detailedDescription: """تكة — Takka Smart

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
    playStoreLink:
        "https://play.google.com/store/apps/details?id=com.takkasmart.eats",
    appStoreLink:
        "https://apps.apple.com/us/app/%D8%AA%D9%83%D8%A9-takka-smart/id6756178095",
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
    detailedDescription: """حلاقك — Halaktak

تعبت من الزحمة والانتظار في صالونات الحلاقة؟ تطبيق حلاقك بيخليك تحجز حلاقتك وأنت في مكانك بكل سهولة.

للعميل:
حجز سريع وسهل في ثوانٍ — اختار الخدمة اللي تناسبك (حلاقة شعر، دقن، تجميل)، حدد المعاد المناسب، واكتب عنوانك، والحلاق يوصلك لحد باب البيت. تابع حجزك أول بأول مع الحلاق واحصل على إشعارات بكل تحديث على طلبك.

للحلاق:
لوحة تحكم لمراجعة الطلبات وقبولها أو رفضها، مع إدارة كاملة للمواعيد — تحكم يومي وأسبوعي في الجدول — ومنع الحجز المزدوج تلقائيًا.

كل حاجة معمولة عشان توفر وقتك وتريحك من أي زحمة أو انتظار.""",
    playStoreLink:
        "https://play.google.com/store/apps/details?id=com.moaz.halaak",
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
    description: """أَثَـرْ - كل فرص التطوع في مكان واحد""",
    imgURL: 'asset/athr/athr_logo.png',
    projectName: 'أَثَـر',
    images: [
      'asset/athr/app.png',
      'asset/athr/appp.png',
      'asset/athr/dash.png',
      'asset/athr/dashh.png',
    ],
    detailedDescription:
        """أَثَـرْ — منصة وتطبيق التطوع وإدارة المؤسسات الخيرية (مشروع تخرج)

منصة "أَثَـرْ" هي مشروع تخرج متكامل صُمم خصيصاً لحل مشكلات وتحديات التطوع والعمل الخيري في المجتمع، وتسهيل الوصول لفرص التطوع والتبرعات وتنسيق الفعاليات بين الأفراد والمؤسسات عبر منظومة رقمية ذكية وموحدة.

تتكون المنصة من تطبيق موبايل للمتطوعين ولوحة تحكم (للجمعيات والأدمن):

 أولاً: تطبيق للمتطوعين (Volunteer Mobile App):
• قسم التطوع (Volunteer Services):
  - ربط وتجهيز طالبي الخدمة والمساعدة بالمتطوعين الراغبين في تقديم المساعدة في مختلف المجالات (صحة، تعليم، مجتمع، تكنولوجيا، وغيرها).
  - أمان ومصداقية المحتوى: تخضع كافة الفرص لمراجعة شاملة وتدقيق من قِبل الأدمن قبل ظهورها ونشرها في التطبيق.

• قسم الجمعيات والمؤسسات الخيرية (NGOs Section):
  - تجميع كافة الجمعيات والمؤسسات الخيرية الموثوقة في مكان واحد.
  - إمكانية تصفح القوافل والأنشطة القادمة بتفاصيلها ومتطلبات المشاركة ليختار المتطوع ما يناسب مهاراته ووقت تفاعله.

• قسم التبرعات والحالات الطبية الحرجة (Donations & Emergency Cases):
  - تجميع وتوثيق الحالات الطبية الحرجة التي تتطلب مبالغ كبيرة (مثل حالات الأطفال المصابين بضمور العضلات الشوكي وغيرها).
  - مراجعة وتدقيق المستندات والبيانات بدقة عبر الأدمن قبل النشر مع توفير طرق التبرع المباشرة والمتاحة لضمان السرعة والشفافية.

 ثانياً: لوحة تحكم الجمعيات (NGO Dashboard):
• إدارة كاملة للفعاليات والفرص: إضافة وتعديل وحذف فرص التطوع والتبرع، ومتابعة قائمة المتقدمين، وقبول أو رفض طلبات التطوع بناءً على متطلبات الحدث، وتأكيد حضور الفعالية.
• تقارير وإحصائيات شمولية: متابعة أداء وشغل الجمعية خلال أي فترة زمنية، وعرض عدد الساعات والمكاسب والمتطوعين والأنشطة.
• ميزة ألبومات الإنجازات (Event Albums): إضافة صور وإحصائيات وساعات العمل للقوافل المنتهية لتشجيع المجتمع على المشاركة مستقبلاً، وتظهر هذه الألبومات في بروفايل الجمعية للمستخدمين داخل التطبيق.
• إدارة بروفايل الجمعية وحسابات الأدمن المسؤول.

 ثالثاً: لوحة تحكم الأدمن الرئيسي (Super Admin Dashboard):
• نظرة عامة شاملة على النظام ومتابعة كافة العمليات والأنشطة والفرص المتاحة في التطبيق.
• مراجعة واعتماد فرص التطوع المقدمة وتحديد أسباب القبول أو الرفض.
• مركز تنبيهات وإشعارات (Notifications Center): إرسال إشعارات فورية وتنبيهات لكافة مستخدمي النظام عند أي تحديث أو مستجدات.
• إدارة التبرعات والحالات الطبية الكبرى: مراجعة كافة مستندات وتفاصيل الحالات الحرجة وإضافتها لقسم التبرعات الموثوقة.
• مراجعة طلبات الانضمام للجمعيات الجديدة: مراجعة البيانات والأوراق الرسمية والاعتمادات قبل الموافقة على انضمام الجمعية للنظام.

مشروع متكامل يهدف لترك "أَثَـر" حقيقي ومستدام في المجتمع  .""",
    isGraduationProject: true,
    skills: [
      'Flutter',
      'Dart',
      'Clean Architecture',
      'BLoC / Cubit',
      'Dependency Injection (GetIt)',
      'GoRouter',
      'Dio Client',
      'Dartz (Either)',
      'Google Sign In',
      'Firebase Messaging',
      'Local Notifications',
      'Role-Based Access (RBAC)',
      'Push Notifications',
      'JWT Authentication',
      'Flutter Secure Storage',
      'Flutter ScreenUtil',
      'Lottie Animations',
      'REST API',
      'UI/UX Design',
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
        """نظام POS سحابي متكامل للمطاعم والكافيهات يشمل تطبيق كاشير سريع ومزود بلوحة تحكم إدارية شاملة لمتابعة المبيعات والتقارير لحظياً.""",
    imgURL: 'asset/pos/panda_logo.jpg',
    projectName: 'Panda POS System',
    tagline: 'Admin & Cashier Suite',
    images: [
      'asset/pos/p1.png',
      'asset/pos/p2.png',
      'asset/pos/p3.png',
      'asset/pos/ca1.png',
      'asset/pos/ca2.png',
    ],
    detailedDescription:
        """Panda POS System — نظام الإدارة والكاشير المتكامل للمطاعم والكافيهات

نظام POS سحابي شامل ومترابط يربط عمليات الإدارة بالكاشير لحظياً لتسهيل وتنظيم إدارة المطاعم والكافيهات:

1. لوحة تحكم الإدارة (Panda POS Admin):
• متابعة التقارير والمبيعات والإحصائيات التحليلية لحظياً.
• إدارة المنيو، المخزون، المصروفات، وقاعدة بيانات العملاء.
• تحليل الأرباح وتنبيهات الأداء المالي لاتخاذ قرارات دقيقة.

2. تطبيق الكاشير (Panda POS Cashier):
• تسجيل الطلبات السريعة وإصدار الفواتير وطباعتها بسهولة.
• مزامنة لحظية مع الإدارة عند كل عملية بيع مع إمكانية تقسيم الفواتير.
• واجهة مرنة ومتعددة اللغات تعمل بسلاسة عالية.

نظام كامل يدعم اللغتين العربية والإنجليزية ومبني بأحدث تقنيات Flutter السحابية.""",
    skills: [
      'Flutter',
      'Dart',
      'Firebase',
      'Shared Preferences',
      'Localization AR/EN',
      'Admin Panel & Cashier POS',
      'Responsive Design',
    ],
    demoLink: "https://panda-pos-system.vercel.app/",
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
];

final int playStoreAppsCount =
    projects.where((p) => p.playStoreLink != null).length;

final int appStoreAppsCount =
    projects.where((p) => p.appStoreLink != null).length;

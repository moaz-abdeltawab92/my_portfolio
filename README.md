# Flutter Portfolio Website

A modern, responsive portfolio website built with Flutter. This project showcases your skills, projects, and provides a way for visitors to contact you through WhatsApp.

## Demo Preview

## 🔗 Live Demo

Check out the live version here: [Live Demo](https://poortfoliowebsite.netlify.app/)

##  Features

- **Responsive Design**: Works seamlessly on both Web and mobile devices
- **Modern UI**: Clean and professional design with smooth animations
- **Interactive Navigation**: Easy-to-use navigation with smooth scrolling
- **About Me Section**: Introduce yourself with a short bio and your development journey
- **Project Showcase**: Display your recent projects with descriptions
- **Skills Section**: Highlight your technical skills with visual cards
- **Contact Form**: Direct WhatsApp integration for easy communication
- **Social Links**: Connect your social media profiles

##  Getting Started

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/portfolio_website.git
```

2. Navigate to the project directory:
```bash
cd portfolio_website
```

3. Install dependencies:
```bash
flutter pub get
```

4. Run the project:
```bash
flutter run -d chrome
```

## 📁 Project Structure

```
lib/
├── View/
│   ├── Components/
│   │   ├── about_me.dart
│   │   ├── contact_form.dart
│   │   ├── drawer.dart
│   │   ├── prfile_and_intro.dart
│   │   ├── recent_project.dart
│   │   ├── social_icons.dart
│   │   ├── top_skill.dart
│   │   └── topbar.dart
│   └── home_page.dart
├── Responsive/
│   └── responsive.dart
├── Utils/
│   └── colors.dart
└── main.dart
```

## ️ Customization

### Personal Information
Update your personal information in the following files:
- `lib/View/Components/about_me.dart`
- `lib/View/Components/prfile_and_intro.dart`

### Projects
Add your projects in `lib/View/Components/recent_project.dart`

### Skills
Modify your skills in `lib/View/Components/top_skill.dart`

### Contact Information
Update your WhatsApp number in `lib/View/Components/contact_form.dart`

### Social Links
Update your social media links in `lib/View/Components/social_icons.dart`

##  Responsive Design

The website is fully responsive and adapts to different screen sizes:
- Web: Full navigation bar
- Mobile: Hamburger menu with drawer navigation
- Tablet: Optimized layout for medium-sized screens

##  Styling

The project uses a consistent color scheme defined in `lib/Utils/colors.dart`:
- Text Color: Black
- Shadow Color: Light Brown (#C4ACA1)

##  Dependencies

- `google_fonts`: For custom typography
- `url_launcher`: For external links and WhatsApp integration


##   Add Deployment Guide (Netlify)

To deploy your Flutter web project to Netlify:

1. Build your project:
   in Terminal add this line:

   flutter build web

Upload the contents of the build/web folder to Netlify or Connecting your GitHub repository directly to Netlify for automatic deployment.


##  Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

##  Contact

If you have any questions or feedback, feel free to reach out on [LinkedIn](https://www.linkedin.com/in/moaz-ayman-a59230296/) or open an issue.


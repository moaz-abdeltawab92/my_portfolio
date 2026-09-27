# Modern Flutter Web Portfolio Template

A modern, responsive, and animated personal portfolio website built with Flutter Web. Designed to showcase software engineering skills, mobile apps published on Google Play & App Store, technical background, and direct contact options.

---

## Live Demo

Check out the live website:  
[moaz-portfolio-mu.vercel.app](https://moaz-portfolio-mu.vercel.app/)

---

## Features

- **Fully Responsive Layout**: Adapts seamlessly to Desktop, Tablet, and Mobile screens.
- **Modern Aesthetics**: Soft elegant color palette, glowing animated rings, and smooth UI elements.
- **Dynamic Intro**: Animated typing role titles using `animated_text_kit` and `animate_do`.
- **Interactive Project Showcase**:
  - Filterable project list driven by a structured dataset (`ProjectModel`).
  - Direct links to Google Play Store, Apple App Store, GitHub repositories, and Live Demos.
  - Interactive project detail modal with image gallery popups.
- **CV Download / View**: Direct integration with Google Drive for easy resume access.
- **Skills & Experience Badges**: Displays experience counter, project stats, and technology stack chips.
- **WhatsApp & Social Links**: Direct communication buttons and social profiles integration.

---

## Project Structure

```text
lib/
├── models/
│   └── project_model.dart            # Central project dataset (Apps, Links, Descriptions)
├── Responsive/
│   └── responsive.dart               # Screen size breakpoints helper
├── Utils/
│   └── colors.dart                   # Theme colors palette
├── View/
│   ├── components/
│   │   ├── about_me.dart             # About Me section
│   │   ├── contact_form.dart         # Contact form & WhatsApp integration
│   │   ├── drawer.dart               # Mobile navigation drawer
│   │   ├── prfile_and_intro.dart     # Hero section & CV link
│   │   ├── recent_project.dart       # Projects grid & cards
│   │   ├── social_icons.dart         # Social media links
│   │   ├── top_skill.dart            # Technical skills section
│   │   └── topbar.dart               # Desktop header & navigation
│   └── screens/
│       ├── home_page.dart            # Main portfolio page layout
│       └── project_details_page.dart # Detailed modal for project preview
└── main.dart                         # Entry point & App theme initialization
```

---

## Quick Start

### Prerequisites

Ensure you have Flutter SDK installed (Version 3.22+ recommended):
```bash
flutter doctor
```

### Installation & Local Run

1. Clone the repository:
   ```bash
   git clone https://github.com/moaz-abdeltawab92/my_portfolio.git
   cd my_portfolio
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the project locally:
   ```bash
   flutter run -d chrome
   ```

---

## Customization Guide

You can easily use this repository as a template to build your own portfolio:

### 1. Personal Information & CV
- Update your hero section and CV link in `lib/View/components/prfile_and_intro.dart`.
- Update your bio details in `lib/View/components/about_me.dart`.

### 2. Projects & App Store Links
- Edit or add your projects in `lib/models/project_model.dart`.
- Each project supports `playStoreLink`, `appStoreLink`, `githubLink`, `demoLink`, `skills`, and screenshot `images`.

### 3. Social Media & Contact Info
- Update your WhatsApp number in `lib/View/components/contact_form.dart`.
- Update LinkedIn, GitHub, and social links in `lib/View/components/social_icons.dart`.

### 4. Branding & Favicon
- Replace `web/favicon.png` with your personal avatar or logo.
- Update `web/index.html` title and meta tags.

---

## Deployment Guide

### Building for Web
```bash
flutter build web --release
```
The compiled release files will be located in `build/web/`.

### Deploying to Vercel / Netlify / GitHub Pages
1. Copy the contents of `build/web/` to your deployment repo (e.g. `portfolio_webb`).
2. Push your changes to GitHub (`master` / `main` branch).
3. Vercel or Netlify will automatically trigger a new deployment.

---

## Contributing

Contributions, issues, and feature requests are welcome!  
Feel free to open an issue or submit a pull request.

---

## License

This project is open-source and available under the MIT License.

---

Developed by **Moaz Ayman** | [GitHub](https://github.com/moaz-abdeltawab92) • [LinkedIn](https://www.linkedin.com/in/moaz-ayman-a59230296/)

# Prabhu Nath Tiwary — Portfolio (Flutter Web)

A single-codebase, fully responsive portfolio site built in Flutter Web.
It automatically adapts between a **desktop layout** and a **mobile layout**
(hamburger menu, stacked sections, smaller phone mockups) based on screen
width — no separate app needed.

## ✨ Features

- Fully responsive (desktop / tablet / mobile breakpoints)
- Scroll-reveal animations — sections fade + slide in as you scroll to them
- Floating, tilted animated phone mockups in the hero
- Hover-lift animations on buttons, cards, chips, and links (desktop/web)
- Auto-playing testimonials carousel with animated dot indicators
- Sticky navigation bar with smooth "scroll to section" links
- Mobile bottom-sheet navigation drawer
- Working contact form (client-side validation + confirmation toast)
- No backend required — everything runs as a static Flutter Web app

## 🚀 Getting started

**Prerequisites:** [Flutter SDK](https://docs.flutter.dev/get-started/install) (stable channel) installed and `flutter` on your PATH.

```bash
# 1. Unzip and enter the project
cd prabhu_portfolio

# 2. Install dependencies
flutter pub get

# 3. Run it in Chrome for local development
flutter run -d chrome
```

## 📦 Building for production / deployment

```bash
flutter build web --release
```

This outputs a static site to `build/web/`. You can deploy that folder to
any static host — Firebase Hosting, Netlify, Vercel, GitHub Pages, S3, etc.

## 🛠️ Customizing content

Everything is plain Dart, organized by section, so it's easy to edit:

| What to change                     | File                                      |
|-------------------------------------|--------------------------------------------|
| Name, tagline, hero buttons/links   | `lib/sections/hero_section.dart`, `lib/main.dart` |
| About text & stats                  | `lib/sections/about_section.dart`          |
| Skills grid                         | `lib/sections/skills_section.dart`         |
| Featured projects                   | `lib/sections/projects_section.dart`       |
| Work experience timeline            | `lib/sections/experience_section.dart`     |
| Achievements                        | `lib/sections/achievements_section.dart`   |
| Testimonials                        | `lib/sections/testimonials_section.dart`   |
| Contact info & form                 | `lib/sections/contact_section.dart`        |
| Footer                               | `lib/sections/footer_section.dart`         |
| Colors / fonts / theme               | `lib/theme/app_theme.dart`                 |

**Resume / GitHub / LinkedIn links:** update the URLs passed into
`onDownloadResume`, `onViewGithub`, and `onLinkedIn` inside `lib/main.dart`
(and the matching ones inside `hero_section.dart` / `contact_section.dart`).
Point `onDownloadResume` at a real hosted PDF (e.g. a link to your resume on
Google Drive, GitHub, or your own domain).

**Contact form submission:** the form currently only validates fields and
shows a confirmation snackbar locally (there's no backend). To make it
actually send messages, wire `_send()` in `lib/sections/contact_section.dart`
up to an email service (e.g. [Formspree](https://formspree.io),
EmailJS, or your own API) via an HTTP call.

## 📁 Project structure

```
lib/
  main.dart                  # App entry point, navigation, page scaffold
  theme/app_theme.dart       # Colors, text styles, responsive breakpoints
  widgets/
    common_widgets.dart      # Buttons, chips, cards, scroll-reveal animation
    nav_bar.dart             # Sticky nav bar + mobile menu
    phone_mockup.dart        # Animated phone dashboard mockups (hero)
  sections/                  # One file per page section
```

## 📱 Responsive breakpoints

Defined in `lib/theme/app_theme.dart`:

- Mobile: `< 700px`
- Tablet: `700px – 1000px`
- Desktop: `>= 1000px`

Made with ❤️ using Flutter.
# prabhu-web-animated-portfolio
# imprabhu
# imprabhu
# imprabhu

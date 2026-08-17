import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'theme/app_theme.dart';
import 'widgets/common_widgets.dart';
import 'widgets/nav_bar.dart';
import 'sections/hero_section.dart';
import 'sections/about_section.dart';
import 'sections/skills_section.dart';
import 'sections/projects_section.dart';
import 'sections/experience_section.dart';
import 'sections/achievements_section.dart';
import 'sections/testimonials_section.dart';
import 'sections/contact_section.dart';


void main() {
  runApp(const PortfolioApp());
}

/// Enables click-and-drag scrolling with a mouse on Flutter Web/Desktop,
/// which feels much more natural for a portfolio site than touch-only.
class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
        PointerDeviceKind.stylus,
      };
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prabhu Nath Tiwary - Associate Lead Software Engineer',
      debugShowCheckedModeBanner: false,
      scrollBehavior: AppScrollBehavior(),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          surface: AppColors.surface,
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: AppColors.primary,
          selectionColor: Color(0x556D5DF4),
          selectionHandleColor: AppColors.primary,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _achievementsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  late final List<NavItem> _navItems = [
    NavItem('About', _aboutKey),
    NavItem('Skills', _skillsKey),
    NavItem('Projects', _projectsKey),
    NavItem('Experience', _experienceKey),
    NavItem('Achievements', _achievementsKey),
    NavItem('Contact', _contactKey),
  ];

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, webOnlyWindowName: '_blank');
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            AppNavBar(
              items: _navItems,
              // Replace this URL with a real hosted resume PDF link.
              onDownloadResume: () => _openUrl('https://drive.google.com/file/d/1sdzqRDQ2rpyK79-c8Usv_HalLdRNReSs/view?usp=drive_link'),
            ),
            Expanded(
              child: ScrollRevealScope(
                controller: _scrollController,
                child: Scrollbar(
                  controller: _scrollController,
                  thumbVisibility: false,
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        HeroSection(
                          onDownloadResume: () =>
                              _openUrl('https://drive.google.com/file/d/1sdzqRDQ2rpyK79-c8Usv_HalLdRNReSs/view?usp=sharing'),
                          onViewGithub: () => _openUrl('https://github.com/prabhunath111'),
                          onLinkedIn: () => _openUrl('https://linkedin.com/in/prabhu-india'),
                        ),
                        AboutSection(key: _aboutKey),
                        SkillsSection(key: _skillsKey),
                        ProjectsSection(key: _projectsKey),
                        ExperienceSection(key: _experienceKey),
                        AchievementsSection(key: _achievementsKey),
                        const TestimonialsSection(),
                        ContactSection(key: _contactKey),
                        // const FooterSection(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

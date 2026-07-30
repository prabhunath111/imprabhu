import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import 'common_widgets.dart';

class NavItem {
  final String label;
  final GlobalKey sectionKey;
  const NavItem(this.label, this.sectionKey);
}

class AppNavBar extends StatefulWidget {
  final List<NavItem> items;
  final VoidCallback onDownloadResume;

  const AppNavBar({
    super.key,
    required this.items,
    required this.onDownloadResume,
  });

  @override
  State<AppNavBar> createState() => _AppNavBarState();
}

class _AppNavBarState extends State<AppNavBar> {
  void _goTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 550),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final mobile = isMobile(width) || isTablet(width);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.background.withValues(alpha: 0.85),
        border: const Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: ResponsiveContainer(
        child: SizedBox(
          height: 68,
          child: Row(
            children: [
              _Logo(),
              const Spacer(),
              if (!mobile) ...[
                for (final item in widget.items)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: _NavLink(
                      label: item.label,
                      onTap: () => _goTo(item.sectionKey),
                    ),
                  ),
                const SizedBox(width: 12),
                AppButton(
                  label: 'Download Resume',
                  icon: Icons.download_rounded,
                  onPressed: widget.onDownloadResume,
                ),
              ] else
                _MobileMenuButton(items: widget.items, onSelect: _goTo, onDownloadResume: widget.onDownloadResume),
            ],
          ),
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(9),
          ),
          child: const Icon(Icons.bolt_rounded, color: Colors.white, size: 20),
        ),
        const SizedBox(width: 10),
        Text(
          'Prabhu Tiwary',
          style: GoogleFonts.spaceGrotesk(
            color: AppColors.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _NavLink extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const _NavLink({required this.label, required this.onTap});

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 150),
          style: GoogleFonts.inter(
            color: _hover ? AppColors.textPrimary : AppColors.textSecondary,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          child: Text(widget.label),
        ),
      ),
    );
  }
}

class _MobileMenuButton extends StatelessWidget {
  final List<NavItem> items;
  final void Function(GlobalKey) onSelect;
  final VoidCallback onDownloadResume;

  const _MobileMenuButton({
    required this.items,
    required this.onSelect,
    required this.onDownloadResume,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => IconButton(
        icon: const Icon(Icons.menu_rounded, color: Colors.white),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: AppColors.surface,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (ctx) {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (final item in items)
                        ListTile(
                          title: Text(
                            item.label,
                            style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w500),
                          ),
                          onTap: () {
                            Navigator.pop(ctx);
                            Future.delayed(const Duration(milliseconds: 200), () => onSelect(item.sectionKey));
                          },
                        ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        child: AppButton(
                          label: 'Download Resume',
                          icon: Icons.download_rounded,
                          onPressed: () {
                            Navigator.pop(ctx);
                            onDownloadResume();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

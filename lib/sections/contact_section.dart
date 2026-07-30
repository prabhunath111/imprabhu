import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../widgets/common_widgets.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _messageCtrl = TextEditingController();

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _messageCtrl.dispose();
    super.dispose();
  }

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) await launchUrl(uri, webOnlyWindowName: '_blank');
  }

  void _send() {
    if (_nameCtrl.text.trim().isEmpty || _emailCtrl.text.trim().isEmpty || _messageCtrl.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields before sending.')),
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Thanks! Your message has been noted. 🎉')),
    );
    _nameCtrl.clear();
    _emailCtrl.clear();
    _messageCtrl.clear();
  }

  InputDecoration _decoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: GoogleFonts.inter(color: AppColors.textMuted, fontSize: 13.5),
      filled: true,
      fillColor: AppColors.background,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.primary),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final mobile = isMobile(width);

    final infoColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionLabel('Contact'),
        const SizedBox(height: 14),
        Text("Let's build something great together.",
            style: AppText.heading.copyWith(fontSize: mobile ? 22 : 26)),
        const SizedBox(height: 24),
        _ContactRow(
          icon: Icons.email_rounded,
          label: 'Email',
          value: 'prabhutiwari111@gmail.com',
          onTap: () => _openUrl('mailto:prabhutiwari111@gmail.com'),
        ),
        const SizedBox(height: 16),
        _ContactRow(
          icon: Icons.business_center_rounded,
          label: 'LinkedIn',
          value: '/prabhu-india',
          onTap: () => _openUrl('https://www.linkedin.com/in/prabhu-india'),
        ),
        const SizedBox(height: 16),
        _ContactRow(
          icon: Icons.code_rounded,
          label: 'GitHub',
          value: 'github.com/prabhunath111',
          onTap: () => _openUrl('https://github.com/prabhunath111'),
        ),
      ],
    );

    final formColumn = Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _nameCtrl,
                  style: GoogleFonts.inter(color: Colors.white, fontSize: 13.5),
                  decoration: _decoration('Your Name'),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: TextField(
                  controller: _emailCtrl,
                  style: GoogleFonts.inter(color: Colors.white, fontSize: 13.5),
                  decoration: _decoration('Your Email'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          TextField(
            controller: _messageCtrl,
            maxLines: 5,
            style: GoogleFonts.inter(color: Colors.white, fontSize: 13.5),
            decoration: _decoration('Your Message'),
          ),
          const SizedBox(height: 16),
          AppButton(label: 'Send Message', icon: Icons.send_rounded, onPressed: _send),
        ],
      ),
    );

    return Section(
      child: mobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RevealOnScroll(child: infoColumn),
                const SizedBox(height: 32),
                RevealOnScroll(delay: const Duration(milliseconds: 120), child: formColumn),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 4, child: RevealOnScroll(child: infoColumn)),
                const SizedBox(width: 40),
                Expanded(
                  flex: 6,
                  child: RevealOnScroll(delay: const Duration(milliseconds: 120), child: formColumn),
                ),
              ],
            ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback onTap;

  const _ContactRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return HoverScale(
      scale: 1.02,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: AppColors.primary, size: 18),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: GoogleFonts.inter(color: AppColors.textMuted, fontSize: 11.5)),
                Text(value,
                    style: GoogleFonts.inter(
                        color: AppColors.textPrimary, fontSize: 13.5, fontWeight: FontWeight.w600)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

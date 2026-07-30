import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/common_widgets.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final mobile = isMobile(width);

    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: Section(
        padding: const EdgeInsets.symmetric(vertical: 26),
        child: Flex(
          direction: mobile ? Axis.vertical : Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: mobile ? CrossAxisAlignment.center : CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Made with ', style: GoogleFonts.inter(color: AppColors.textMuted, fontSize: 12.5)),
                const Icon(Icons.favorite_rounded, color: Colors.redAccent, size: 13),
                Text(' using Flutter', style: GoogleFonts.inter(color: AppColors.textMuted, fontSize: 12.5)),
              ],
            ),
            if (mobile) const SizedBox(height: 10),
            Text(
              '© 2024 Prabhu Nath Tiwary. All rights reserved.',
              style: GoogleFonts.inter(color: AppColors.textMuted, fontSize: 12.5),
            ),
          ],
        ),
      ),
    );
  }
}

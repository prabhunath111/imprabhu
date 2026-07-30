import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Centralized color palette + text styles for the whole app.
/// Keeping this in one place makes it easy to re-theme the site.
class AppColors {
  AppColors._();

  static const Color background = Color(0xFF080B14);
  static const Color surface = Color(0xFF10141F);
  static const Color surfaceLight = Color(0xFF161B29);
  static const Color border = Color(0xFF232939);

  static const Color primary = Color(0xFF6D5DF4); // purple
  static const Color secondary = Color(0xFF3B82F6); // blue
  static const Color accent = Color(0xFF22D3EE); // cyan

  static const Color textPrimary = Color(0xFFF5F6FA);
  static const Color textSecondary = Color(0xFF9AA3B5);
  static const Color textMuted = Color(0xFF6B7385);

  static const Color success = Color(0xFF34D399);
  static const Color warning = Color(0xFFFBBF24);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, secondary],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient glowGradient = LinearGradient(
    colors: [Color(0xFF6D5DF4), Color(0xFF22D3EE)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

class AppText {
  AppText._();

  static TextStyle heading = GoogleFonts.spaceGrotesk(
    color: AppColors.textPrimary,
    fontWeight: FontWeight.w700,
    height: 1.15,
  );

  static TextStyle body = GoogleFonts.inter(
    color: AppColors.textSecondary,
    fontWeight: FontWeight.w400,
    height: 1.6,
  );

  static TextStyle label = GoogleFonts.inter(
    color: AppColors.primary,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.1,
  );
}

/// Simple responsive breakpoints used across the whole site.
class Breakpoints {
  Breakpoints._();
  static const double mobile = 700;
  static const double tablet = 1000;
  static const double desktop = 1200;
}

bool isMobile(double width) => width < Breakpoints.mobile;
bool isTablet(double width) => width >= Breakpoints.mobile && width < Breakpoints.tablet;
bool isDesktop(double width) => width >= Breakpoints.tablet;

/// Max content width so text doesn't stretch edge-to-edge on huge monitors.
const double kMaxContentWidth = 1200;

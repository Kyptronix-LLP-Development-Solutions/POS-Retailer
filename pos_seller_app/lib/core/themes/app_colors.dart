import 'package:flutter/material.dart';

// Define light theme colors (5 core colors)
class LightThemeColors {
  // Primary color (used for main buttons and CTAs)
  static Color primary = Color(0xFF2563EB);

  // Text/icons on primary color
  static Color onPrimary = Colors.white;

  // Secondary color (used for secondary actions, links)
  static Color secondary = Color(0xFF6366F1);

  // Text/icons on secondary color
  static Color onSecondary = Colors.white;

  // Accent color (used for highlights or special actions)
  static Color accent = Color(0xFFEC4899);

  // Background color (used for screens or large backgrounds)
  static Color background = Color(0xFFF8FAFC);

  // Text color (default text on background)
  static Color text = Color(0xFF0F172A);

  // Feedback colors
  static Color success = Color(0xFF22C55E); // Success color (emerald)
  static Color info = Color(0xFF3B82F6); // Info color (blue)
  static Color warning = Color(0xFFF59E0B); // Warning color (amber)
}

// Define dark theme colors (5 core colors)
class DarkThemeColors {
  // Primary color (used for main buttons and CTAs)
  static Color primary = Color(0xFF3B82F6);

  // Text/icons on primary color
  static Color onPrimary = Colors.white;

  // Secondary color (used for secondary actions, links)
  static Color secondary = Color(0xFF818CF8);

  // Text/icons on secondary color
  static Color onSecondary = Colors.white;

  // Accent color (used for highlights or special actions)
  static Color accent = Color(0xFFDB2777);

  // Background color (used for screens or large backgrounds)
  static Color background = Color(0xFF0F172A);

  // Text color (default text on background)
  static Color text = Color(0xFFF8FAFC);

  // Feedback colors
  static Color success = Color(0xFF34D399); // Success color (emerald)
  static Color info = Color(0xFF60A5FA); // Info color (blue)
  static Color warning = Color(0xFFFBBF24); // Warning color (amber)
}

// Define gradients (for modern UI and button effects)
class GradientColors {
  // Gradient for primary actions like buttons or headers
  static Gradient primaryGradient = LinearGradient(
    colors: [
      Color(0xFF2563EB), // Blue 600
      Color(0xFF1D4ED8), // Blue 700
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Gradient for secondary actions like buttons or backgrounds
  static Gradient secondaryGradient = LinearGradient(
    colors: [
      Color(0xFF6366F1), // Indigo 500
      Color(0xFF4F46E5), // Indigo 600
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Gradient for success actions (like success buttons or badges)
  static Gradient successGradient = LinearGradient(
    colors: [
      Color(0xFF22C55E), // Green 500
      Color(0xFF16A34A), // Green 600
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Gradient for warning actions (like warning buttons or messages)
  static Gradient warningGradient = LinearGradient(
    colors: [
      Color(0xFFF59E0B), // Amber 500
      Color(0xFFD97706), // Amber 600
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Modern UI gradients for screens and backgrounds
  static Gradient coolBlueGradient = LinearGradient(
    colors: [
      Color(0xFF3B82F6), // Blue 500
      Color(0xFF6366F1), // Indigo 500
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Soft gradient for cards or subtle backgrounds
  static Gradient softGradient = LinearGradient(
    colors: [
      Color(0xFFF1F5F9), // Slate 100
      Color(0xFFE2E8F0), // Slate 200
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // Dark theme gradient for screens
  static Gradient darkGradient = LinearGradient(
    colors: [
      Color(0xFF0F172A), // Slate 900
      Color(0xFF1E293B), // Slate 800
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // Accent gradient for special elements
  static Gradient accentGradient = LinearGradient(
    colors: [
      Color(0xFFEC4899), // Pink 500
      Color(0xFFDB2777), // Pink 600
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

/*
1. Primary Color (primary)
The Primary Color is the main brand color and is typically used for the most important UI elements or actions. It should be used for core functions and high-priority actions.

Where to Use:
Buttons: Main call-to-action (CTA) buttons, such as "Submit", "Save", or "Checkout".
AppBar: The AppBar background color (or any navigation bar).
Floating Action Button (FAB): The main action button, especially in apps that have a single primary action (e.g., "Add", "Create", "Post").
Selected Items: Use the primary color for active or selected items in a list or tab bar.
Bottom Navigation Bar: Set the selected item color in your bottom navigation to highlight the active tab.



2. Secondary Color (secondary)
The Secondary Color is used for elements that are important but secondary to the primary actions. It helps add visual interest and variety, often as a contrast to the primary color.

Where to Use:
Secondary Buttons: Use for less important buttons or secondary actions such as "Cancel", "Edit", "Learn More", or "View Details".
Links: Use the secondary color for links or text that needs to stand out but isn’t critical.
Tab Bars: Use for inactive tabs in a tab bar or for items that aren't the primary focus.
Badges: Highlight badges, such as notification counts, sale tags, or labels.
Icons: Secondary-colored icons in certain UI components, especially icons that are used for secondary actions (like a pencil icon for editing).



3. Accent Color (accent)
The Accent Color is typically used for highlighting or drawing attention to specific elements that require extra focus or emphasis. This is often used for non-essential actions or important indicators that need to be distinct.

Where to Use:
Badges: For notification badges or status indicators that are used to draw attention to something (e.g., unread messages, new notifications, or updates).
Progress Indicators: Use for loading spinners, progress bars, or indicators that show ongoing processes (e.g., in file uploads or downloads).
Links/Highlights: Use it for hyperlinks, highlighted text, or tags that need to stand out without overshadowing primary actions.
Floating Action Button (FAB): In some designs, the FAB can be an accent color when used for actions like adding or creating something new.
Highlight Text: Use for text that needs extra emphasis, like discounts or special offers (e.g., "50% off").
*/

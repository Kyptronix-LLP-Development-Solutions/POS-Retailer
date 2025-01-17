import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos_seller_app/core/themes/app_colors.dart';

import '../themes/get_theme_mode.dart';

class CustomTextButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  const CustomTextButton(
      {super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    bool isDark = isDarkMode(context);
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: GoogleFonts.poppins(
          color:
              isDark ? LightThemeColors.secondary : DarkThemeColors.secondary,
          fontSize: 14.0,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class CustomButtonText extends StatelessWidget {
  final String text;
  const CustomButtonText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    bool isDark = isDarkMode(context);
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: isDark ? LightThemeColors.onPrimary : DarkThemeColors.onPrimary,
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class CustomBodyText extends StatelessWidget {
  final String text;
  final Color? color;
  final double fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;

  const CustomBodyText({
    super.key,
    required this.text,
    this.color,
    this.fontSize = 14.0, // Default font size
    this.fontWeight = FontWeight.normal, // Default font weight
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    // Determine text color based on theme
    final textColor = color ??
        (isDarkMode(context) ? DarkThemeColors.text : LightThemeColors.text);

    return Text(
      text,
      style: GoogleFonts.poppins(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
    );
  }
}



/*
Ah, I see! You want to create **multiple custom text widgets** in a similar structure to the example you provided. Here are some suggestions for naming multiple classes that extend `StatelessWidget` and represent different variations of custom text widgets.

### 1. **`CustomHeadingText`**
   - A widget for custom heading-style text (e.g., titles or headers).

### 2. **`CustomBodyText`**
   - A widget for standard body text with a particular style.

### 3. **`CustomSubheadingText`**
   - A widget for subheading or subtitle-style text.

### 4. **`CustomCaptionText`**
   - A widget for smaller caption-like text, often used for footnotes or small print.

### 5. **`CustomLabelText`**
   - A widget for labels, such as form labels or tag-like text.

### 6. **`CustomTitleText`**
   - A widget specifically for titles, larger text used to introduce content sections.

### 7. **`CustomParagraphText`**
   - A widget for displaying longer blocks of text, like paragraphs or descriptions.

### 8. **`CustomInfoText`**
   - A widget for displaying informational text, such as tooltips or informational messages.

### 9. **`CustomActionText`**
   - A widget for action-related text, such as buttons or links.

### 10. **`CustomSuccessText`**
   - A widget specifically styled for success messages or positive notifications.

### 11. **`CustomErrorText`**
   - A widget for error messages or warning texts, typically used with red or cautionary styles.

### 12. **`CustomQuoteText`**
   - A widget designed to display quotes, often styled in italics or with indentation.

### 13. **`CustomButtonText`**
   - A widget for button text, where styling is optimized for clickable text.

### 14. **`CustomDescriptionText`**
   - A widget for descriptive text that explains or provides more information.

### 15. **`CustomTagText`**
   - A widget designed for tags or keywords, commonly used in tag clouds or labels.

### 16. **`CustomLinkText`**
   - A widget for links or clickable text styled in the way you'd expect for hyperlinks.
*/
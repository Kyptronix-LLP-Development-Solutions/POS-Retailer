import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeState { lightMode, darkMode }

class ThemeCubit extends Cubit<ThemeState> {
  static const String _themeKey = 'theme_mode';

  ThemeCubit() : super(ThemeState.lightMode) {
    _loadTheme();
  }

  void _loadTheme() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedTheme = prefs.getString(_themeKey);
      if (savedTheme != null) {
        emit(_mapStringToThemeState(savedTheme));
      }
    } catch (e) {
      // Handle error if needed
      emit(ThemeState.lightMode);
    }
  }

  void toggleTheme() async {
    final newTheme = state == ThemeState.lightMode
        ? ThemeState.darkMode
        : ThemeState.lightMode;
    emit(newTheme);
    await _saveTheme(newTheme);
  }

  Future<void> _saveTheme(ThemeState theme) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_themeKey, theme.toString());
    } catch (e) {
      // Handle error if needed
    }
  }

  ThemeState _mapStringToThemeState(String theme) {
    switch (theme) {
      case 'ThemeState.darkMode':
        return ThemeState.darkMode;
      case 'ThemeState.lightMode':
      default:
        return ThemeState.lightMode;
    }
  }
}

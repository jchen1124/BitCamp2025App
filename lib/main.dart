import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bitcamp_2025/screens/start_screen.dart';

// Color theme
final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 4, 215, 247),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(theme: theme, home: StartScreen());
  }
}

import 'package:flutter/material.dart';
import 'package:bitcamp_2025/screens/create_profile.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  double _iconScale = 0.0;

  @override
  void initState() {
    super.initState();
    // Trigger animation after build starts
    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        _iconScale = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black,
              colorScheme.primary.withOpacity(0.8),
              colorScheme.secondary.withOpacity(0.4),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Eye icon with animated scale
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.05),
                      boxShadow: [
                        BoxShadow(
                          color: colorScheme.secondary.withOpacity(0.6),
                          blurRadius: 30,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: AnimatedScale(
                      scale: _iconScale,
                      duration: Duration(seconds: 2),
                      curve: Curves.easeOutBack,
                      child: Icon(
                        Icons.remove_red_eye_outlined,
                        size: 120,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  Text(
                    "ECHO VISION",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: 2,
                      shadows: [
                        Shadow(
                          blurRadius: 30,
                          color: colorScheme.secondary,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateProfile(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: colorScheme.primary,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 18,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      elevation: 12,
                      shadowColor: colorScheme.secondary.withOpacity(0.5),
                    ),
                    child: const Text(
                      "GET STARTE",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

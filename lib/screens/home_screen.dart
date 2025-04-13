import 'package:flutter/material.dart';
import 'package:bitcamp_2025/screens/live_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1C), // Slightly lighter background
      appBar: AppBar(
        backgroundColor: const Color(0xFF0FF0FC),
        elevation: 10,
        title: const Text(
          "Echo Vision",
          style: TextStyle(
            fontSize: 28,
            color: Colors.black,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome,",
              style: TextStyle(
                color: Colors.white.withOpacity(
                  0.8,
                ), // Increased opacity for contrast
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              name,
              style: const TextStyle(
                color: Color(0xFF0FF0FC),
                fontSize: 34,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 32),

            // Live View Card
            _buildFeatureCard(
              context,
              title: "🔴 Live Environment View",
              description:
                  "Monitor real-time environmental conditions using our vision AI.",
              buttonText: "Live View",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LiveView()),
                );
              },
            ),

            const SizedBox(height: 20),

            // History Card
            _buildFeatureCard(
              context,
              title: "📼 View Recording History",
              description: "Review and analyze your past environments.",
              buttonText: "View History",
              onPressed: () {
                //Implement if we need it
                // TODO: Implement
              },
            ),
          ],
        ),
      ),
    );
  }

  // You can reuse _buildFeatureCard
  Widget _buildFeatureCard(
    BuildContext context, {
    required String title,
    required String description,
    required String buttonText,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF343434),
            Color(0xFF2C2C2C),
          ], // Slightly lighter gradient
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.tealAccent.withOpacity(0.3), // Subtle shadow
            blurRadius: 15,
            spreadRadius: 2,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white.withOpacity(
                  0.85,
                ), // Slightly higher opacity for better contrast
              ),
            ),
            const SizedBox(height: 28),
            Center(
              child: InkWell(
                onTap: onPressed,
                borderRadius: BorderRadius.circular(14),
                splashColor: Colors.cyanAccent,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 36,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0FF0FC),
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(
                          0xFF0FF0FC,
                        ).withOpacity(0.6), // More visible shadow
                        blurRadius: 15,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Text(
                    buttonText,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.1,
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

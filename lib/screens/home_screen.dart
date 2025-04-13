import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String name;

  const HomeScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Bright background
      appBar: AppBar(
        backgroundColor: Colors.cyan[100],
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Echo Vision",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome,",
              style: TextStyle(fontSize: 20, color: Colors.black87),
            ),
            const SizedBox(height: 4),
            Text(
              name,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 30),
            _buildCard(
              icon: Icons.videocam,
              title: "Live Environment View",
              subtitle:
                  "Monitor real-time environmental conditions using our vision AI.",
              buttonText: "Live View",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LiveView()),
                );
              },
            ),
            const SizedBox(height: 20),
            _buildCard(
              icon: Icons.history,
              title: "View Recording History",
              subtitle: "Review and analyze your past environments.",
              buttonText: "View History",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const RecordingHistoryScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required String buttonText,
    required VoidCallback onPressed,
  }) {
    return Card(
      color: const Color(0xFF2C2C2C), // Dark card background
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      shadowColor: Colors.tealAccent.withOpacity(0.5),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 26, color: Colors.white),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 14, color: Colors.white70),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyanAccent,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                ),
                child: Text(
                  buttonText,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Dummy pages for navigation
class LiveView extends StatelessWidget {
  const LiveView({super.key});
  @override
  Widget build(BuildContext context) =>
      Scaffold(appBar: AppBar(title: const Text("Live View")));
}

class RecordingHistoryScreen extends StatelessWidget {
  const RecordingHistoryScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      Scaffold(appBar: AppBar(title: const Text("Recording History")));
}

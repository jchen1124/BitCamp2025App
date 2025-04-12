import 'package:flutter/material.dart';
import 'package:bitcamp_2025/screens/live_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 68, 66, 66),
      appBar: AppBar(
        backgroundColor: Color(0xFF47E0F8),
        elevation: 10,
        title: const Text(
          "Echo Vision",
          style: TextStyle(
            fontSize: 28,
            color: Color.fromARGB(255, 5, 5, 5),
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome,",
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              name,
              style: const TextStyle(
                color: Color(0xFF47E0F8),
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),

            // Optional card to highlight live view feature
            Card(
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 6,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Live Environment View",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Monitor real-time environmental conditions using our vision AI.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.75),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: ElevatedButton.icon(
                        // Go to live view page
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LiveView()),
                          );
                        },
                        icon: const Icon(Icons.visibility),
                        label: const Text("Live View"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF47E0F8),
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 32,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          elevation: 3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),

            Card(
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 6,
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "View Recording History",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Review your past environments",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.75),
                      ),
                    ),

                    SizedBox(height: 30),

                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("View History"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF47E0F8),
                          //text color
                          foregroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 32,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          elevation: 3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:bitcamp_2025/models/user_profiles.dart';
import 'package:bitcamp_2025/screens/home_screen.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  final _formKey = GlobalKey<FormState>();

  final _usersFullName = TextEditingController();
  final _username = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  List<UserProfiles> _profiles = [];

  @override
  void dispose() {
    _usersFullName.dispose();
    _username.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose(); // Don't forget this
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final profile = UserProfiles(
        name: _usersFullName.text,
        username: _username.text,
        email: _email.text,
        password: _password.text,
      );

      setState(() {
        _profiles.add(profile);
      });

      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     duration: Duration(milliseconds: 800),
      //     content: Text('Profile Added'),
      //   ),
      // );

      final String name = _usersFullName.text;

      // _usersFullName.clear();
      // _username.clear();
      // _email.clear();
      // _password.clear();

      // Transition animation
      Future.delayed(const Duration(milliseconds: 800), () {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder:
                (context, animation, secondaryAnimation) =>
                    HomeScreen(name: _usersFullName.text),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              // Changed this
              final tween = Tween(begin: 0.0, end: .5);
              final fadeAnimation = animation.drive(tween);
              return FadeTransition(opacity: fadeAnimation, child: child);
            },
          ),
        );
      });
    }
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool isPassword = false,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.white70),
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: const Color(0xFF2C2C2C),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      validator: validator,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Create Profile"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(136, 4, 129, 238),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "Welcome!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Let's get your profile set up",
                      style: TextStyle(color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),

                    _buildTextField(
                      controller: _usersFullName,
                      label: "Full Name",
                      icon: Icons.person,
                      validator:
                          (value) =>
                              value == null || value.isEmpty
                                  ? "Please enter your name"
                                  : null,
                    ),
                    const SizedBox(height: 20),

                    _buildTextField(
                      controller: _username,
                      label: "Username",
                      icon: Icons.account_circle,
                      validator:
                          (value) =>
                              value == null || value.isEmpty
                                  ? "Please enter username"
                                  : null,
                    ),
                    const SizedBox(height: 20),

                    _buildTextField(
                      controller: _email,
                      label: "Email",
                      icon: Icons.email,
                      keyboardType: TextInputType.emailAddress,
                      validator:
                          (value) =>
                              value == null || !value.contains('@')
                                  ? "Enter a valid email"
                                  : null,
                    ),
                    const SizedBox(height: 20),

                    _buildTextField(
                      controller: _password,
                      label: "Password",
                      icon: Icons.lock,
                      isPassword: true,
                      validator:
                          (value) =>
                              value == null || value.length < 6
                                  ? "Password too short"
                                  : null,
                    ),
                    const SizedBox(height: 30),

                    ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurpleAccent,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        textStyle: const TextStyle(fontSize: 18),
                      ),
                      child: const Text("Submit"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

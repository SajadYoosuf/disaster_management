import 'package:flutter/material.dart';
import '../../../student/presentation/mobile/student_dashboard_mobile.dart';

class StudentAuthMobileNavigation extends StatefulWidget {
  const StudentAuthMobileNavigation({super.key});

  @override
  State<StudentAuthMobileNavigation> createState() =>
      _StudentAuthMobileNavigationState();
}

class _StudentAuthMobileNavigationState
    extends State<StudentAuthMobileNavigation> {
  // Simple navigation state for auth flow
  bool _showRegister = false;

  void _toggleAuth() {
    setState(() {
      _showRegister = !_showRegister;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_showRegister) {
      return StudentRegisterScreen(onLoginTap: _toggleAuth);
    } else {
      return StudentLoginScreen(onRegisterTap: _toggleAuth);
    }
  }
}

class StudentLoginScreen extends StatelessWidget {
  final VoidCallback onRegisterTap;

  const StudentLoginScreen({super.key, required this.onRegisterTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              // Illustration Placeholder
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://img.freepik.com/free-vector/students-studying-together-illustrated_23-2148754593.jpg',
                    ), // Placeholder
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Join the Mission',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Inter',
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Master safety protocols through immersive gamified\nsimulation scenarios',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  height: 1.5,
                  fontFamily: 'Inter',
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'Full Name',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                  prefixIcon: const Icon(Icons.person, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Password',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot password ?',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Navigate to Dashboard
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StudentDashboardMobile(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1D4ED8), // Royal Blue
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                  shadowColor: const Color(0xFF1D4ED8).withOpacity(0.4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Start your safety journey',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.rocket_launch, size: 20),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don,t have an account? ",
                    style: TextStyle(color: Colors.grey),
                  ),
                  GestureDetector(
                    onTap: onRegisterTap,
                    child: const Text(
                      'sign up',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1D4ED8),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class StudentRegisterScreen extends StatelessWidget {
  final VoidCallback onLoginTap;

  const StudentRegisterScreen({super.key, required this.onLoginTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://img.freepik.com/free-vector/students-studying-together-illustrated_23-2148754593.jpg',
                    ), // Placeholder
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Join the Mission',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Inter',
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Master safety protocols through immersive gamified\nsimulation scenarios',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  height: 1.5,
                  fontFamily: 'Inter',
                ),
              ),
              const SizedBox(height: 40),

              const Text(
                'Full Name',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                  prefixIcon: const Icon(Icons.person, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
              const SizedBox(height: 24),

              const Text(
                'School Student ID',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  hintText: 'STU-2024-001',
                  prefixIcon: const Icon(Icons.badge, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
              const SizedBox(height: 24),

              const Text(
                'Password',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),

              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Navigate to Dashboard
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StudentDashboardMobile(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1D4ED8),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                  shadowColor: const Color(0xFF1D4ED8).withOpacity(0.4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Start your safety journey',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.rocket_launch, size: 20),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have a account? ",
                    style: TextStyle(color: Colors.grey),
                  ),
                  GestureDetector(
                    onTap: onLoginTap,
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1D4ED8),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

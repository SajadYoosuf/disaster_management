import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/theme/app_theme.dart';
import 'auth_login_screen.dart';

class AuthSelectionScreen extends StatelessWidget {
  const AuthSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkBackground,
      body: Stack(
        children: [
          // Background Sparkles (Simplified as Gradients/Circles for now)
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.05),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.05),
                    blurRadius: 50,
                    spreadRadius: 20,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 100,
            right: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.05),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.05),
                    blurRadius: 50,
                    spreadRadius: 10,
                  ),
                ],
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  // Logo/Illustration Placeholder
                  Center(
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.auto_awesome,
                        size: 60,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
                  Text(
                    'Welcome back',
                    style: GoogleFonts.inter(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Enter your details to access your account',
                    style: GoogleFonts.inter(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Login as a',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildLoginButton(context, 'Student'),
                  const SizedBox(height: 16),
                  _buildLoginButton(context, 'Teacher'),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context, String role) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AuthLoginScreen(role: role),
            ),
          );
        },
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white, // Text color
          side: const BorderSide(color: Colors.white), // Border color
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: role == 'Student'
              ? Colors.white
              : Colors.transparent, // Active style for student demo
        ),
        child: Text(
          role,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: role == 'Student' ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}

// Extension to add blur radius to BoxDecoration if simpler
extension Blur on BoxDecoration {
  BoxDecoration copyWith({double? blurRadius}) {
    // Custom implementation or use BackdropFilter in widget tree
    return this;
  }
}

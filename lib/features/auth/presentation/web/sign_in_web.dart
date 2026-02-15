import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/theme/app_theme.dart';

class SignInWeb extends StatelessWidget {
  const SignInWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF10121B), Color(0xFF1B1E2B)],
          ),
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Container(
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                color: const Color(0xFF0F1116),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white.withOpacity(0.1)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Logo/Icon
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE2E2E2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.school,
                      size: 32,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Novox Admin',
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Institutional Management portal',
                    style: GoogleFonts.inter(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 32),
                  // Form
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Sign In',
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Enter your Administrative Credentials',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Email Input
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Admin Email',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'abcd@gmail.com',
                      prefixIcon: const Icon(
                        Icons.alternate_email,
                        color: Colors.grey,
                      ),
                      filled: true,
                      fillColor: const Color(0xFFE2E2E2),
                      hintStyle: const TextStyle(color: Colors.grey),
                      contentPadding: const EdgeInsets.symmetric(vertical: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Password Input
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Password',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    obscureText: true,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: '••••••••',
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        color: Colors.grey,
                      ),
                      suffixIcon: const Icon(
                        Icons.visibility_off_outlined,
                        color: Colors.grey,
                      ),
                      filled: true,
                      fillColor: const Color(0xFFE2E2E2),
                      hintStyle: const TextStyle(color: Colors.grey),
                      contentPadding: const EdgeInsets.symmetric(vertical: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forget password?',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(
                          0xFF0F1116,
                        ), // Dark button as per design
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Colors.white24),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Sign in',
                        style: GoogleFonts.inter(fontWeight: FontWeight.w600),
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

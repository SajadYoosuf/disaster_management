import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/theme/app_theme.dart';
import 'auth_register_screen.dart';

class AuthLoginScreen extends StatelessWidget {
  final String role;

  const AuthLoginScreen({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkBackground,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    const SizedBox(height: 60),
                    // Avatar
                    Center(
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.white.withOpacity(0.1),
                        backgroundImage: const NetworkImage(
                          'https://i.pravatar.cc/300',
                        ), // Placeholder
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Hi $role',
                      style: GoogleFonts.inter(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Sign in to continue',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 40),
                    // White Bottom Sheet
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 40,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Mobile Number/Email',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            TextField(
                              decoration: const InputDecoration(
                                hintText: 'Maya@gmail.com',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppTheme.surfaceColor,
                                  ),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                fillColor: Colors.white,
                              ),
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 24),
                            Text(
                              'Password',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            TextField(
                              obscureText: true,
                              decoration: const InputDecoration(
                                hintText: '••••••••',
                                suffixIcon: Icon(
                                  Icons.visibility_off_outlined,
                                  color: Colors.grey,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppTheme.surfaceColor,
                                  ),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                fillColor: Colors.white,
                              ),
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Forgot Password?',
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(height: 32),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Navigate to Dashboard or Student Home
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF1B1E2B),
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'SIGN IN',
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    const Icon(Icons.arrow_forward, size: 20),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have account ? ",
                                  style: GoogleFonts.inter(
                                    color: Colors.grey[700],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const AuthRegisterScreen(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Register here',
                                    style: GoogleFonts.inter(
                                      color: const Color(0xFF1B1E2B),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20), // Bottom padding
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

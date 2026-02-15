import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/theme/app_theme.dart';

class AuthRegisterScreen extends StatelessWidget {
  const AuthRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkBackground,
      body: Column(
        children: [
          const SizedBox(height: 60),
          Text(
            'Create your account',
            style: GoogleFonts.inter(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 8),
            child: Text(
              'Register to access educational platform and manage your students scenarios and progress',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(fontSize: 14, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 40),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 40,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextField('Enter full name', 'Maya kk'),
                    _buildTextField('Enter Teacher id', '54896'),
                    _buildTextField('Enter Institution name', 'Novox'),
                    _buildTextField('Enter Division', '10 D'),
                    _buildTextField(
                      'Enter Mobile number',
                      '9874563210',
                      keyboardType: TextInputType.phone,
                    ),
                    _buildTextField(
                      'Enter Email',
                      'mayakk@gmail.com',
                      keyboardType: TextInputType.emailAddress,
                    ),

                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Next step: Create Profile
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1B1E2B),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Next',
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
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account? ",
                            style: GoogleFonts.inter(color: Colors.grey[700]),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Text(
                              'sign In',
                              style: GoogleFonts.inter(
                                color: const Color(0xFF1B1E2B),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
    String label,
    String hint, {
    TextInputType? keyboardType,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.inter(fontSize: 12, color: Colors.grey),
          ),
          TextField(
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hint,
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppTheme.surfaceColor),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
              fillColor: Colors.white,
              filled: true,
            ),
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

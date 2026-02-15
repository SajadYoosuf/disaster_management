import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TeacherProfilePageMobile extends StatelessWidget {
  const TeacherProfilePageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        title: Text(
          'Profile',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFF3F4F6),
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 18,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: const Icon(Icons.notifications_none, color: Colors.black),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  padding: const EdgeInsets.all(4), // Border width
                  decoration: const BoxDecoration(
                    color: Color(0xFF1B1E2B), // Dark border color
                    shape: BoxShape.circle,
                  ),
                  child: const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      'https://i.pravatar.cc/300?u=maya',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: Color(0xFF1B1E2B),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.edit, color: Colors.white, size: 16),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Maya kk',
              style: GoogleFonts.inter(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1B1E2B),
              ),
            ),
            Text(
              'Disaster Risk Management Specialist',
              style: GoogleFonts.inter(
                fontSize: 14,
                color: Colors.blueAccent,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'ID : 28499',
              style: GoogleFonts.inter(
                fontSize: 12,
                color: Colors.grey[700],
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 32),

            // Classes Handled
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Classes Handled',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildInfoCard(
              Icons.groups,
              'Grade 10 - Section A',
              hasArrow: true,
            ),
            const SizedBox(height: 12),
            _buildInfoCard(Icons.groups, 'Grade 9 - Section B', hasArrow: true),

            const SizedBox(height: 24),
            // School Info
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'School Info',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildInfoCard(
              Icons.school,
              'Novox Edtech LLP',
              subtitle: 'School Name',
            ),
            const SizedBox(height: 12),
            _buildInfoCard(
              Icons.location_on,
              'Emerald Mall, 4th, Arayidathupalam, Kozhikode, Kerala',
              subtitle: 'Location',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(
    IconData icon,
    String title, {
    String? subtitle,
    bool hasArrow = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: subtitle != null
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: const Color(0xFF1B1E2B), size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (subtitle != null) ...[
                  Text(
                    subtitle,
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1B1E2B),
                  ),
                ),
              ],
            ),
          ),
          if (hasArrow)
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
        ],
      ),
    );
  }
}

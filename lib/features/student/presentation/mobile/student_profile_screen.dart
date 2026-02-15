import 'package:flutter/material.dart';
import 'student_edit_profile_screen.dart';

class StudentProfileScreen extends StatelessWidget {
  const StudentProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.arrow_back_ios_new, size: 16),
              ),
              const Text(
                'Profile',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(width: 32), // Spacer for centering
            ],
          ),
          const SizedBox(height: 32),

          // Avatar & Info
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF1D4ED8), // Blue ring
                ),
                child: const CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    'https://i.pravatar.cc/300?u=omar',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: const Color(0xFF1D4ED8),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.edit, color: Colors.white, size: 16),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Class 10-D',
            style: TextStyle(
              color: Color(0xFF1D4ED8),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF1D4ED8),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'ID: 986413',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 48),

          // Menu Items
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              children: [
                _buildMenuItem(
                  icon: Icons.account_circle_outlined,
                  text: 'Edit Profile',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const StudentEditProfileScreen(),
                      ),
                    );
                  },
                ),
                const Divider(height: 1),
                _buildMenuItem(
                  icon: Icons.notifications_none,
                  text: 'Notifications',
                  onTap: () {},
                ),
                const Divider(height: 1),
                _buildMenuItem(
                  icon: Icons.settings_outlined,
                  text: 'Settings',
                  onTap: () {},
                ),
                const Divider(height: 1),
                _buildMenuItem(
                  icon: Icons.headset_mic_outlined,
                  text: 'Help and Support',
                  onTap: () {},
                ),
                const Divider(height: 1),
                _buildMenuItem(
                  icon: Icons.logout,
                  text: 'Log Out',
                  onTap: () {},
                  textColor: Colors.black, // Design shows black
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
    Color textColor = Colors.black,
  }) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF1D4ED8)),
      title: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: textColor,
          fontSize: 16,
        ),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
    );
  }
}

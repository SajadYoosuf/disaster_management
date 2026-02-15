import 'package:flutter/material.dart';

class StudentEditProfileScreen extends StatelessWidget {
  const StudentEditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.arrow_back_ios_new, size: 16),
                    ),
                  ),
                  const Text(
                    'Edit Profile',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.notifications_none, size: 20),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Avatar
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF1B1E2B),
                    ),
                    child: const CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                        'https://i.pravatar.cc/300?u=omar',
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Color(0xFF1B1E2B),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Form
              _buildInputLabel('Name'),
              _buildTextField('Alex kk', Icons.person),
              const SizedBox(height: 16),

              _buildInputLabel('Institution Name'),
              _buildTextField('Novox Edtech LLP', Icons.school),
              const SizedBox(height: 16),

              _buildInputLabel('class'),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField('10th grade', Icons.person_outline),
                  ),
                  const SizedBox(width: 16),
                  Expanded(child: _buildTextField('Section D', Icons.bookmark)),
                ],
              ),
              const SizedBox(height: 16),

              _buildInputLabel('Mobile no.'),
              _buildTextField('987654321', Icons.phone),
              const SizedBox(height: 16),

              _buildInputLabel('Mail'),
              _buildTextField('Alexkk@gmail.com', Icons.email),

              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Save logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1B1E2B), // Dark Button
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Saved Changes',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.save, size: 16),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputLabel(String label) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, IconData icon) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        prefixIcon: Icon(icon, color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade200), // Subtle border
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }
}

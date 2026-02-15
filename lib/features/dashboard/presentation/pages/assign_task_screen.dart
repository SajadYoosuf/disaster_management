import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AssignTaskScreen extends StatefulWidget {
  const AssignTaskScreen({super.key});

  @override
  State<AssignTaskScreen> createState() => _AssignTaskScreenState();
}

class _AssignTaskScreenState extends State<AssignTaskScreen> {
  String assignmentMode = 'Single'; // Single or Group

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        title: Text(
          'Assign Task',
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
            onPressed: () => Navigator.pop(context),
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
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Select Students'),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFE2E4E9), // Grey container as in design
                borderRadius: BorderRadius.circular(16),
              ),
              // Minimum height placeholder
              constraints: const BoxConstraints(minHeight: 150),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildChip('Alex kk'),
                  _buildChip('Neha mm'),
                  ActionChip(
                    label: Text(
                      '+ Add Student',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                    onPressed: () {},
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(color: Colors.grey),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            _buildSectionTitle('Choose Scenario'),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(
                        0xFFA7F3D0,
                      ).withOpacity(0.5), // Light green
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.monitor_heart,
                      color: Color(0xFF059669),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Earthquake response',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: const Color(0xFF1B1E2B),
                          ),
                        ),
                        Text(
                          'Hazard response training',
                          style: GoogleFonts.inter(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    color: Color(0xFF1B1E2B),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            _buildSectionTitle('Assignment Mode'),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: const Color(0xFFE2E4E9),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: _buildModeButton(
                      'Single',
                      assignmentMode == 'Single',
                    ),
                  ),
                  Expanded(
                    child: _buildModeButton('Group', assignmentMode == 'Group'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            _buildSectionTitle('Deadline'),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFE2E4E9),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Feb 20 2026', // Dynamic date
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1B1E2B),
                    ),
                  ),
                  const Icon(
                    Icons.calendar_today,
                    size: 20,
                    color: Color(0xFF1B1E2B),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1B1E2B),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Assign Scenario',
                  style: GoogleFonts.inter(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: Colors.white,
                  ), // Actually in design it looks white bg with white border? No, it looks like white button.
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF1B1E2B),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide.none,
                  ),
                ),
                child: Text(
                  'Cancel',
                  style: GoogleFonts.inter(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  Widget _buildChip(String label) {
    return Chip(
      label: Text(
        label,
        style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600),
      ),
      deleteIcon: const Icon(Icons.close, size: 14),
      onDeleted: () {},
      backgroundColor: const Color(0xFFCFD2D9), // Slightly darker grey
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
    );
  }

  Widget _buildModeButton(String label, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          assignmentMode = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : [],
        ),
        child: Center(
          child: Text(
            label,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1B1E2B),
            ),
          ),
        ),
      ),
    );
  }
}

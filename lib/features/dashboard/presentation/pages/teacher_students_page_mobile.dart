import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'assign_task_screen.dart';
import 'student_performance_page_mobile.dart';

class TeacherStudentsPageMobile extends StatelessWidget {
  const TeacherStudentsPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        title: Text(
          'Students',
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
            onPressed: () {
              // Navigation logic explicitly requested or just back
            },
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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dark Header Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1B1E2B),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Grade 10 - Fire Safety',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'ACTIVE',
                          style: GoogleFonts.inter(
                            color: Colors.blueAccent,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Disaster preparedness Training . Session #12',
                    style: GoogleFonts.inter(color: Colors.grey, fontSize: 12),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      _buildStatColumn('STUDENTS', '24 Total'),
                      Container(
                        height: 30,
                        width: 1,
                        color: Colors.grey.withOpacity(0.3),
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                      ),
                      _buildStatColumn('PROGRESS', '68%'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Search Bar
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search students...',
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  hintStyle: GoogleFonts.inter(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Class Dropdown
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFE0E7FF), // Light blue tint
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Grade 10-D',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1B1E2B),
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    color: Color(0xFF1B1E2B),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Student List
            _buildStudentCard(
              context,
              name: 'Alex kk',
              status: 'READY',
              statusColor: const Color(0xFFD1FAE5), // Light green
              statusTextColor: const Color(0xFF059669), // Green
              imageUrl: 'https://i.pravatar.cc/150?u=alex',
            ),
            _buildStudentCard(
              context,
              name: 'Giana Geidt',
              status: 'NEEDS DRILL',
              statusColor: const Color(0xFFFEF3C7), // Light orange
              statusTextColor: const Color(0xFFD97706), // Orange
              imageUrl: 'https://i.pravatar.cc/150?u=giana',
            ),
            _buildStudentCard(
              context,
              name: 'Maria Workman',
              status: 'NOT STARTED',
              statusColor: const Color(0xFFF3F4F6), // Light grey
              statusTextColor: const Color(0xFF4B5563), // Grey
              imageUrl: 'https://i.pravatar.cc/150?u=maria',
            ),
            _buildStudentCard(
              context,
              name: 'John',
              status: 'READY',
              statusColor: const Color(0xFFD1FAE5),
              statusTextColor: const Color(0xFF059669),
              imageUrl: 'https://i.pravatar.cc/150?u=john',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AssignTaskScreen()),
          );
        },
        backgroundColor: const Color(0xFF1B1E2B),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildStatColumn(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            color: Colors.grey,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildStudentCard(
    BuildContext context, {
    required String name,
    required String status,
    required Color statusColor,
    required Color statusTextColor,
    required String imageUrl,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const StudentPerformancePageMobile(),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
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
          children: [
            CircleAvatar(radius: 24, backgroundImage: NetworkImage(imageUrl)),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Last Drill : 1 day ago',
                    style: GoogleFonts.inter(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: statusColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                status,
                style: GoogleFonts.inter(
                  color: statusTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

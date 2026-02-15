import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../pages/teacher_students_page_mobile.dart';
import '../pages/teacher_rankings_page_mobile.dart';
import '../pages/teacher_profile_page_mobile.dart';

class TeacherDashboardMobile extends StatefulWidget {
  const TeacherDashboardMobile({super.key});

  @override
  State<TeacherDashboardMobile> createState() => _TeacherDashboardMobileState();
}

class _TeacherDashboardMobileState extends State<TeacherDashboardMobile> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Center(
      child: Text(
        "Home Page Placeholder",
        style: TextStyle(color: Colors.white),
      ),
    ), // Home (No design yet)
    const TeacherStudentsPageMobile(),
    const TeacherRankingsPageMobile(),
    const TeacherProfilePageMobile(), // Using Profile as Settings for now based on typical flow, or adding separate settings
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFF3F4F6,
      ), // Light background for dashboard content as seen in screenshots?
      // Wait, "Students" screen has WHITE background cards on LIGHT GREY background.
      // "Rankings" screen has WHITE background with shadows.
      // "Performance" screen has LIGHT GREY background.
      // "Profile" screen has LIGHT GREY background.
      // The "Sign In" was DARK.
      // The Dashboard seems to be LIGHT THEME based on the new screenshots (White cards, grey bg).
      // I need to switch theme or override it for Dashboard.
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xFF1B1E2B), // Dark text for selected
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: GoogleFonts.inter(fontSize: 12),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school_outlined),
              activeIcon: Icon(Icons.school),
              label: 'Students',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.bar_chart_outlined,
              ), // Using bar chart for Rankings/Stats
              activeIcon: Icon(Icons.bar_chart),
              label: 'Rankings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              activeIcon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}

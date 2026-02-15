import 'package:flutter/material.dart';
import 'student_home_screen.dart';
import 'student_scenarios_screen.dart';
import 'student_profile_screen.dart';
import 'student_leaderboard_screen.dart';

class StudentDashboardMobile extends StatefulWidget {
  const StudentDashboardMobile({super.key});

  @override
  State<StudentDashboardMobile> createState() => _StudentDashboardMobileState();
}

class _StudentDashboardMobileState extends State<StudentDashboardMobile> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const StudentHomeScreen(),
    const StudentScenariosScreen(),
    const StudentLeaderboardScreen(), // Added Leaderboard
    const StudentProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      body: SafeArea(child: _pages[_selectedIndex]), // Basic wrap
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
          selectedItemColor: const Color(0xFF1D4ED8), // Royal Blue
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          unselectedLabelStyle: const TextStyle(fontSize: 12),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore), // Compass icon
              label: 'Scenarios',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: 'Rankings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

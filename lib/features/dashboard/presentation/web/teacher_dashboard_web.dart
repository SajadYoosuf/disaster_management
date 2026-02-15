import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/theme/app_theme.dart';
import 'user_management_web.dart';
import 'scenario_management_web.dart';

class TeacherDashboardWeb extends StatefulWidget {
  const TeacherDashboardWeb({super.key});

  @override
  State<TeacherDashboardWeb> createState() => _TeacherDashboardWebState();
}

class _TeacherDashboardWebState extends State<TeacherDashboardWeb> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Center(child: Text("Dashboard Overview Placeholder")),
    const UserManagementWeb(),
    const ScenarioManagementWeb(),
    const Center(child: Text("Settings Placeholder")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      body: Row(
        children: [
          // Sidebar
          Container(
            width: 280,
            color: AppTheme.darkBackground,
            child: Column(
              children: [
                const SizedBox(height: 32),
                // Logo
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.auto_awesome,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'EduAdmin',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 48),

                // Navigation Items
                _SidebarItem(
                  icon: Icons.dashboard,
                  label: 'Dashboard',
                  isSelected: _selectedIndex == 0,
                  onTap: () => setState(() => _selectedIndex = 0),
                ),
                _SidebarItem(
                  icon: Icons.people,
                  label: 'User Management',
                  isSelected: _selectedIndex == 1,
                  onTap: () => setState(() => _selectedIndex = 1),
                ),
                _SidebarItem(
                  icon: Icons.monitor_heart,
                  label: 'Scenario Management',
                  isSelected: _selectedIndex == 2,
                  onTap: () => setState(() => _selectedIndex = 2),
                ),
                _SidebarItem(
                  icon: Icons.settings,
                  label: 'Settings',
                  isSelected: _selectedIndex == 3,
                  onTap: () => setState(() => _selectedIndex = 3),
                ),

                const Spacer(),
                // User Profile Snippet
                Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 16,
                        backgroundImage: NetworkImage(
                          'https://i.pravatar.cc/150?u=maya',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Maya kk',
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Teacher',
                              style: GoogleFonts.inter(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.logout, color: Colors.grey, size: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Main Content
          Expanded(child: _pages[_selectedIndex]),
        ],
      ),
    );
  }
}

class _SidebarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _SidebarItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            border: isSelected
                ? const Border(
                    left: BorderSide(color: Colors.blueAccent, width: 4),
                  )
                : null,
            color: isSelected ? Colors.white.withOpacity(0.05) : null,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: isSelected ? Colors.white : Colors.grey,
                size: 22,
              ),
              const SizedBox(width: 16),
              Text(
                label,
                style: GoogleFonts.inter(
                  color: isSelected ? Colors.white : Colors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

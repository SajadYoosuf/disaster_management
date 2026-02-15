import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScenarioManagementWeb extends StatelessWidget {
  const ScenarioManagementWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Scenario Management',
                    style: GoogleFonts.inter(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1B1E2B),
                    ),
                  ),
                  Text(
                    'Create and assign disaster simulation scenarios',
                    style: GoogleFonts.inter(color: Colors.grey),
                  ),
                ],
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('Create Scenario'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1B1E2B),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),

          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: 1.5,
              children: [
                _buildScenarioCard(
                  'Fire Safety Drill',
                  'Simulated school fire evacuation',
                  Icons.local_fire_department,
                  Colors.orange,
                  'Active',
                ),
                _buildScenarioCard(
                  'Earthquake Protocol',
                  'Drop, Cover, and Hold On',
                  Icons.monitor_heart,
                  Colors.green,
                  'Active',
                ),
                _buildScenarioCard(
                  'Flood Evacuation',
                  'High ground navigation',
                  Icons.flood,
                  Colors.blue,
                  'Draft',
                ),
                _buildScenarioCard(
                  'Chemical Spill',
                  'Lab safety and containment',
                  Icons.science,
                  Colors.purple,
                  'Draft',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScenarioCard(
    String title,
    String desc,
    IconData icon,
    Color color,
    String status,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 28),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: status == 'Active'
                      ? Colors.green.withOpacity(0.1)
                      : Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: GoogleFonts.inter(
                    color: status == 'Active' ? Colors.green : Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1B1E2B),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            desc,
            style: GoogleFonts.inter(color: Colors.grey, fontSize: 14),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit_outlined, color: Colors.grey),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.play_circle_outline, color: Colors.blue),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

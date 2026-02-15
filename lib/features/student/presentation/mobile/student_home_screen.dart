import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class StudentHomeScreen extends StatelessWidget {
  const StudentHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                  'https://i.pravatar.cc/150?u=omar',
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Welcome back',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  Text(
                    'Omar Vaccaro',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.search, size: 20),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.notifications_none,
                  size: 20,
                ), // Red dot usually overlay
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Current Readiness Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.02),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 80,
                  height: 80,
                  child: Stack(
                    children: [
                      PieChart(
                        PieChartData(
                          sectionsSpace: 0,
                          centerSpaceRadius: 30, // Inner donut hole
                          startDegreeOffset: 270,
                          sections: [
                            PieChartSectionData(
                              color: const Color(0xFF1D4ED8), // Blue
                              value: 85,
                              title: '',
                              radius: 8,
                              showTitle: false,
                            ),
                            PieChartSectionData(
                              color: Colors.grey.shade200,
                              value: 15,
                              title: '',
                              radius: 8,
                              showTitle: false,
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text(
                              '85%',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1D4ED8),
                              ),
                            ),
                            Text(
                              'Ready',
                              style: TextStyle(fontSize: 8, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Current readingness', // "readiness" typo in design? "readingness"
                        style: TextStyle(
                          color: Color(0xFF1D4ED8), // Blue text
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Your survival preparedness is\nExcellent',
                        style: TextStyle(fontSize: 12, color: Colors.black87),
                      ),
                      const SizedBox(height: 12),
                      Divider(color: Colors.grey.shade200),
                      const SizedBox(height: 8),
                      Row(
                        children: const [
                          Text('Total points', style: TextStyle(fontSize: 12)),
                        ],
                      ),
                      const Text(
                        '1250',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0xFF1D4ED8),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),
          const Text(
            'Continue learning',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 16),

          // Continue Learning Card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF1D4ED8),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Level 3',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Fire evacuation basics',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Learn how to safely exit a building during an emergency fire drill simulation',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Resume senario',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),
          const Text(
            'Learning paths',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 16),

          // Learning Paths List
          _buildLearningPathItem(
            'Fire Safety',
            '85%',
            0.85,
            Icons.local_fire_department,
            Colors.orange,
          ),
          const SizedBox(height: 16),
          _buildLearningPathItem(
            'Earthquake response',
            '94%',
            0.94,
            Icons.monitor_heart,
            Colors.green,
          ),
          const SizedBox(height: 16),
          _buildLearningPathItem(
            'Flood evacuation',
            '78%',
            0.78,
            Icons.flood,
            Colors.blue,
          ),
        ],
      ),
    );
  }

  Widget _buildLearningPathItem(
    String title,
    String percentage,
    double value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                percentage,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: LinearProgressIndicator(
              value: value,
              minHeight: 10,
              backgroundColor: Colors.grey.shade200,
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
        ],
      ),
    );
  }
}

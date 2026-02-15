import 'package:flutter/material.dart';

class StudentScenarioDetailsScreen extends StatelessWidget {
  const StudentScenarioDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    'Earthquake Scenarios',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const Icon(Icons.more_horiz),
                ],
              ),
              const SizedBox(height: 24),

              // Progress
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'OVERALL PROGRESS',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        '1 / 3 Levels',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1D4ED8).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      '33% Complete',
                      style: TextStyle(
                        color: Color(0xFF1D4ED8),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: 0.33,
                  minHeight: 8,
                  backgroundColor: Colors.grey.shade300,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    Color(0xFF1D4ED8),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Level 1 Card (Unlocked)
              _buildScenarioLevelCard(
                level: 1,
                title: 'School Hallway Safety',
                xp: 100,
                difficulty: 'EASY',
                description:
                    'Learn how to protect yourself when the ground shakes while changing classes. Practice the "Drop, Cover, and Hold On" protocol.',
                isLocked: false,
                color: Colors.green.shade100,
                textColor: Colors.green,
                buttonText: 'Start Scenario',
              ),
              const SizedBox(height: 24),

              // Level 2 Card (Locked)
              _buildScenarioLevelCard(
                level: 2,
                title: 'Science Lab',
                xp: 250,
                difficulty: 'MEDIUM',
                description:
                    'Hazardous materials and high-risk equipment protocols.',
                isLocked: true,
                color: Colors.orange.shade100,
                textColor: Colors.orange,
              ),
              const SizedBox(height: 24),

              // Level 3 Card (Locked)
              _buildScenarioLevelCard(
                level: 3,
                title: 'Urban Evacuation',
                xp: 500,
                difficulty: 'HARD',
                description:
                    'Navigate a city street during a high-magnitude event.',
                isLocked: true,
                color: Colors.red.shade100,
                textColor: Colors.red,
              ),

              const SizedBox(height: 32),

              // Rank Snippet
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: const Color(
                    0xFFE0E7FF,
                  ), // Light blue background like snippet
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1D4ED8).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.emoji_events,
                        color: Color(0xFF1D4ED8),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Your Global Rank',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        Row(
                          children: [
                            Text(
                              '#1,240',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              ' of 15k',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text(
                          'Total XP',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        Text(
                          '850',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xFF1D4ED8),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScenarioLevelCard({
    required int level,
    required String title,
    required int xp,
    required String difficulty,
    required String description,
    required bool isLocked,
    required Color color,
    required Color textColor,
    String? buttonText,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image / Locked State Placeholder
          if (!isLocked)
            Container(
              height: 150,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1594322436404-5a0526db4d13?q=80&w=2629&auto=format&fit=crop',
                  ), // Hallway
                  fit: BoxFit.cover,
                ),
              ),
            ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isLocked)
                  Container(
                    margin: const EdgeInsets.only(right: 16),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.lock, color: Colors.grey),
                  ),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!isLocked)
                        Row(
                          children: [
                            const Icon(
                              Icons.check_circle,
                              color: Color(0xFF1D4ED8),
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              'UNLOCKED • 100 XP',
                              style: TextStyle(
                                color: Color(0xFF1D4ED8),
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                letterSpacing: 1.0,
                              ),
                            ),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: color,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                difficulty,
                                style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                        )
                      else
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Level $level: $title',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            if (isLocked)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: color,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  difficulty,
                                  style: TextStyle(
                                    color: textColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                          ],
                        ),

                      const SizedBox(height: 8),
                      if (!isLocked)
                        Text(
                          'Level $level: $title',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      const SizedBox(height: 8),
                      Text(
                        description,
                        style: const TextStyle(
                          color: Colors.grey,
                          height: 1.5,
                          fontSize: 13,
                        ),
                      ),
                      if (isLocked)
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            children: [
                              Text(
                                '$xp XP',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 4),
                              const Text(
                                'REWARD',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),

                      if (!isLocked && buttonText != null) ...[
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF1D4ED8),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.play_circle_filled, size: 20),
                                const SizedBox(width: 8),
                                Text(
                                  buttonText,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

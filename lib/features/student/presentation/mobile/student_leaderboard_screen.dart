import 'package:flutter/material.dart';

class StudentLeaderboardScreen extends StatelessWidget {
  const StudentLeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
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
                    'Leaderboard',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Stack(
                      children: [
                        const Icon(Icons.notifications_none, size: 20),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            width: 6,
                            height: 6,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Podium
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // 2nd Place
                          _buildPodiumItem(
                            rank: 2,
                            name: 'Maria',
                            points: '2042 pts',
                            image: 'https://i.pravatar.cc/150?u=maria',
                            height: 140,
                            color: Colors.grey.shade400,
                          ),
                          // 1st Place
                          _buildPodiumItem(
                            rank: 1,
                            name: 'Alex',
                            points: '2842 pts',
                            image: 'https://i.pravatar.cc/150?u=alex',
                            height: 180,
                            color: const Color(0xFFFFC107), // Gold
                            isFirst: true,
                          ),
                          // 3rd Place
                          _buildPodiumItem(
                            rank: 3,
                            name: 'Giana',
                            points: '1942 pts',
                            image: 'https://i.pravatar.cc/150?u=giana',
                            height: 120,
                            color: const Color(0xFFCD7F32), // Bronze
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),

                    // List Title
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'Top students',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // List
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        children: [
                          _buildRankItem(
                            4,
                            'Jakob Gouse',
                            '1933',
                            '+2',
                            'https://i.pravatar.cc/150?u=jakob',
                          ),
                          _buildRankItem(
                            5,
                            'Jakob Botosh',
                            '1931',
                            '-2',
                            'https://i.pravatar.cc/150?u=jakob2',
                            isNegative: true,
                          ),
                          _buildRankItem(
                            6,
                            'Maria Siphron',
                            '1922',
                            '+5',
                            'https://i.pravatar.cc/150?u=maria2',
                          ),
                          // Extra padding for floating widget
                          const SizedBox(height: 80),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // Floating User Rank
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(24),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF1D4ED8),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF1D4ED8).withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            const Text(
              '1',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(width: 16),
            const CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=alex'),
            ),
            const SizedBox(width: 12),
            const Text(
              'Alex kk',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  '2842',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '+5',
                  style: TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPodiumItem({
    required int rank,
    required String name,
    required String points,
    required String image,
    required double height,
    required Color color,
    bool isFirst = false,
  }) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: EdgeInsets.all(isFirst ? 4 : 2),
                decoration: BoxDecoration(shape: BoxShape.circle, color: color),
                child: CircleAvatar(
                  radius: isFirst ? 32 : 24,
                  backgroundImage: NetworkImage(image),
                ),
              ),
              Positioned(
                bottom: -10,
                right: isFirst ? 20 : 15, // Center the badge roughly
                left: isFirst ? 20 : 15,
                child: Container(
                  width: 24,
                  height: 24,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: Text(
                    '$rank',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          Text(
            points,
            style: TextStyle(
              color: isFirst ? const Color(0xFF1D4ED8) : Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            height: height,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [color, color.withOpacity(0.8)],
              ),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
            ),
            child: isFirst
                ? const Center(
                    child: Icon(
                      Icons.emoji_events,
                      color: Colors.white54,
                      size: 48,
                    ),
                  )
                : rank == 2
                ? const Center(
                    child: Icon(
                      Icons.military_tech,
                      color: Colors.white54,
                      size: 32,
                    ),
                  )
                : const Center(
                    child: Icon(Icons.star, color: Colors.white54, size: 32),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildRankItem(
    int rank,
    String name,
    String points,
    String change,
    String image, {
    bool isNegative = false,
  }) {
    return Container(
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
          Text('$rank', style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 16),
          CircleAvatar(radius: 20, backgroundImage: NetworkImage(image)),
          const SizedBox(width: 12),
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(points, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(
                change,
                style: TextStyle(
                  color: isNegative ? Colors.red : Colors.green,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

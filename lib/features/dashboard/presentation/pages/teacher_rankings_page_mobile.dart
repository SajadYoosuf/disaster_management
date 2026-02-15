import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TeacherRankingsPageMobile extends StatelessWidget {
  const TeacherRankingsPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        title: Text(
          'Rankings',
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
            onPressed: () {},
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
          children: [
            // Top 3 Podium
            SizedBox(
              height: 260,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  // 2nd Place
                  Positioned(
                    left: 20,
                    bottom: 0,
                    child: _buildPodiumItem(
                      rank: 2,
                      name: 'Maria',
                      points: '2042 pts',
                      image: 'https://i.pravatar.cc/150?u=maria',
                      height: 140,
                      color: const Color(0xFFAAAAAA), // Silverish
                    ),
                  ),
                  // 3rd Place
                  Positioned(
                    right: 20,
                    bottom: 0,
                    child: _buildPodiumItem(
                      rank: 3,
                      name: 'Giana',
                      points: '1942 pts',
                      image: 'https://i.pravatar.cc/150?u=giana',
                      height: 120,
                      color: const Color(0xFFCD7F32), // Bronze
                    ),
                  ),
                  // 1st Place
                  Positioned(
                    bottom: 20, // Slightly higher visual
                    child: _buildPodiumItem(
                      rank: 1,
                      name: 'Alex',
                      points: '2842 pts',
                      image: 'https://i.pravatar.cc/150?u=alex',
                      height: 180,
                      color: const Color(0xFFFFC107), // Gold
                      isFirst: true,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Top students',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // List Items
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
            _buildRankItem(
              7,
              'Javdon',
              '1913',
              '',
              'https://i.pravatar.cc/150?u=javdon',
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: CircleAvatar(
                radius: isFirst ? 45 : 35,
                backgroundImage: NetworkImage(image),
                backgroundColor: color.withOpacity(0.2),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: Text(
                  '$rank',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text(
          points,
          style: GoogleFonts.inter(
            color: Colors.blueAccent,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: isFirst ? 110 : 90,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [color, color.withOpacity(0.6)],
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Center(
            child: Icon(
              Icons.emoji_events,
              color: Colors.white.withOpacity(0.5),
              size: 40,
            ),
          ),
        ),
      ],
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
            color: Colors.black.withOpacity(0.01),
            blurRadius: 5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Text(
            '$rank',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 16),
          CircleAvatar(radius: 20, backgroundImage: NetworkImage(image)),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              name,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                points,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              if (change.isNotEmpty)
                Text(
                  change,
                  style: GoogleFonts.inter(
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

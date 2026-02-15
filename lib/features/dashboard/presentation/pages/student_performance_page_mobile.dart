import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentPerformancePageMobile extends StatefulWidget {
  const StudentPerformancePageMobile({super.key});

  @override
  State<StudentPerformancePageMobile> createState() =>
      _StudentPerformancePageMobileState();
}

class _StudentPerformancePageMobileState
    extends State<StudentPerformancePageMobile>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        title: Text(
          'Performance',
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
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: const Color(0xFFE5E7EB),
              borderRadius: BorderRadius.circular(25), // Rounded pill shape
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              labelColor: const Color(0xFF3B82F6), // Blue text for selected
              unselectedLabelColor: Colors.grey,
              labelStyle: GoogleFonts.inter(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              tabs: const [
                Tab(text: 'Scenario Performance'),
                Tab(text: 'Performance History'),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [_ScenarioPerformanceTab(), _PerformanceHistoryTab()],
      ),
    );
  }
}

class _ScenarioPerformanceTab extends StatelessWidget {
  const _ScenarioPerformanceTab();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        _PerformanceCard(
          title: 'Fire Safety',
          completedLevels: 'Levels completed 2/3',
          bestScore: '90%',
          totalAttempts: '2',
          lastDate: '10 Jan 2026',
          latestScore: '85%',
          icon: Icons.local_fire_department,
          iconColor: Colors.orange,
          iconBgColor: Color(0xFFFFEDD5),
        ),
        SizedBox(height: 16),
        _PerformanceCard(
          title: 'Earthquake response',
          completedLevels: 'Levels completed 2/3',
          bestScore: '90%',
          totalAttempts: '2',
          lastDate: '10 Jan 2026',
          latestScore: '85%',
          icon: Icons.monitor_heart,
          iconColor: Colors.green,
          iconBgColor: Color(0xFFDCFCE7),
        ),
        SizedBox(height: 16),
        _PerformanceCard(
          title: 'Flood evacuation',
          completedLevels: 'Levels completed 2/3',
          bestScore: '90%',
          totalAttempts: '2',
          lastDate: '10 Jan 2026',
          latestScore: '85%',
          icon: Icons.flood,
          iconColor: Colors.blue,
          iconBgColor: Color(0xFFDBEAFE),
        ),
      ],
    );
  }
}

class _PerformanceHistoryTab extends StatelessWidget {
  const _PerformanceHistoryTab();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Example Items matching design
        _HistoryCard(
          title: 'Fire Safety',
          date: '10/01/2026',
          attempt: 'Attempt #2',
          status: 'Incomplete',
          progress: 0.4,
          icon: Icons.local_fire_department,
          iconColor: Colors.orange,
          iconBgColor: const Color(0xFFFFEDD5),
        ),
        const SizedBox(height: 16),
        _HistoryCard(
          title: 'Fire Safety',
          date: '10/01/2026',
          attempt: 'Attempt #1',
          status: 'Completed',
          score: '12/15 Correct',
          icon: Icons.local_fire_department,
          iconColor: Colors.orange,
          iconBgColor: const Color(0xFFFFEDD5),
        ),
        const SizedBox(height: 16),
        _HistoryCard(
          title: 'Earthquake',
          date: '10/01/2026',
          attempt: 'Attempt #2',
          status: 'Completed',
          score: '10/15 Correct',
          icon: Icons.monitor_heart,
          iconColor: Colors.green,
          iconBgColor: const Color(0xFFDCFCE7),
        ),
      ],
    );
  }
}

class _PerformanceCard extends StatelessWidget {
  final String title;
  final String completedLevels;
  final String bestScore;
  final String totalAttempts;
  final String lastDate;
  final String latestScore;
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;

  const _PerformanceCard({
    required this.title,
    required this.completedLevels,
    required this.bestScore,
    required this.totalAttempts,
    required this.lastDate,
    required this.latestScore,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
  });

  @override
  Widget build(BuildContext context) {
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
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: iconBgColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: iconColor, size: 30),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      completedLevels,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    latestScore,
                    style: GoogleFonts.inter(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Latest Score',
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStat('Best score', bestScore, Colors.orange),
              _buildStat('Total attempts', totalAttempts, Colors.orange),
              _buildStat('Last attempts Date', lastDate, Colors.orange),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStat(String label, String value, Color color) {
    return Column(
      children: [
        Text(label, style: GoogleFonts.inter(fontSize: 12, color: Colors.grey)),
        const SizedBox(height: 4),
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}

class _HistoryCard extends StatelessWidget {
  final String title;
  final String date;
  final String attempt;
  final String status;
  final double? progress;
  final String? score;
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;

  const _HistoryCard({
    required this.title,
    required this.date,
    required this.attempt,
    required this.status,
    this.progress,
    this.score,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
  });

  @override
  Widget build(BuildContext context) {
    bool isCompleted = status == 'Completed';
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: iconBgColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: iconColor, size: 30),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          size: 12,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          date,
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: isCompleted
                      ? const Color(0xFFDCFCE7)
                      : Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: isCompleted ? Colors.green : Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            attempt,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          const SizedBox(height: 8),
          if (progress != null) ...[
            Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey[200],
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Colors.blueAccent,
                    ),
                    minHeight: 8,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  '${(progress! * 100).toInt()}% saved', // "saved" as per screenshot which is weird but copying it
                  style: GoogleFonts.inter(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ] else if (score != null) ...[
            Text(
              'Actions : $score',
              style: GoogleFonts.inter(fontWeight: FontWeight.bold),
            ),
          ],
        ],
      ),
    );
  }
}

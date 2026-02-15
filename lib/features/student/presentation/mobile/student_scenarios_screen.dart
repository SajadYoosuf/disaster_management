import 'package:flutter/material.dart';
import 'student_scenario_details_screen.dart';

class StudentScenariosScreen extends StatefulWidget {
  const StudentScenariosScreen({super.key});

  @override
  State<StudentScenariosScreen> createState() => _StudentScenariosScreenState();
}

class _StudentScenariosScreenState extends State<StudentScenariosScreen> {
  final List<String> categories = ['All', 'Earthquake', 'Fire', 'Flood'];
  String selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.arrow_back_ios_new, size: 16),
              ),
              const Text(
                'Scenarios',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.notifications_none, size: 20),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Search
          TextField(
            decoration: InputDecoration(
              hintText:
                  'Search students...', // Keeping the design's typo/placeholder text
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 16),
            ),
          ),
          const SizedBox(height: 24),

          // Categories
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: categories.map((category) {
                final isSelected = category == selectedCategory;
                return Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: ChoiceChip(
                    label: Text(category),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                    backgroundColor: Colors.grey.shade300,
                    selectedColor: const Color(0xFF1D4ED8),
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide.none,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 24),

          // Scenario Cards
          _buildScenarioCard(
            title: 'Earthquake Safety',
            description: 'Sreuctural Safety & Drop cover hold on',
            image:
                'https://images.unsplash.com/photo-1594322436404-5a0526db4d13?q=80&w=2629&auto=format&fit=crop', // Earthquake rubble
          ),
          const SizedBox(height: 16),
          _buildScenarioCard(
            title: 'Fire Safety',
            description: 'Sreuctural Safety & Drop cover hold on',
            image:
                'https://images.unsplash.com/photo-1547623644-8aa74577881f?q=80&w=1000&auto=format&fit=crop', // Firemen
          ),
          const SizedBox(height: 16),
          _buildScenarioCard(
            title: 'Flood Safety',
            description: 'Evacuation',
            image:
                'https://images.unsplash.com/photo-1547623644-8aa74577881f?q=80&w=1000&auto=format&fit=crop', // Flood placeholder
          ),
        ],
      ),
    );
  }

  Widget _buildScenarioCard({
    required String title,
    required String description,
    required String image,
  }) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
      ),
      child: Stack(
        children: [
          // Gradient Overlay
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        description,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const StudentScenarioDetailsScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1D4ED8),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        minimumSize: const Size(60, 30),
                      ),
                      child: const Text(
                        'Start',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

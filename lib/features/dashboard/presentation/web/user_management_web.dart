import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserManagementWeb extends StatelessWidget {
  const UserManagementWeb({super.key});

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
                    'User Management',
                    style: GoogleFonts.inter(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1B1E2B),
                    ),
                  ),
                  Text(
                    'Manage students and teachers access',
                    style: GoogleFonts.inter(color: Colors.grey),
                  ),
                ],
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('Add New User'),
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

          // Filters
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.02),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search by name, email or ID...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: const Color(0xFFF3F4F6),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                _buildFilterDropdown('Role', ['All', 'Student', 'Teacher']),
                const SizedBox(width: 16),
                _buildFilterDropdown('Status', ['All', 'Active', 'Inactive']),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Table
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: DataTable(
                  headingRowColor: MaterialStateProperty.all(
                    const Color(0xFFF9FAFB),
                  ),
                  dataRowHeight: 60,
                  horizontalMargin: 24,
                  columnSpacing: 32,
                  columns: const [
                    DataColumn(
                      label: Text(
                        'User',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Role',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Status',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Last Active',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Actions',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                  rows: [
                    _buildDataRow(
                      'Alex kk',
                      'alex@gmail.com',
                      'Student',
                      'Active',
                      '2 mins ago',
                    ),
                    _buildDataRow(
                      'Maya kk',
                      'maya@novox.com',
                      'Teacher',
                      'Active',
                      '5 mins ago',
                    ),
                    _buildDataRow(
                      'John Doe',
                      'john@gmail.com',
                      'Student',
                      'Inactive',
                      '2 days ago',
                    ),
                    _buildDataRow(
                      'Sarah Smith',
                      'sarah@gmail.com',
                      'Student',
                      'Active',
                      '1 hour ago',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterDropdown(String hint, List<String> items) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: Text(hint),
          value: null,
          items: items
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: (val) {},
        ),
      ),
    );
  }

  DataRow _buildDataRow(
    String name,
    String email,
    String role,
    String status,
    String lastActive,
  ) {
    return DataRow(
      cells: [
        DataCell(
          Row(
            children: [
              CircleAvatar(radius: 16, child: Text(name[0])),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    email,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
        DataCell(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: role == 'Teacher'
                  ? Colors.purple.shade50
                  : Colors.blue.shade50,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: role == 'Teacher'
                    ? Colors.purple.shade200
                    : Colors.blue.shade200,
              ),
            ),
            child: Text(
              role,
              style: TextStyle(
                color: role == 'Teacher' ? Colors.purple : Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
        DataCell(
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: status == 'Active' ? Colors.green : Colors.grey,
                ),
              ),
              const SizedBox(width: 8),
              Text(status),
            ],
          ),
        ),
        DataCell(Text(lastActive)),
        DataCell(
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.edit, color: Colors.blue),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

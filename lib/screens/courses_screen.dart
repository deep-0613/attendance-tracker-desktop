// courses_screen.dart
import 'package:flutter/material.dart';
import 'marks_assignment_screen.dart';

class CoursesScreen extends StatelessWidget {
  final Function(String, String)? onShowMarksAssignment;

  const CoursesScreen({
    super.key,
    this.onShowMarksAssignment,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Icon(Icons.book, size: 24, color: Colors.grey[600]),
                const SizedBox(width: 8),
                const Text(
                  "My Courses",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 24),

            // Courses List
            Expanded(
              child: ListView(
                children: [
                  _buildCourseCard(
                    context,
                    'CC1',
                    'CC (C1 Lab)',
                    'O23RC23',
                    'Computer Engineering',
                    true,
                  ),
                  _buildCourseCard(
                    context,
                    'CC2',
                    'CC (C2 Lab)',
                    'O23RC24',
                    'Computer Engineering',
                    true,
                  ),
                  _buildCourseCard(
                    context,
                    'CC3',
                    'CC (C3 Lab)',
                    'O23RC25',
                    'Computer Engineering',
                    true,
                  ),
                  _buildCourseCard(
                    context,
                    'LAN',
                    'LAN Lecture',
                    'O23RC26',
                    'Computer Engineering',
                    false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseCard(
    BuildContext context,
    String code,
    String name,
    String courseCode,
    String department,
    bool isLab,
  ) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Color(0xFFE0E0E0), width: 1),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Course Header
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xFFA50C22),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      code,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Course Code: $courseCode',
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                      Text(
                        department,
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 12),

            // Course Actions
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (isLab) {
                        if (onShowMarksAssignment != null) {
                          onShowMarksAssignment!(courseCode, name);
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Opening attendance management...'),
                            backgroundColor: Color(0xFF1B5E20),
                          ),
                        );
                      }
                    },
                    icon: isLab ? const Icon(Icons.grade, size: 18) : const Icon(Icons.people, size: 18),
                    label: Text(isLab ? 'Assign Marks' : 'Manage Attendance'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1B5E20),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Opening course details...'),
                          backgroundColor: Color(0xFF0D47A1),
                        ),
                      );
                    },
                    icon: const Icon(Icons.info, size: 18),
                    label: const Text('View Details'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0D47A1),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

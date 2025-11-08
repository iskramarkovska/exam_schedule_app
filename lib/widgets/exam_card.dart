import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../screens/exam_detail_screen.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  final bool isPast;

  const ExamCard({super.key, required this.exam, required this.isPast});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      color: isPast ? Colors.grey[300] : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide(
          color: isPast ? Colors.grey : Colors.deepPurple,
          width: 1.5,
        ),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ExamDetailScreen(exam: exam),
            ),
          );
        },
        borderRadius: BorderRadius.circular(12.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                exam.subject,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: isPast ? Colors.grey : Colors.black,
                ),
              ),
              const SizedBox(height: 12.0),

              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 16.0,
                    color: isPast ? Colors.grey[600] : Colors.deepPurple[700],
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    _formatDate(exam.dateTime),
                    style: TextStyle(
                      color: isPast ? Colors.grey[700] : Colors.black87,
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),

              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    size: 16.0,
                    color: isPast ? Colors.grey[600] : Colors.deepPurple[700],
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    _formatTime(exam.dateTime),
                    style: TextStyle(
                      color: isPast ? Colors.grey[700] : Colors.black87,
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Icon(
                    Icons.meeting_room,
                    size: 18,
                    color: isPast ? Colors.grey[600] : Colors.blue[700],
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      exam.rooms.join(', '),
                      style: TextStyle(
                        fontSize: 15,
                        color: isPast ? Colors.grey[700] : Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime dt) {
    return '${dt.day.toString().padLeft(2, '0')}.${dt.month.toString().padLeft(2, '0')}.${dt.year}';
  }

  String _formatTime(DateTime dt) {
    return '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
  }
}

import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailScreen({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final difference = exam.dateTime.difference(now);
    final isPast = difference.isNegative;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Детали за Испитот'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              exam.subject,
              style: const TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24.0),

            _buildInfoRow(
              Icons.calendar_today,
              'Датум:',
              _formatDate(exam.dateTime),
            ),
            const SizedBox(height: 16.0),

            _buildInfoRow(
              Icons.access_time,
              'Време:',
              _formatTime(exam.dateTime),
            ),
            const SizedBox(height: 16.0),

            Card(
              color: isPast ? Colors.grey[300] : Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Icon(
                      isPast ? Icons.event_busy : Icons.timer,
                      size: 48.0,
                      color: isPast ? Colors.red : Colors.green,
                    ),
                    const SizedBox(height: 12.0),
                    Text(
                      isPast
                          ? 'Испитот е завршен'
                          : 'Останато време до испитот',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: isPast ? Colors.red[700] : Colors.green[700],
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      isPast
                          ? _formatPastTime(difference.abs())
                          : _formatRemainingTime(difference),
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: isPast ? Colors.red[900] : Colors.green[900],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 24.0, color: Colors.deepPurple),
        const SizedBox(width: 12.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
              ),
              const SizedBox(height: 4.0),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _formatDate(DateTime dt) {
    return '${dt.day.toString().padLeft(2, '0')}.${dt.month.toString().padLeft(2, '0')}.${dt.year}';
  }

  String _formatTime(DateTime dt) {
    return '${dt.hour}:${dt.minute.toString().padLeft(2, '0')}';
  }

  String _formatRemainingTime(Duration duration) {
    final days = duration.inDays;
    final hours = duration.inHours % 24;
    return '$days ${days == 1 ? 'ден' : 'дена'} и $hours ${hours == 1 ? 'час' : 'часа'}.';
  }

  String _formatPastTime(Duration duration) {
    final days = duration.inDays;
    return 'Пред $days ${days == 1 ? 'ден' : 'дена'}.';
  }
}

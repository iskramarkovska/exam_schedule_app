import 'package:flutter/material.dart';
import '../models/exam_data.dart';
import '../widgets/exam_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final exams = getExams();

    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    final now = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Распоред за испити - 223065'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: exams.length,
        itemBuilder: (context, index) {
          final exam = exams[index];
          final isPast = exam.dateTime.isBefore(now);
          
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: ExamCard(exam: exam, isPast: isPast),
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.blue,
        child: Text(
          'Вкупно испити: ${exams.length}',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}

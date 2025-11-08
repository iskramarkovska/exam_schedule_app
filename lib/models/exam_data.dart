import 'exam.dart';

List<Exam> getExams() {
  return [
    Exam(
      subject: 'Мобилни Информациски Системи',
      dateTime: DateTime(2025, 12, 20, 14, 0),
      rooms: ['Лаб 201', 'Лаб 202'],
    ),
    Exam(
      subject: 'Софтверско Инженерство',
      dateTime: DateTime(2025, 12, 22, 10, 0),
      rooms: ['Лаб 305'],
    ),
    Exam(
      subject: 'Бази на Податоци',
      dateTime: DateTime(2025, 12, 25, 9, 0),
      rooms: ['Лаб 101', 'Лаб 102', 'Лаб 103'],
    ),
    Exam(
      subject: 'Веб Програмирање',
      dateTime: DateTime(2025, 12, 27, 13, 0),
      rooms: ['Лаб 210'],
    ),
    Exam(
      subject: 'Оперативни Системи',
      dateTime: DateTime(2025, 12, 29, 11, 0),
      rooms: ['Лаб 405', 'Лаб 406'],
    ),
    Exam(
      subject: 'Компјутерски Мрежи',
      dateTime: DateTime(2026, 1, 3, 15, 0),
      rooms: ['Лаб 301'],
    ),
    Exam(
      subject: 'Вовед во Наука на Податоци',
      dateTime: DateTime(2026, 1, 5, 10, 30),
      rooms: ['Лаб 501', 'Лаб 502'],
    ),
    Exam(
      subject: 'Програмирање на Видео Игри',
      dateTime: DateTime(2026, 1, 7, 14, 0),
      rooms: ['Лаб 310'],
    ),
    Exam(
      subject: 'Објектно-Ориентирано Програмирање',
      dateTime: DateTime(2026, 2, 10, 9, 30),
      rooms: ['Лаб 205', 'Лаб 206'],
    ),
    Exam(
      subject: 'Сајбербезбедност',
      dateTime: DateTime(2025, 11, 7, 12, 0),
      rooms: ['Лаб 401'],
    ),
    Exam(
      subject: 'Дизајн на Интеракцијата Човек-Компјутер',
      dateTime: DateTime(2025, 11, 5, 16, 0),
      rooms: ['Лаб 105'],
    ),
  ];
}

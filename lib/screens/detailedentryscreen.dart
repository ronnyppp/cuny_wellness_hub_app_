import 'package:flutter/material.dart';
import '../models/journalmodel.dart';
import 'package:intl/intl.dart';

class JournalEntryDetailScreen extends StatelessWidget {
  final JournalEntry entry;

  JournalEntryDetailScreen(this.entry);

  final Shader linearGradient = const LinearGradient(
    colors: <Color>[Colors.blue, Colors.teal],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    DateTime entryDate = DateTime.parse(entry.date);
    String formattedDate = DateFormat('yyyy-MM-dd').format(entryDate);
    return Scaffold(
      appBar: AppBar(
        title: Text('Journal Entry Details'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.blue, Colors.teal]),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              entry.title,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()..shader = linearGradient),
            ),
            Text(
              formattedDate,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  foreground: Paint()..shader = linearGradient),
            ),
            const SizedBox(height: 15),
            Text(
              entry.content,
              style: TextStyle(
                  fontSize: 20, foreground: Paint()..shader = linearGradient),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../models/journalmodel.dart';
import 'package:intl/intl.dart';

class JournalEntryDetailScreen extends StatelessWidget {
  final JournalEntry entry;

  JournalEntryDetailScreen(this.entry);

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
              'Title: ${entry.title}',
              style: const TextStyle(fontSize: 30),
            ),
            Text(
              'Date: ${formattedDate}',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              'Content: ${entry.content}',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

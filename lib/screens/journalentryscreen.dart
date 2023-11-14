import 'package:flutter/material.dart';
import '../models/journalmodel.dart';
import '../services/databasehelper.dart';

class AddJournalEntryScreen extends StatefulWidget {
  @override
  _AddJournalEntryScreenState createState() => _AddJournalEntryScreenState();
}

class _AddJournalEntryScreenState extends State<AddJournalEntryScreen> {
  final dbHelper = JournalDatabaseHelper();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  Future<void> _addEntry() async {
    final entry = JournalEntry(
      title: titleController.text,
      content: contentController.text,
      date: DateTime.now().toString(),
    );
    await dbHelper.insertJournalEntry(entry);
    // Return to the previous screen (JournalEntriesScreen) after adding the entry
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Journal Entry'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.blue, Colors.teal]),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: contentController,
              decoration: InputDecoration(labelText: 'Content'),
            ),
            ElevatedButton(
              onPressed: () {
                _addEntry();
              },
              child: Text('Add Entry'),
            ),
          ],
        ),
      ),
    );
  }
}

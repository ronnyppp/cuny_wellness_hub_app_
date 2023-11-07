import 'package:flutter/material.dart';
import 'journalscreen.dart';

class JournalEntryList extends StatefulWidget {
  @override
  _JournalEntryListState createState() => _JournalEntryListState();
}

class _JournalEntryListState extends State<JournalEntryList> {
  List<JournalEntry> journalEntries = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Journal Entries'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.blue, Colors.teal]),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: journalEntries.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(journalEntries[index].mood +
                ' - ' +
                journalEntries[index].blurb),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => JournalScreen(
                    existingEntry: journalEntries[index],
                    onSave: (updatedEntry) {
                      // Handle updated entry if needed
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => JournalScreen(
                onSave: (newEntry) {
                  setState(() {
                    journalEntries.add(newEntry);
                  });
                },
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class JournalEntry {
  final String mood;
  final String blurb;

  JournalEntry({required this.mood, required this.blurb});
}

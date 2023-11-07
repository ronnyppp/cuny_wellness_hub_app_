import 'package:flutter/material.dart';
import 'entryscreen.dart';

class JournalScreen extends StatefulWidget {
  final Function(JournalEntry) onSave;
  final JournalEntry? existingEntry;

  const JournalScreen({required this.onSave, this.existingEntry});

  @override
  _JournalScreenState createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  final TextEditingController _journalEntryController = TextEditingController();
  String journalEntry = '';
  String selectedMood = '';

  void initState() {
    super.initState();
    if (widget.existingEntry != null) {
      _journalEntryController.text = widget.existingEntry!.blurb;
      selectedMood = widget.existingEntry!.mood;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Journal'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.blue, Colors.teal]),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: _journalEntryController,
                maxLines: null, // Allow multiple lines for journal entry
                decoration: InputDecoration(
                  hintText: 'Write your thoughts here...',
                ),
                onChanged: (text) {
                  setState(() {
                    journalEntry = text;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildMoodButton('😄', 'Happy'),
                _buildMoodButton('😐', 'Neutral'),
                _buildMoodButton('😢', 'Sad'),
                _buildMoodButton('😊', 'Content'),
                _buildMoodButton('😡', 'Angry'),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                widget.onSave(
                    JournalEntry(mood: selectedMood, blurb: journalEntry));
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
              ),
              child: Text('Save Entry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMoodButton(String emoji, String mood) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMood = mood;
        });
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selectedMood == mood ? Colors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          emoji,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }

  void _saveJournalEntry(String entry) {
    // Implement your saving logic here, e.g., save to a database or file
    print('Journal entry saved: $entry');
  }
}

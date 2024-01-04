import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'detailedentryscreen.dart';
import 'journalentryscreen.dart';
import '../models/journalmodel.dart';
import '../services/databasehelper.dart';

class JournalScreen extends StatefulWidget {
  const JournalScreen({super.key});

  @override
  _JournalScreenState createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  final dbHelper = JournalDatabaseHelper();
  List<JournalEntry> entries = [];
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadEntries();
  }

  final Shader linearGradient = const LinearGradient(
    colors: <Color>[Colors.blue, Colors.teal],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  Future<void> _loadEntries() async {
    entries = await dbHelper.getJournalEntries();
    setState(() {});
  }

  Future<void> _updateEntry(int id) async {
    final entry = JournalEntry(
      id: id,
      title: titleController.text,
      content: contentController.text,
      date: DateTime.now().toString(),
    );
    await dbHelper.updateJournalEntry(entry);
    _loadEntries();
    titleController.clear();
    contentController.clear();
  }

  Future<void> _deleteEntry(int id) async {
    await dbHelper.deleteJournalEntry(id);
    _loadEntries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Journal'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Colors.blue, Colors.teal]),
          ),
        ),
      ),
      body: FutureBuilder<List<JournalEntry>>(
        future: dbHelper.getJournalEntries(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final entries = snapshot.data;
            return Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    itemCount: entries?.length,
                    itemBuilder: (context, index) {
                      final entry = entries!.elementAt(index);
                      DateTime entryDate = DateTime.parse(entry.date);
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(entryDate);
                      return ListTile(
                        title: Text(
                          entry.title,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              foreground: Paint()..shader = linearGradient),
                        ),
                        subtitle: Text(formattedDate,
                            style: TextStyle(
                                foreground: Paint()..shader = linearGradient)),
                        trailing: IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            titleController.text = entry.title;
                            contentController.text = entry.content;
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Edit Entry'),
                                  content: Column(
                                    children: [
                                      TextField(
                                        controller: titleController,
                                        decoration: const InputDecoration(
                                            labelText: 'Title'),
                                      ),
                                      TextField(
                                        controller: contentController,
                                        decoration: const InputDecoration(
                                            labelText: 'Content'),
                                      ),
                                    ],
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('Cancel'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: const Text('Update'),
                                      onPressed: () {
                                        _updateEntry(entry.id!);
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  JournalEntryDetailScreen(entry),
                            ),
                          );
                        },
                        onLongPress: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Confirm Deletion'),
                                content: const Text(
                                    'Are you sure you want to delete this entry?'),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('Cancel'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: const Text('Delete'),
                                    onPressed: () {
                                      _deleteEntry(entry.id!);
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 70,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        AddJournalEntryScreen(),
                                  ),
                                ).then((result) {
                                  if (result != null && result) {
                                    _loadEntries();
                                  }
                                });
                                _loadEntries();
                              },
                              child: const Text(
                                '+',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

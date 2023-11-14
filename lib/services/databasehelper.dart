import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/journalmodel.dart';

class JournalDatabaseHelper {
  static final JournalDatabaseHelper _instance = JournalDatabaseHelper._();
  static Database? _database;

  JournalDatabaseHelper._();

  factory JournalDatabaseHelper() => _instance;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final String path = join(await getDatabasesPath(), 'journal.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  void _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE journal_entries(
        id INTEGER PRIMARY KEY,
        title TEXT,
        content TEXT,
        date TEXT
      )
    ''');
  }

  Future<int> insertJournalEntry(JournalEntry entry) async {
    final db = await database;
    return await db.insert('journal_entries', entry.toMap());
  }

  Future<int> updateJournalEntry(JournalEntry entry) async {
    final db = await database;
    return await db.update(
      'journal_entries',
      entry.toMap(),
      where: 'id = ?',
      whereArgs: [entry.id],
    );
  }

  Future<int> deleteJournalEntry(int id) async {
    final db = await database;
    return await db.delete(
      'journal_entries',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<JournalEntry>> getJournalEntries() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('journal_entries');
    return List.generate(maps.length, (index) {
      return JournalEntry.fromMap(maps[index]);
    });
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/note.dart';

class ApiService {
  final String baseUrl = "http://localhost:3000/notes";

  // Create a note
  Future<void> createNote(Note note) async {
    final response = await http.post(
      Uri.parse('$baseUrl/add'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(note.toJson()),
    );
    if (response.statusCode == 201) {
      print('Note created successfully');
    } else {
      print('Failed to create note');
    }
  }

  // Get all notes
  Future<List<Note>> getAllNotes() async {
    final response = await http.post(Uri.parse('$baseUrl/list'));

    if (response.statusCode == 200) {
      List notesJson = jsonDecode(response.body);
      return notesJson.map((note) => Note.fromJson(note)).toList();
    } else {
      throw Exception('Failed to load notes');
    }
  }

  // Get a note by ID
  Future<Note> getNoteById(String id) async {
    final response = await http.post(Uri.parse('$baseUrl/byId/$id'));

    if (response.statusCode == 200) {
      return Note.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Note not found');
    }
  }

  // Update a note
  Future<void> updateNote(Note note) async {
    final response = await http.put(
      Uri.parse('$baseUrl/update/${note.id}'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(note.toJson()),
    );
    if (response.statusCode == 200) {
      print('Note updated successfully');
    } else {
      print('Failed to update note');
    }
  }

  // Delete a note
  Future<void> deleteNote(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    if (response.statusCode == 200) {
      print('Note deleted successfully');
    } else {
      print('Failed to delete note');
    }
  }
}
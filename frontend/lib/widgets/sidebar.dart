import 'package:flutter/material.dart';
import '../models/note.dart';

class Sidebar extends StatelessWidget {
  final List<Note> notes;
  final Note? selectedNote;
  final Function(Note) onNoteSelected;
  final Function(String) onSearchChanged;
  final VoidCallback onAddNote;

  const Sidebar({
    required this.notes,
    required this.selectedNote,
    required this.onNoteSelected,
    required this.onSearchChanged,
    required this.onAddNote,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          right: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      child: Column(
        children: [
          // Search bar
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search notes...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey.shade100,
              ),
              onChanged: onSearchChanged,
            ),
          ),

          // Notes list
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final note = notes[index];
                final isSelected = selectedNote?.id == note.id;

                return Container(
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.blue.withOpacity(0.1) : null,
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade200),
                    ),
                  ),
                  child: ListTile(
                    title: Text(
                      note.title,
                      style: TextStyle(
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    onTap: () => onNoteSelected(note),
                  ),
                );
              },
            ),
          ),

          // Add note button
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: onAddNote,
              child: Text('Add Note'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

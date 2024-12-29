import 'package:cloud_firestore/cloud_firestore.dart';

class Firestoreservices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //create a new note
  Future<void> createNote(String content) async {
    if (content.isNotEmpty) {
      await _firestore.collection('notes').add({
        'content': content,
        'timestamp': Timestamp.now(),
      });
    }
  }

  //read the note
  Stream<QuerySnapshot> readNotes() {
    return _firestore
        .collection('notes')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }

  //update the note by given the id
  Future<void> updateNote(String id, String updatedContent) async {
    if (updatedContent.isNotEmpty) {
      await _firestore.collection('notes').doc(id).update({
        'content': updatedContent,
      });
    }
  }

  //delete the note by given the id
  Future<void> deleteNote(String id) async {
    await _firestore.collection('notes').doc(id).delete();
  }
}

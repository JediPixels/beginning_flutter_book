import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:journal/models/journal.dart';
import 'package:journal/services/db_firestore_api.dart';

class DbFirestoreService implements DbApi {
  final Firestore _firestore = Firestore.instance;
  final String _collectionJournals = 'journals';

  DbFirestoreService() {
    _firestore.settings(timestampsInSnapshotsEnabled: true);
  }

  Stream<List<Journal>> getJournalList(String uid) {
    return _firestore
        .collection(_collectionJournals)
        .where('uid', isEqualTo: uid)
        .snapshots()
        .map((QuerySnapshot snapshot) {
      List<Journal> _journalDocs = snapshot.documents.map((doc) => Journal.fromDoc(doc)).toList();
      _journalDocs.sort((comp1, comp2) => comp2.date.compareTo(comp1.date));
      return _journalDocs;
    });
  }

  Future<Journal> getJournal(String documentID) {
    return _firestore
        .collection(_collectionJournals)
        .document(documentID)
        .get()
        .then((documentSnapshot) {
      return Journal.fromDoc(documentSnapshot);
    });
  }

  Future<bool> addJournal(Journal journal) async {
    DocumentReference _documentReference =
    await _firestore.collection(_collectionJournals).add({
      'date': journal.date,
      'mood': journal.mood,
      'note': journal.note,
      'uid': journal.uid,
    });
    return _documentReference.documentID != null;
  }

  void updateJournal(Journal journal) async {
    await _firestore
        .collection(_collectionJournals)
        .document(journal.documentID)
        .updateData({
      'date': journal.date,
      'mood': journal.mood,
      'note': journal.note,
    })
        .catchError((error) => print('Error updating: $error'));
  }

  void updateJournalWithTransaction(Journal journal) async {
    DocumentReference _documentReference = _firestore.collection(_collectionJournals).document(journal.documentID);
    var journalData = {
      'date': journal.date,
      'mood': journal.mood,
      'note': journal.note,
    };
    _firestore.runTransaction((transaction) async {
      await transaction
          .update(_documentReference, journalData)
          .catchError((error) => print('Error updating: $error'));
    });
  }

  void deleteJournal(Journal journal) async {
    await _firestore
        .collection(_collectionJournals)
        .document(journal.documentID)
        .delete()
        .catchError((error) => print('Error deleting: $error'));
  }
}

// https://firebase.google.com/docs/reference/js/firebase.firestore.Settings
//Enables the use of Timestamps for timestamp fields in DocumentSnapshots.
//
//Currently, Firestore returns timestamp fields as Date but Date only supports millisecond precision, which leads to truncation and causes unexpected behavior when using a timestamp from a snapshot as a part of a subsequent query.
//
//Setting timestampsInSnapshots to true will cause Firestore to return Timestamp values instead of Date, which avoids truncation. Note that you must also change any code that uses Date to use Timestamp instead.
//
//WARNING: In the future, timestampsInSnapshots: true will become the default and this option will be removed. You should change your code to use Timestamp and opt-in to this new behavior as soon as you can.

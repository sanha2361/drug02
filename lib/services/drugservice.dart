import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/drug.dart';

class DrugService {
  List<Drug> _drugListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Drug(
        system: doc.data['system'] ?? '',
        disease: doc.data['disease'] ?? '',
        drugtype: doc.data['drugtype'] ?? '',
        drugname: doc['drugname'] ?? '',
      );
    }).toList();
  }

  Stream<List<Drug>> get drug {
    //return Firestore.instance.collection('notes').orderBy('timestamp',descending: true).snapshots().map(_replyListFromSnapshot);
    // return Firestore.instance.collection('drug').snapshots().map(_drugListFromSnapshot(snapshot));
  }
}

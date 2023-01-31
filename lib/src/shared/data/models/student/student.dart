import 'package:cloud_firestore/cloud_firestore.dart';

class Student {
  final String id;
  final String name;
  final String cypher;
  final DocumentReference groupRef;

  const Student(this.id, this.name, this.cypher, this.groupRef);

  factory Student.fromDoc(DocumentSnapshot doc) {
    final json = doc.data() as Map<String, dynamic>;

    return Student(
      doc.id,
      json['name'] as String,
      json['cypher'] as String,
      json['group_ref'] as DocumentReference,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'cypher': cypher,
      'group_ref': groupRef.path,
    };
  }

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      json['id'] as String,
      json['name'] as String,
      json['cypher'] as String,
      FirebaseFirestore.instance.doc(json['group_ref']),
    );
  }
}

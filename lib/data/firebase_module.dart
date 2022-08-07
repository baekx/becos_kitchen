import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseModule {
  final menuCollection = FirebaseFirestore.instance.collection('menu');
}

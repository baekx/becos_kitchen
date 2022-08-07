import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseModule {
  final menuCollection = FirebaseFirestore.instance.collection('menu');
  final storage = FirebaseStorage.instance;
}

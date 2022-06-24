import 'package:cloud_firestore/cloud_firestore.dart';

class User{

  final String? id;
  final String? email;
  final db = FirebaseFirestore.instance;


  User(this.id, this.email);



}
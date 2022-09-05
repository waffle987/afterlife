import 'package:cloud_firestore/cloud_firestore.dart';

class MediatorModel {
  final String id;
  final String username;
  final String email;

  MediatorModel({
    required this.id,
    required this.username,
    required this.email,
  });

  MediatorModel.fromData(Map<String, dynamic> data)
      : id = data['id'],
        username = data['username'],
        email = data['email'];

  factory MediatorModel.fromDocument({required DocumentSnapshot doc}) {
    return MediatorModel(
      id: doc['id'],
      username: doc['username'],
      email: doc['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
    };
  }

  Map<String, dynamic> data({required MediatorModel mediator}) {
    return {
      'id': mediator.id,
      'username': mediator.username,
      'email': mediator.email,
    };
  }
}

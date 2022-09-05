import 'package:cloud_firestore/cloud_firestore.dart';

class TownCouncilModel {
  final String id;
  final String townCouncilLocation;
  final String email;

  TownCouncilModel({
    required this.id,
    required this.townCouncilLocation,
    required this.email,
  });

  TownCouncilModel.fromData(Map<String, dynamic> data)
      : id = data['id'],
        townCouncilLocation = data['townCouncilLocation'],
        email = data['email'];

  factory TownCouncilModel.fromDocument({required DocumentSnapshot doc}) {
    return TownCouncilModel(
      id: doc['id'],
      townCouncilLocation: doc['townCouncilLocation'],
      email: doc['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'townCouncilLocation': townCouncilLocation,
      'email': email,
    };
  }

  Map<String, dynamic> data({required TownCouncilModel townCouncil}) {
    return {
      'id': townCouncil.id,
      'townCouncilLocation': townCouncil.townCouncilLocation,
      'email': townCouncil.email,
    };
  }
}

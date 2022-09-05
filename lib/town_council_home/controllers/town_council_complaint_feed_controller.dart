import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../submit_complaint/models/complaint_model.dart';

class TownCouncilFeedController extends GetxController {
  static TownCouncilFeedController to = Get.find();

  final Rxn<List<ComplaintModel>> complaints = Rxn<List<ComplaintModel>>();

  /// Collection references
  final CollectionReference _complaintsCollectionReference =
      FirebaseFirestore.instance.collection('complaints');
  final CollectionReference _casesCollectionReference =
      FirebaseFirestore.instance.collection('cases');

  /// Stream controllers
  final StreamController<List<ComplaintModel>> _complaintsStreamController =
      StreamController<List<ComplaintModel>>.broadcast();

  @override
  void onInit() async {
    complaints.bindStream(listenToComplaintsRealTime());
    super.onInit();
  }

  /// Listen to Complaints stream
  Stream<List<ComplaintModel>> listenToComplaintsRealTime() {
    _complaintsCollectionReference.snapshots().listen((complaintsSnapshot) {
      if (complaintsSnapshot.docs.isNotEmpty) {
        List<ComplaintModel> _complaints = complaintsSnapshot.docs.isEmpty
            ? []
            : complaintsSnapshot.docs
                .map((doc) => ComplaintModel.fromDocument(doc: doc))
                .toList();

        _complaintsStreamController.add(_complaints);
      } else {
        _complaintsStreamController.add([]);
      }
    });

    return _complaintsStreamController.stream;
  }

  /// Update status of complaint
  void updateStatusOfComplaint({
    required ComplaintModel complaintModel,
    required String status,
  }) {
    _complaintsCollectionReference
        .doc(complaintModel.id)
        .update({"status": status});
  }

  void sendForMediation({required ComplaintModel complaintModel}) async {
    _casesCollectionReference.doc(complaintModel.id).set({
      "id": complaintModel.id,
      "status": complaintModel.status,
      "name": complaintModel.name,
      "phoneNumber": complaintModel.phoneNumber,
      "numberOfParties": complaintModel.numberOfParties,
      "nameOfOtherParties": complaintModel.nameOfParties,
      "description": complaintModel.description,
      "relationship": complaintModel.relationship,
      "timestamp": complaintModel.timestamp,
    });
  }
}

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../submit_complaint/models/complaint_model.dart';

class MediatorCaseFeedController extends GetxController {
  static MediatorCaseFeedController to = Get.find();

  final Rxn<List<ComplaintModel>> cases = Rxn<List<ComplaintModel>>();

  /// Collection references
  final CollectionReference _casesCollectionReference =
      FirebaseFirestore.instance.collection('cases');

  /// Stream controllers
  final StreamController<List<ComplaintModel>> _casesStreamController =
      StreamController<List<ComplaintModel>>.broadcast();

  @override
  void onInit() async {
    cases.bindStream(listenToCasesRealTime());
    super.onInit();
  }

  /// Listen to Complaints stream
  Stream<List<ComplaintModel>> listenToCasesRealTime() {
    _casesCollectionReference.snapshots().listen((complaintsSnapshot) {
      if (complaintsSnapshot.docs.isNotEmpty) {
        List<ComplaintModel> _complaints = complaintsSnapshot.docs.isEmpty
            ? []
            : complaintsSnapshot.docs
                .map((doc) => ComplaintModel.fromDocument(doc: doc))
                .toList();

        _casesStreamController.add(_complaints);
      } else {
        _casesStreamController.add([]);
      }
    });

    return _casesStreamController.stream;
  }

  /// Delete Complaint from Firebase
  Future deleteCase({required ComplaintModel complaintModel}) async {
    await _casesCollectionReference.doc(complaintModel.id).delete();
  }
}

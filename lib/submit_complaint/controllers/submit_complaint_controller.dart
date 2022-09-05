import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class SubmitComplaintController extends GetxController {
  final TextEditingController nameTextEditingController =
      TextEditingController();
  final TextEditingController caseDescriptionTextEditingController =
      TextEditingController();
  final TextEditingController numberOfPartiesTextEditingController =
      TextEditingController();
  final TextEditingController nameOfOtherPartiesTextEditingController =
      TextEditingController();
  final TextEditingController phoneNumberTextEditingController =
      TextEditingController();
  final TextEditingController relationshipTextEditingController =
      TextEditingController();

  /// Collection references
  final CollectionReference _complaintsCollectionReference =
      FirebaseFirestore.instance.collection('complaints');

  /// Submit complaint to TOWN COUNCIL
  void submitComplaint() {
    if (nameTextEditingController.text.isNotEmpty &&
        caseDescriptionTextEditingController.text.isNotEmpty &&
        numberOfPartiesTextEditingController.text.isNotEmpty &&
        nameOfOtherPartiesTextEditingController.text.isNotEmpty &&
        phoneNumberTextEditingController.text.isNotEmpty &&
        relationshipTextEditingController.text.isNotEmpty) {
      final String _id = const Uuid().v4();

      _complaintsCollectionReference.doc(_id).set({
        "status": "new",
        "id": _id,
        "name": nameTextEditingController.text,
        "description": caseDescriptionTextEditingController.text,
        "numberOfParties": numberOfPartiesTextEditingController.text,
        "nameOfOtherParties": nameOfOtherPartiesTextEditingController.text,
        "phoneNumber": phoneNumberTextEditingController.text,
        "relationship": relationshipTextEditingController.text,
        "timestamp": DateTime.now(),
      });

      Get.back();

      Get.snackbar(
        "Submitted".tr,
        "Your complaint has been sent to the Town Council",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 10),
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        "Invalid".tr,
        "Please fill up all fields",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 10),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}

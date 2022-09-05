import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/ui/unauth_home_page.dart';
import '../models/mediator_model.dart';
import '../models/town_council_model.dart';
import '../ui/start_up_logic_page.dart';

class AuthController extends GetxController {
  static AuthController to = Get.find();

  /// Text Editing Controllers
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController usernameTextController = TextEditingController();
  final TextEditingController townCouncilLocationTextController =
      TextEditingController();

  /// Firebase instances
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  /// Stored values
  Rxn<User> firebaseUser = Rxn<User>();
  Rxn<TownCouncilModel> firestoreTownCouncil = Rxn<TownCouncilModel>();
  Rxn<MediatorModel> firestoreMediator = Rxn<MediatorModel>();
  RxString type = RxString("");
  RxBool isPasswordVisible = RxBool(true);
  RxBool isNewUser = RxBool(false);
  RxBool isLoading = RxBool(false);

  @override
  void onReady() async {
    super.onReady();

    /// Run every time auth state changes
    ever(firebaseUser, handleAuthChanged);

    firebaseUser.bindStream(user);
  }

  @override
  void onClose() {
    super.onClose();

    emailTextController.dispose();
    passwordTextController.dispose();
    usernameTextController.dispose();
  }

  void handleAuthChanged(_firebaseUser) async {
    if (_firebaseUser?.uid != null) {
      firestoreTownCouncil.bindStream(streamFirestoreTownCouncil());

      firestoreMediator.bindStream(streamFirestoreMediator());

      Get.offAll(() => const StartUpLogicPage());
    } else {
      Get.offAll(() => const UnAuthHomePage());
    }
  }

  /// Firebase user one-time fetch
  Future<User> get getUser async => _firebaseAuth.currentUser!;

  /// Firebase user a real time stream
  Stream<User?> get user => _firebaseAuth.authStateChanges();

  /// Streams the firestore TOWN COUNCIL from the firestore collection
  Stream<TownCouncilModel?> streamFirestoreTownCouncil() {
    return _firebaseFirestore
        .collection("townCouncils")
        .doc(firebaseUser.value!.uid)
        .snapshots()
        .map((snapshot) => snapshot.data() == null
            ? null
            : TownCouncilModel.fromData(snapshot.data()!));
  }

  /// Streams the firestore MEDIATOR from the firestore collection
  Stream<MediatorModel?> streamFirestoreMediator() {
    return _firebaseFirestore
        .collection("mediators")
        .doc(firebaseUser.value!.uid)
        .snapshots()
        .map((snapshot) => snapshot.data() == null
            ? null
            : MediatorModel.fromData(snapshot.data()!));
  }

  /// Updates the Firestore TOWN COUNCIL in users collection
  void updateTownCouncilFirestore({required TownCouncilModel townCouncil}) {
    _firebaseFirestore
        .collection("townCouncils")
        .doc(firebaseUser.value!.uid)
        .update(townCouncil.data(townCouncil: townCouncil));
    update();
  }

  /// Updates the Firestore MEDIATOR in merchants collection
  void updateMediatorFirestore({required MediatorModel mediatorModel}) {
    _firebaseFirestore
        .collection("mediators")
        .doc(firebaseUser.value!.uid)
        .update(mediatorModel.data(mediator: mediatorModel));
    update();
  }

  /// Create the firestore TOWN COUNCIL in users collection
  void _createTownCouncilFirestore(
      TownCouncilModel townCouncil, User _firebaseUser) {
    _firebaseFirestore
        .collection("townCouncil")
        .doc(_firebaseUser.uid)
        .set(townCouncil.toJson());
    update();
  }

  /// Create the firestore MEDIATOR in users collection
  void _createMediatorFirestore(MediatorModel mediator, User _firebaseUser) {
    _firebaseFirestore
        .collection("mediator")
        .doc(_firebaseUser.uid)
        .set(mediator.toJson());
    update();
  }

  /// Method to handle user sign in using email and password
  void signInWithEmailAndPassword(BuildContext context) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: emailTextController.text.trim(),
          password: passwordTextController.text.trim());
      emailTextController.clear();
      passwordTextController.clear();
    } catch (error) {
      Get.snackbar(
        'Incorrect Email or Password'.tr,
        'The email or password you entered is incorrect. Please try again.'.tr,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 7),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  /// User registration using email and password (MERCHANT)
  void registerWithEmailAndPassword(BuildContext context) async {
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(
        email: emailTextController.text,
        password: passwordTextController.text,
      )
          .then((result) async {
        if (type.value == "townCouncil") {
          /// Create the new TOWN COUNCIL object
          TownCouncilModel _newTownCouncil = TownCouncilModel(
            id: result.user!.uid,
            email: result.user!.email!,
            townCouncilLocation: townCouncilLocationTextController.text,
          );

          /// Create the TOWN COUNCIL in Firestore
          _createTownCouncilFirestore(_newTownCouncil, result.user!);
        } else {
          /// Create the new MEDIATOR object
          MediatorModel _newMediator = MediatorModel(
            id: result.user!.uid,
            email: result.user!.email!,
            username: usernameTextController.text,
          );

          /// Create the MEDIATOR in Firestore
          _createMediatorFirestore(_newMediator, result.user!);
        }

        /// Clear Text Editing Controllers
        emailTextController.clear();
        passwordTextController.clear();
        usernameTextController.clear();
        townCouncilLocationTextController.clear();
      });
    } on FirebaseAuthException catch (error) {
      Get.snackbar(
        'Sign up error'.tr,
        error.message!,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 10),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  /// Password reset email
  Future<void> sendPasswordResetEmail(BuildContext context) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(
          email: emailTextController.text);
      Get.snackbar(
        'auth.resetPasswordNoticeTitle'.tr,
        'auth.resetPasswordNotice'.tr,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 5),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } on FirebaseAuthException catch (error) {
      Get.snackbar(
        'auth.resetPasswordFailed'.tr,
        error.message!,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 10),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  /// Sign out
  Future<void> signOut() {
    /// Clear Text Editing Controllers
    emailTextController.clear();
    passwordTextController.clear();
    usernameTextController.clear();
    townCouncilLocationTextController.clear();

    /// Reset Firestore TOWN COUNCIL and MEDIATOR value
    firestoreMediator.value = null;
    firestoreTownCouncil.value = null;

    return _firebaseAuth.signOut();
  }

  Future<bool> checkIfUsernameExists({required String username}) async {
    QuerySnapshot userDoc = await _firebaseFirestore
        .collection("users")
        .where("username", isEqualTo: username)
        .get();

    return userDoc.docs.isNotEmpty;
  }
}

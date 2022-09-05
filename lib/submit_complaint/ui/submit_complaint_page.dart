import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/ui_helpers.dart';
import '../../general_widgets/buttons/elongated_button.dart';
import '../../general_widgets/centred_view.dart';
import '../../general_widgets/input_fields/text_form_field.dart';
import '../controllers/submit_complaint_controller.dart';

class SubmitComplaintPage extends StatelessWidget {
  const SubmitComplaintPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData _mediaQuery = MediaQuery.of(context);

    /// GetX Controllers
    final SubmitComplaintController _submitComplaintController =
        Get.put(SubmitComplaintController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: const Text(
          "Case Submission",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20.0,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: CenteredView(
        child: ListView(
          children: [
            CustomTextFormField(
              header: "Name",
              hintText: "Please let us know who you are",
              textEditingController:
                  _submitComplaintController.nameTextEditingController,
              textInputType: TextInputType.text,
            ),
            SizedBox(height: _mediaQuery.size.height * 0.05),
            CustomTextFormField(
              header: "Phone number",
              hintText: "What number should we use to contact you?",
              textEditingController:
                  _submitComplaintController.phoneNumberTextEditingController,
              textInputType: TextInputType.number,
            ),
            SizedBox(height: _mediaQuery.size.height * 0.05),
            CustomTextFormField(
              header: "Number of parties",
              hintText: "How many people are involved?",
              textEditingController: _submitComplaintController
                  .numberOfPartiesTextEditingController,
              textInputType: TextInputType.number,
            ),
            SizedBox(height: _mediaQuery.size.height * 0.05),
            CustomTextFormField(
              header: "What is the name of the other parties?",
              hintText: "Who are involved?",
              textEditingController: _submitComplaintController
                  .nameOfOtherPartiesTextEditingController,
              textInputType: TextInputType.text,
            ),
            SizedBox(height: _mediaQuery.size.height * 0.05),
            CustomTextFormField(
              header: "What is your relationship with the other parties?",
              hintText: "Brother, aunt, etc",
              textEditingController:
                  _submitComplaintController.relationshipTextEditingController,
              textInputType: TextInputType.text,
            ),
            SizedBox(height: _mediaQuery.size.height * 0.05),
            CustomTextFormField(
              header: "Case Description",
              hintText: "What happened?",
              textEditingController: _submitComplaintController
                  .caseDescriptionTextEditingController,
              textInputType: TextInputType.multiline,
            ),
            SizedBox(height: _mediaQuery.size.height * 0.10),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: _mediaQuery.size.width * 0.25),
              child: ElongatedButton(
                text: "Submit",
                onPressed: () => _submitComplaintController.submitComplaint(),
                buttonColour: kPrimaryColour,
                textColour: kSecondaryColour,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../config/ui_helpers.dart';
import '../../general_widgets/buttons/elongated_button.dart';
import '../../general_widgets/centred_view.dart';
import '../../general_widgets/pop_up_dialog.dart';
import '../../submit_complaint/models/complaint_model.dart';
import '../controllers/town_council_complaint_feed_controller.dart';

class TownCouncilComplaintsPage extends StatelessWidget {
  final ComplaintModel complaintModel;
  final String status;

  const TownCouncilComplaintsPage({
    Key? key,
    required this.complaintModel,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData _mediaQuery = MediaQuery.of(context);

    /// GetX Controllers
    final TownCouncilFeedController _townCouncilFeedController =
        TownCouncilFeedController.to;

    Widget _buildSection({
      required String title,
      required String subtitle,
    }) {
      return Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 15.0),
          ),
        ],
      );
    }

    Widget _buildSendForMediationButton() {
      return Column(
        children: [
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: _mediaQuery.size.width * 0.3),
            child: ElongatedButton(
              text: "Send to Lawyer",
              onPressed: () => showDialog(
                context: context,
                builder: (dialogContext) {
                  return popUpDialog(
                    dialogContext: dialogContext,
                    function: () {
                      _townCouncilFeedController.sendForMediation(
                          complaintModel: complaintModel);

                      _townCouncilFeedController.updateStatusOfComplaint(
                        complaintModel: complaintModel,
                        status: "sent",
                      );

                      Navigator.pop(dialogContext);

                      Get.back();
                    },
                    description: 'Are you sure?',
                    noColourButtonText: 'No',
                    colourButtonText: 'Yes',
                    buttonColour: Colors.green,
                    icon: const Icon(
                      FontAwesomeIcons.info,
                      color: Colors.white,
                      size: 50.0,
                    ),
                    circularImageColour: Colors.green,
                  );
                },
              ),
              buttonColour: kPrimaryColour,
              textColour: kSecondaryColour,
            ),
          ),
          SizedBox(height: _mediaQuery.size.height * 0.02),
        ],
      );
    }

    Widget _buildPreliminaryChecksButton() {
      return Column(
        children: [
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: _mediaQuery.size.width * 0.3),
            child: ElongatedButton(
              text: "Preliminary Checks",
              onPressed: () => showDialog(
                context: context,
                builder: (dialogContext) {
                  return popUpDialog(
                    dialogContext: dialogContext,
                    function: () {
                      _townCouncilFeedController.updateStatusOfComplaint(
                        complaintModel: complaintModel,
                        status: "pending",
                      );

                      Navigator.pop(dialogContext);

                      Get.back();
                    },
                    description:
                        'Are you going to conduct preliminary checks and investigations for this case?',
                    noColourButtonText: 'No',
                    colourButtonText: 'Yes',
                    buttonColour: Colors.green,
                    icon: const Icon(
                      FontAwesomeIcons.info,
                      color: Colors.white,
                      size: 50.0,
                    ),
                    circularImageColour: Colors.green,
                  );
                },
              ),
              buttonColour: kPrimaryColour,
              textColour: kSecondaryColour,
            ),
          ),
          SizedBox(height: _mediaQuery.size.height * 0.02),
        ],
      );
    }

    Widget _buildReopenCaseButton() {
      return Column(
        children: [
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: _mediaQuery.size.width * 0.3),
            child: ElongatedButton(
              text: "Reopen Case",
              onPressed: () => showDialog(
                context: context,
                builder: (dialogContext) {
                  return popUpDialog(
                    dialogContext: dialogContext,
                    function: () {
                      _townCouncilFeedController.updateStatusOfComplaint(
                        complaintModel: complaintModel,
                        status: "new",
                      );

                      Navigator.pop(dialogContext);

                      Get.back();
                    },
                    description: 'Do you want to reopen this case?',
                    noColourButtonText: 'No',
                    colourButtonText: 'Yes',
                    buttonColour: Colors.green,
                    icon: const Icon(
                      FontAwesomeIcons.info,
                      color: Colors.white,
                      size: 50.0,
                    ),
                    circularImageColour: Colors.green,
                  );
                },
              ),
              buttonColour: kPrimaryColour,
              textColour: kSecondaryColour,
            ),
          ),
          SizedBox(height: _mediaQuery.size.height * 0.02),
        ],
      );
    }

    Widget _buildDismissCaseButton() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: _mediaQuery.size.width * 0.3),
        child: ElongatedButton(
          text: "Dismiss Case",
          onPressed: () => showDialog(
            context: context,
            builder: (dialogContext) {
              return popUpDialog(
                dialogContext: dialogContext,
                function: () {
                  _townCouncilFeedController.updateStatusOfComplaint(
                    complaintModel: complaintModel,
                    status: "dismiss",
                  );

                  Navigator.pop(dialogContext);

                  Get.back();
                },
                description: 'Dismiss Case?',
                noColourButtonText: 'No',
                colourButtonText: 'Yes',
                buttonColour: Colors.red,
                icon: const Icon(
                  FontAwesomeIcons.times,
                  color: Colors.white,
                  size: 50.0,
                ),
                circularImageColour: Colors.red,
              );
            },
          ),
          buttonColour: Colors.red,
          textColour: Colors.white,
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: CenteredView(
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(height: _mediaQuery.size.height * 0.02),
            _buildSection(
              title: "Name",
              subtitle: complaintModel.name,
            ),
            SizedBox(height: _mediaQuery.size.height * 0.02),
            _buildSection(
              title: "Complainant's Phone Number",
              subtitle: complaintModel.phoneNumber,
            ),
            SizedBox(height: _mediaQuery.size.height * 0.02),
            _buildSection(
              title: "Number of Parties",
              subtitle: complaintModel.numberOfParties,
            ),
            SizedBox(height: _mediaQuery.size.height * 0.02),
            _buildSection(
              title: "Name of Other Parties",
              subtitle: complaintModel.nameOfParties,
            ),
            SizedBox(height: _mediaQuery.size.height * 0.02),
            _buildSection(
              title: "Relationship",
              subtitle: complaintModel.relationship,
            ),
            SizedBox(height: _mediaQuery.size.height * 0.02),
            _buildSection(
              title: "Case Description",
              subtitle: complaintModel.description,
            ),
            SizedBox(height: _mediaQuery.size.height * 0.05),
            status == "new" ? _buildPreliminaryChecksButton() : Container(),
            status == "pending" ? _buildSendForMediationButton() : Container(),
            status == "dismiss" ? _buildReopenCaseButton() : Container(),
            status != "dismiss" ? _buildDismissCaseButton() : Container(),
          ],
        ),
      ),
    );
  }
}

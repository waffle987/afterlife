import 'package:flutter/material.dart';

import '../../general_widgets/centred_view.dart';
import '../../submit_complaint/models/complaint_model.dart';

class MediatorCasePage extends StatelessWidget {
  final ComplaintModel complaintModel;

  const MediatorCasePage({
    Key? key,
    required this.complaintModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData _mediaQuery = MediaQuery.of(context);

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
          ],
        ),
      ),
    );
  }
}

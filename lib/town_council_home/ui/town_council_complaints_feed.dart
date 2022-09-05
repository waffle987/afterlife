import 'package:afterlife/town_council_home/ui/town_council_complaints_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../config/ui_helpers.dart';
import '../../general_widgets/progress_indicators.dart';
import '../../submit_complaint/models/complaint_model.dart';
import '../controllers/town_council_complaint_feed_controller.dart';

class TownCouncilComplaintsFeed extends StatelessWidget {
  final String status;

  const TownCouncilComplaintsFeed({
    Key? key,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData _mediaQuery = MediaQuery.of(context);

    /// GetX controllers
    final TownCouncilFeedController _townCouncilFeedController =
        TownCouncilFeedController.to;

    return Obx(
      () => _townCouncilFeedController.complaints.value != null
          ? _townCouncilFeedController.complaints.value!.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount:
                      _townCouncilFeedController.complaints.value!.length,
                  itemBuilder: (_, index) {
                    ComplaintModel complaintModel =
                        _townCouncilFeedController.complaints.value![index];

                    if (complaintModel.status == "new" && status == "new") {
                      return GestureDetector(
                        onTap: () => Get.to(() => TownCouncilComplaintsPage(
                              complaintModel: complaintModel,
                              status: complaintModel.status,
                            )),
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: _mediaQuery.size.height * 0.02),
                          child: Column(
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: kPrimaryColour,
                                  child: Text(
                                    (index + 1).toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: kSecondaryColour,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  complaintModel.name,
                                ),
                                subtitle: Text(complaintModel.description),
                                trailing: Text(
                                  timeago.format(
                                      complaintModel.timestamp.toDate()),
                                ),
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      );
                    } else if (complaintModel.status == "pending" &&
                        status == "pending") {
                      return GestureDetector(
                        onTap: () => Get.to(() => TownCouncilComplaintsPage(
                              complaintModel: complaintModel,
                              status: complaintModel.status,
                            )),
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: _mediaQuery.size.height * 0.02),
                          child: Column(
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: kPrimaryColour,
                                  child: Text(
                                    (index + 1).toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: kSecondaryColour,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  complaintModel.name,
                                ),
                                subtitle: Text(complaintModel.description),
                                trailing: Text(
                                  timeago.format(
                                      complaintModel.timestamp.toDate()),
                                ),
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      );
                    } else if (complaintModel.status == "sent" &&
                        status == "sent") {
                      return GestureDetector(
                        onTap: () => Get.to(() => TownCouncilComplaintsPage(
                              complaintModel: complaintModel,
                              status: complaintModel.status,
                            )),
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: _mediaQuery.size.height * 0.02),
                          child: Column(
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: kPrimaryColour,
                                  child: Text(
                                    (index + 1).toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: kSecondaryColour,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  complaintModel.name,
                                ),
                                subtitle: Text(complaintModel.description),
                                trailing: Text(
                                  timeago.format(
                                      complaintModel.timestamp.toDate()),
                                ),
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      );
                    } else if (complaintModel.status == "dismiss" &&
                        status == "dismiss") {
                      return GestureDetector(
                        onTap: () => Get.to(() => TownCouncilComplaintsPage(
                              complaintModel: complaintModel,
                              status: complaintModel.status,
                            )),
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: _mediaQuery.size.height * 0.02),
                          child: Column(
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: kPrimaryColour,
                                  child: Text(
                                    (index + 1).toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: kSecondaryColour,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  complaintModel.name,
                                ),
                                subtitle: Text(complaintModel.description),
                                trailing: Text(
                                  timeago.format(
                                      complaintModel.timestamp.toDate()),
                                ),
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                )
              : Container()
          : Center(child: circularProgressIndicator(context: context)),
    );
  }
}

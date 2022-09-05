import 'package:afterlife/config/ui_helpers.dart';
import 'package:afterlife/town_council_home/ui/town_council_complaints_feed.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../authentication/controllers/auth_controller.dart';
import '../../config/assets.dart';
import '../../general_widgets/buttons/elongated_button.dart';
import '../../general_widgets/centred_view.dart';
import '../controllers/town_council_complaint_feed_controller.dart';

class TownCouncilHomePage extends StatelessWidget {
  const TownCouncilHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData _mediaQuery = MediaQuery.of(context);

    /// GetX Controllers
    final AuthController _authController = AuthController.to;
    Get.put<TownCouncilFeedController>(TownCouncilFeedController());

    /// Build bubble tab bar
    Widget _buildTabBar() {
      return const TabBar(
        indicator: BubbleTabIndicator(
          indicatorColor: kPrimaryColour,
          indicatorHeight: 30.0,
          indicatorRadius: 20.0,
          tabBarIndicatorSize: TabBarIndicatorSize.tab,
        ),
        unselectedLabelColor: Colors.black,
        labelColor: Colors.white,
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        tabs: <Widget>[
          Tab(
            child: Text('New'),
          ),
          Tab(
            child: Text('Pending'),
          ),
          Tab(
            child: Text('Sent'),
          ),
          Tab(
            child: Text('Dismissed'),
          ),
        ],
      );
    }

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0.0,
          title: Row(
            children: [
              CircleAvatar(
                backgroundImage: Image.asset(Assets.logo).image,
              ),
              SizedBox(width: _mediaQuery.size.width * 0.01),
              const Text(
                'Afterlife (Paralegal)',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: EdgeInsets.all(_mediaQuery.size.width * 0.005),
              child: ElongatedButton(
                text: "Sign Out",
                onPressed: () => _authController.signOut(),
                buttonColour: Colors.red,
                textColour: Colors.white,
              ),
            ),
          ],
        ),
        body: CenteredView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: _mediaQuery.size.height * 0.06,
                margin: EdgeInsets.symmetric(
                    horizontal: _mediaQuery.size.width * 0.05),
                alignment: Alignment.center,
                child: _buildTabBar(),
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    TownCouncilComplaintsFeed(status: "new"),
                    TownCouncilComplaintsFeed(status: "pending"),
                    TownCouncilComplaintsFeed(status: "sent"),
                    TownCouncilComplaintsFeed(status: "dismiss"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

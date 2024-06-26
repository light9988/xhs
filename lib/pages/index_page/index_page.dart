import 'package:flutter/material.dart';
import 'package:xhs/constants/color_plate.dart';
import 'package:xhs/models/card_data.dart';
import 'package:get/get.dart';

import 'index_controller.dart';

class IndexPage extends StatelessWidget {
  IndexPage({Key? key}) : super(key: key);
  final IndexController controller = Get.put(IndexController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorPlate.background,
        body: Column(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/images/menu.png",
                      width: 30, height: 30), //to be hamburger menu of setting
                  SizedBox(
                    height: 30,
                    width: 300,
                    child: TabBar(
                      labelColor: Colors.black,
                      dividerColor: Colors.transparent,
                      indicatorColor: ColorPlate.primary,
                      controller: controller.tabController,
                      // tabs: const [
                      //   Tab(text: "Follow  "),
                      //   Tab(text: "Explore  "),
                      //   Tab(text: "Nearby  "),
                      //   Tab(text: "Shop  "),
                      // ],
                      tabs: [
                        for (final tabText in [
                          "Follow  ",
                          "Explore  ",
                          "Nearby  ",
                          "Shop  "
                        ])
                          Tab(
                            child: DefaultTextStyle(
                              style: TextStyle(fontSize: 13, color: Colors.black),
                              child: Text(tabText),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Image.asset("assets/images/search.png",
                      width: 30, height: 30), //to be real serch function
                ],
              ),
            ),
            Expanded(
              child: GetBuilder<IndexController>(
                builder: (_) {
                  return TabBarView(
                    controller: controller.tabController,
                    children: [
                      buildFollowPage(),
                      buildExplorePage(),
                      buildNearbyPage(),
                      buildShopPage(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFollowPage() {
    return const Center(child: Text("Developing"));
  }

  Widget buildExplorePage() {
    return ListView(
      children: [
        Row(
          children: [
            Column(
              children: controller.data.map((e) => buildCardItem(e)).toList(),
            ),
            Column(
              children: controller.data.reversed
                  .map((e) => buildCardItem(e))
                  .toList(),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildNearbyPage() {
    return const Center(child: Text("Developing"));
  }

  Widget buildShopPage() {
    return const Center(child: Text("Developing"));
  }

  Widget buildCardItem(CardData cardData) {
    return GestureDetector(
      onTap: () {
        controller.openIndexDetailPage(cardData.id);
      },
      child: Container(
        width: (Get.width / 2) - 8,
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(4)),
              child: Image.asset(
                cardData.cover,
                width: Get.width / 2,
                height: Get.width / 2 + 30,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
              child: Text(cardData.content,
                  maxLines: 2, overflow: TextOverflow.ellipsis),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
              child: Row(
                children: [
                  ClipOval(
                    child: Image.asset(cardData.avatar,
                        width: 20, height: 20, fit: BoxFit.cover),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(cardData.nickname),
                  ),
                  const Spacer(),
                  Image.asset("assets/images/like.png", width: 20),
                  Text(cardData.like.toString())
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

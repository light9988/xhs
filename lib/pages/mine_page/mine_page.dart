import 'package:flutter/material.dart';
import 'package:xhs/constants/color_plate.dart';
import 'package:xhs/main.dart';
import 'package:xhs/models/card_data.dart';
import 'package:get/get.dart';
import 'mine_controller.dart';
import 'package:xhs/pages/mine_page/mine_page_data.dart';
import 'package:xhs/pages/login_page/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

final logger = Logger();

User? _currentUser = FirebaseAuth.instance.currentUser;
final userUid = _currentUser?.uid;

class MinePage extends StatelessWidget {
  MinePage({Key? key}) : super(key: key);
  final MineController controller = Get.put(MineController());

  @override
  Widget build(BuildContext context) {
    logger.i('current user uid: $userUid)');
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              // SliverAppBar(
              //   floating: false,
              //   pinned: true,
              //   title: Text("ddd"),
              // ),
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverToBoxAdapter(child: _buildHeader()),
              ),

              SliverPersistentHeader(
                pinned: true,
                delegate: SliverHeaderDelegate.fixedHeight(
                  height: 40,
                  child: Container(
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: TabBar(
                        isScrollable: true,
                        padding: const EdgeInsets.only(top: 10),
                        labelColor: Colors.black,
                        dividerColor: Colors.transparent,
                        indicatorColor: ColorPlate.primary,
                        controller: controller.tabController,
                        tabs: const [
                          Tab(text: "Posts"),
                          Tab(
                              icon: Row(children: [
                            Icon(Icons.lock, size: 16),
                            Text("Collects")
                          ])),
                          Tab(text: "likes"),
                        ]),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(controller: controller.tabController, children: [
            Builder(builder: (context) {
              return CustomScrollView(
                key: const PageStorageKey<String>("Posts"),
                slivers: <Widget>[
                  SliverOverlapInjector(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                  ),
                  SliverToBoxAdapter(child: buildMyPage()),
                ],
              );
            }),
            const Center(child: Text("You haven't collected any posts yet")),
            const Center(child: Text("You haven't liked any posts yet")),
          ]),
        ),
      ),
    );
  }

  Widget buildHeader(int i) {
    return Container(
      color: Colors.lightBlue.shade200,
      alignment: Alignment.centerLeft,
      child: Text("PersistentHeader $i"),
    );
  }

  Widget _buildHeader() {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        children: [
          Image.asset(
            "assets/images/bg.png",
            width: Get.width,
            height: 250,
            fit: BoxFit.cover,
            // errorBuilder: (_, __, ___) => Image.asset(
            //   "assets/images/bg.png",
            //   width: Get.width,
            //   height: 220,
            //   fit: BoxFit.cover,
            // ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 16,
              left: 16,
              right: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.menu, color: Colors.white),
                    Image.asset(
                      "assets/images/bg.png",
                      width: 20,
                      height: 20,
                      color: Colors.white,
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 12, top: 12),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              shape: BoxShape.circle,
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                "assets/images/profile.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 4.0),
                                child: Text(
                                  "Alice",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                              Text(
                                   "ID: 123456789",
                                  // "ID: $userUid",
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const Text("App Developer | Actor",
                    style: TextStyle(color: Colors.white)),
                Padding(
                  padding: const EdgeInsets.only(top: 6.0, bottom: 10),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: const ShapeDecoration(
                            shape: StadiumBorder(), color: Colors.grey),
                        child: const Text("Lion",
                            style:
                                TextStyle(color: Colors.white, fontSize: 10)),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: const ShapeDecoration(
                            shape: StadiumBorder(), color: Colors.grey),
                        child: const Text("United States",
                            style:
                                TextStyle(color: Colors.white, fontSize: 10)),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    // const Expanded(
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text("1",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12)),
                            Text("Following",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12))
                          ],
                        ),
                        SizedBox(width: 10),
                        Column(
                          children: [
                            Text("300K",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12)),
                            Text("Followers",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12))
                          ],
                        ),
                        SizedBox(width: 10),
                        Column(
                          children: [
                            Text("500K",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12)),
                            Text("Likes&Col",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12))
                          ],
                        ),
                      ],
                    ),
                    // ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 30,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: ShapeDecoration(
                              color: Colors.white.withOpacity(0.2),
                              shape: const StadiumBorder(
                                  side: BorderSide(color: Colors.white)),
                            ),
                            child: const Text("Profile",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12)),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 20),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            alignment: Alignment.center,
                            height: 30,
                            decoration: ShapeDecoration(
                              color: Colors.white.withOpacity(0.2),
                              shape: const StadiumBorder(
                                  side: BorderSide(color: Colors.white)),
                            ),
                            child: Image.asset(
                              "assets/images/setting.png",
                              width: 17,
                              height: 17,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMyPage() {
    return Column(
      // physics: NeverScrollableScrollPhysics(),
      // padding: EdgeInsets.zero,
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
                  Text(cardData.fav.toString())
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

typedef SliverHeaderBuilder = Widget Function(
    BuildContext context, double shrinkOffset, bool overlapsContent);

class SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  SliverHeaderDelegate({
    required this.maxHeight,
    this.minHeight = 0,
    required Widget child,
  })  : builder = ((a, b, c) => child),
        assert(minHeight <= maxHeight && minHeight >= 0);

  SliverHeaderDelegate.fixedHeight({
    required double height,
    required Widget child,
  })  : builder = ((a, b, c) => child),
        maxHeight = height,
        minHeight = height;

  SliverHeaderDelegate.builder({
    required this.maxHeight,
    this.minHeight = 0,
    required this.builder,
  });

  final double maxHeight;
  final double minHeight;
  final SliverHeaderBuilder builder;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    Widget child = builder(context, shrinkOffset, overlapsContent);

    assert(() {
      if (child.key != null) {
        print('${child.key}: shrink: $shrinkOffset，overlaps:$overlapsContent');
      }
      return true;
    }());
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(SliverHeaderDelegate old) {
    return old.maxExtent != maxExtent || old.minExtent != minExtent;
  }
}

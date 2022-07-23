import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/constants/colors.dart';
import 'package:travelapp/constants/dimens.dart';
import 'package:travelapp/constants/strings.dart';
import 'package:travelapp/widgets/app_large_text.dart';
import 'package:travelapp/widgets/app_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  var images = {
    "kayaking.png": "Kayaking",
    "snorkling.png": "Snorkling",
    "balloning.png": "Balloning",
    "hiking.png": "Hiking",
    "mountain.jpeg": "Mountain",
    "welcome-one.png": "Welcome"
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.only(
          // bottom: 4 * AppDimens.vertical,
          top: 3 * AppDimens.vertical,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(),
            // app large text
            pageTitle(),
            SizedBox(
              height: AppDimens.vertical,
            ),
            // Tabbar
            tabBarItems(_tabController),
            listViewWithTabBarView(_tabController),
            exploreMore(),
            SizedBox(
              height: 2 * AppDimens.vertical - 5,
            ),
            bottomListViewBar()
          ],
        ),
      ),
    );
  }

  Container listViewWithTabBarView(TabController _tabController) {
    return Container(
      padding: EdgeInsets.only(left: AppDimens.horizontal),
      margin: EdgeInsets.only(top: 2 * AppDimens.vertical),
      width: double.maxFinite,
      height: 20 * AppDimens.vertical,
      child: TabBarView(controller: _tabController, children: [
        listViewCustom(),
        listViewCustom(),
        listViewCustom(),
      ]),
    );
  }

  Container tabBarItems(TabController _tabController) {
    return Container(
      child: Align(
        alignment: Alignment.centerLeft,
        child: TabBar(
            labelColor: AppColors.black,
            unselectedLabelColor: AppColors.textColor2,
            labelPadding: EdgeInsets.only(
              left: AppDimens.horizontal + 5,
              right: AppDimens.horizontal + 5,
            ),
            controller: _tabController,
            indicator:
                CircleTabIndicator(color: AppColors.mainColor, radius: 4),
            indicatorSize: TabBarIndicatorSize.label,
            isScrollable: true,
            tabs: [
              Tab(
                text: AppStrings.homeTabBarItems,
              ),
              Tab(
                text: AppStrings.homeTabBarItems2,
              ),
              Tab(
                text: AppStrings.homeTabBarItems3,
              ),
            ]),
      ),
    );
  }

  Padding pageTitle() {
    return Padding(
      padding: EdgeInsets.only(left: AppDimens.horizontal + 5),
      child: AppLargeText(text: AppStrings.homeScreenTitle),
    );
  }

  Container header() {
    return Container(
      padding: EdgeInsets.only(
          left: AppDimens.horizontal - 5, bottom: AppDimens.vertical + 5),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            size: 2 * AppDimens.horizontal,
            color: AppColors.black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: AppDimens.horizontal - 5),
          child: Card(
            elevation: 0,
            child: Container(
              width: 3 * AppDimens.horizontal + 5,
              height: 3 * AppDimens.vertical + 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimens.horizontal - 5),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/mountain.jpeg"),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Container bottomListViewBar() {
    return Container(
      height: 7 * AppDimens.horizontal + 5,
      width: double.maxFinite,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          shrinkWrap: false,
          itemCount: images.length,
          itemBuilder: (BuildContext context, index) {
            return Container(
              padding:
                  EdgeInsets.only(right: 10, left: AppDimens.horizontal + 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 4 * AppDimens.horizontal,
                    height: 4 * AppDimens.vertical,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(AppDimens.horizontal),
                      child: Image.asset(
                        "assets/images/" + images.keys.elementAt(index),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppDimens.vertical * (2 / 3),
                  ),
                  Text(
                    images.values.elementAt(index),
                    style: TextStyle(color: AppColors.textColor2),
                  )
                ],
              ),
            );
          }),
    );
  }

  Padding exploreMore() {
    return Padding(
      padding: EdgeInsets.only(
          left: AppDimens.horizontal + 5, top: 2 * AppDimens.vertical),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppLargeText(
            text: AppStrings.more,
            size: AppDimens.horizontal,
          ),
          Padding(
            padding: EdgeInsets.only(right: AppDimens.horizontal),
            child: AppText(
              text: AppStrings.seeAll,
              color: AppColors.mainColor,
              size: AppDimens.horizontal,
            ),
          )
        ],
      ),
    );
  }

  ListView listViewCustom({String path = "mountain"}) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      itemBuilder: (BuildContext context, index) {
        return Container(
          margin: EdgeInsets.only(right: AppDimens.horizontal),
          width: 13 * AppDimens.horizontal + 5,
          height: 20 * AppDimens.vertical,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/$path.jpeg"))),
        );
      },
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2, configuration.size!.height);

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}

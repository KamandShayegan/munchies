import 'package:flutter/material.dart';
import 'package:munch/cubit/app_cubits.dart';
import 'package:munch/utils/my_colors.dart';
import 'package:munch/widgets/large_texts.dart';
import 'package:munch/widgets/texts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  Map<String, String> images = {
    "welcome_2.JPG": "Taco Bell",
    "welcome_3.JPG": "Subway",
    "welcome_1.JPG": "Burger King",
    "pizza.JPG": "Pizza Hut",
  };
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    TabController _tabController = TabController(length: 4, vsync: this);
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.menu, size: 30, color: Colors.black54),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.5)),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const LargeText(text: 'Discover'),
            const SizedBox(height: 32),
            Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelColor: Colors.black,
                labelPadding: const EdgeInsets.only(left: 16, right: 16),
                indicatorSize: TabBarIndicatorSize.label,
                indicator: DotIndicator(color: MyColors.primary, radius: 3),
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                controller: _tabController,
                tabs: const [
                  Tab(text: "FastFood"),
                  Tab(text: "Thai"),
                  Tab(text: "Sushi"),
                  Tab(text: "Indian"),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.3,
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) => InkWell(
                      onTap: () {
                        context.read<AppCubit>().setDetailPage();
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 8, top: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.red,
                          image: const DecorationImage(
                              image: AssetImage('img/welcome_1.JPG'),
                              fit: BoxFit.cover),
                        ),
                        height: double.maxFinite,
                        width: 180,
                      ),
                    ),
                  ),
                  const Center(child: Text('Thai Food')),
                  const Center(child: Text('Sushi')),
                  const Center(child: Text('Indian')),
                ],
              ),
            ),
            const SizedBox(height: 40),
            const LargeText(text: 'ِExplore more places', size: 16),
            SizedBox(
              // color: Colors.red,
              height: size.height * 0.14,
              child: ListView.builder(
                itemCount: images.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, int index) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        context.read<AppCubit>().setDetailPage();
                      },
                      child: Container(
                        margin:
                            const EdgeInsets.only(right: 12, left: 8, top: 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                              image: AssetImage(
                                  'img/' + images.keys.elementAt(index)),
                              fit: BoxFit.cover),
                        ),
                        height: 70,
                        width: 70,
                      ),
                    ),
                    const SizedBox(height: 8),
                    H2Text(
                      text: images.values.elementAt(index),
                      size: 12,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DotIndicator extends Decoration {
  final Color color;
  double radius;

  DotIndicator({required this.color, required this.radius});

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
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}

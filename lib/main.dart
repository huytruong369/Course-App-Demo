import 'package:course_app_demo/constants.dart';
import 'package:course_app_demo/detail_screen.dart';
import 'package:course_app_demo/model/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Course App',
      theme: ThemeData(),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 49,
          right: 19,
          left: 19,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  'assets/icons/menu.svg',
                ),
                Image.asset('assets/images/user.png'),
              ],
            ),
            const SizedBox(
              height: 29,
            ),
            const Text(
              'Hey Alex,',
              style: kHeadingextStyle,
            ),
            const Text(
              'Find a course you want to learn',
              style: kSubheadingextStyle,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 29),
              padding: const EdgeInsets.symmetric(
                horizontal: 19,
                vertical: 16,
              ),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F7),
                borderRadius: BorderRadius.circular(39),
              ),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/search.svg'),
                  const SizedBox(
                    width: 16,
                  ),
                  const Text(
                    'Search for anything',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFFA0A5BD),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Category',
                  style: kTitleTextStyle,
                ),
                Text(
                  'See All',
                  style: kSubtitleTextSyule.copyWith(color: kBlueColor),
                )
              ],
            ),
            const SizedBox(
              height: 29,
            ),
            Expanded(
              child: MasonryGridView.count(
                padding: const EdgeInsets.only(bottom: 19),
                itemCount: categories.length,
                crossAxisCount: 2,
                crossAxisSpacing: 19,
                mainAxisSpacing: 19,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const DetailScreen();
                          },
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      height: index.isEven ? 200 : 240,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(19),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            categories[index].image,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            categories[index].name,
                            style: kTitleTextStyle,
                          ),
                          Text(
                            '${categories[index].numOfCourses} Course',
                            style: TextStyle(
                              color: kTextColor.withOpacity(.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

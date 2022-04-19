import 'package:course_app_demo/constants.dart';
import 'package:course_app_demo/widgets/course_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFF5F4EF),
          image: DecorationImage(
            alignment: Alignment.topRight,
            image: AssetImage(
              'assets/images/ux_big.png',
            ),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 19,
                right: 19,
                top: 50,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: SvgPicture.asset('assets/icons/arrow-left.svg'),
                      ),
                      SvgPicture.asset('assets/icons/more-vertical.svg'),
                    ],
                  ),
                  const SizedBox(
                    height: 29,
                  ),
                  ClipPath(
                    clipper: BestSellerClipper(),
                    child: Container(
                      color: kBestSellerColor,
                      padding: const EdgeInsets.only(
                        top: 5,
                        bottom: 5,
                        left: 10,
                        right: 19,
                      ),
                      child: Text(
                        'Best Seller'.toUpperCase(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Design Thinking',
                    style: kHeadingextStyle,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/person.svg'),
                      const SizedBox(
                        width: 6,
                      ),
                      const Text('18K'),
                      const SizedBox(
                        width: 21,
                      ),
                      SvgPicture.asset('assets/icons/star.svg'),
                      const SizedBox(
                        width: 6,
                      ),
                      const Text('4.8'),
                    ],
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '\$50 ',
                          style: kHeadingextStyle.copyWith(fontSize: 32),
                        ),
                        TextSpan(
                          text: '\$70',
                          style: TextStyle(
                            color: kTextColor.withOpacity(.5),
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  color: Colors.white,
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Course Content',
                            style: kHeadingextStyle,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          CourseContent(
                            title: 'Welcome to the Course',
                            number: '01',
                            duration: 6.36,
                            isDone: true,
                          ),
                          CourseContent(
                            title: 'Welcome to the Course',
                            number: '02',
                            duration: 6.36,
                          ),
                          CourseContent(
                            title: 'Welcome to the Course',
                            number: '03',
                            duration: 6.36,
                          ),
                          CourseContent(
                            title: 'Welcome to the Course',
                            number: '04',
                            duration: 6.36,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      left: 0,
                      bottom: 0,
                      child: Container(
                        padding: const EdgeInsets.all(21),
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(39),
                            topRight: Radius.circular(39),
                          ),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 4),
                              blurRadius: 50,
                              color: kTextColor.withOpacity(.1),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(15),
                              width: 80,
                              height: 56,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFEDEE),
                                borderRadius: BorderRadius.circular(39),
                              ),
                              child: SvgPicture.asset(
                                'assets/icons/shopping-bag.svg',
                              ),
                            ),
                            const SizedBox(
                              width: 19,
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                height: 56,
                                decoration: BoxDecoration(
                                  color: kBlueColor,
                                  borderRadius: BorderRadius.circular(39),
                                ),
                                child: Text(
                                  'Buy Now',
                                  style: kSubtitleTextSyule.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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

class BestSellerClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(size.width - 20, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - 20, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}

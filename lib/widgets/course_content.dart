import 'package:course_app_demo/constants.dart';
import 'package:flutter/material.dart';

class CourseContent extends StatelessWidget {
  final String number;
  final double duration;
  final String title;
  final bool isDone;
  const CourseContent({
    Key? key,
    required this.number,
    required this.duration,
    required this.title,
    this.isDone = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 29,
      ),
      child: Row(
        children: [
          Text(
            number,
            style: kHeadingextStyle.copyWith(
              fontSize: 32,
              color: kTextColor.withOpacity(.15),
            ),
          ),
          const SizedBox(
            width: 19,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '$duration mins\n',
                  style: TextStyle(
                    color: kTextColor.withOpacity(.5),
                  ),
                ),
                TextSpan(
                  text: title,
                  style: kSubtitleTextSyule.copyWith(
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            width: 39,
            height: 39,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kGreenColor.withOpacity(isDone ? 1 : .5),
            ),
            child: const Icon(
              Icons.play_arrow,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

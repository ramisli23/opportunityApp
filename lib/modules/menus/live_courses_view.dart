import 'package:opportunity1/componets/components.dart';
import 'package:opportunity1/dummies/video_courses_dummy.dart';
import 'package:opportunity1/models/course/video_course.dart';
import 'package:flutter/material.dart';
import 'package:opportunity1/cores/cores.dart';

class LiveCoursesView extends StatefulWidget {
  static const String routeName = '/live-courses';

  const LiveCoursesView({super.key});

  @override
  State<LiveCoursesView> createState() => _LiveCoursesViewState();
}

class _LiveCoursesViewState extends State<LiveCoursesView> {
  final categories = <Category>[];
  final newCourses = <VideoCourse>[];
  final popularCourses = <VideoCourse>[];

  @override
  void initState() {
    super.initState();
    localData();
  }

  Future<void> localData() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        centerTitle: false,
        title: Text('Live Courses', style: context.theme.textTheme.titleLarge),
        actions: const [
          Padding(
            padding: EdgeInsets.all(14.00),
            child: Icon(AppIcons.calendar, size: 25, color: Colors.grey),
          ),
        ],
      ),
      body: AppPullRefresh(
        onRefresh: localData,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
              ).copyWith(bottom: 10),
              child: Text(
                'Wonderful live courses with teachers',
                style: p15.grey,
              ),
            ),
            const SizedBox(height: 10),

            // 🟢 LISTE SCROLLABLE DES COURS
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                separatorBuilder: (context, i) => const SizedBox(height: 10),
                itemCount: videoCoursesJSON.length,
                itemBuilder: (context, i) {
                  return LiveCourseCard(
                    item: VideoCourse.fromJson(videoCoursesJSON[i]),
                    onPressed: () {
                      print("hi");
                    },
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

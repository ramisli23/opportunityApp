import 'package:flutter/material.dart';
import 'package:opportunity1/componets/components.dart';
import 'package:opportunity1/cores/cores.dart';
import 'package:opportunity1/dummies/categories_dummy.dart';
import 'package:opportunity1/dummies/video_courses_dummy.dart';
import 'package:opportunity1/models/course/video_course.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ionicons/ionicons.dart';

class CoursesView extends StatefulWidget {
  static const String routeName = '/courses';

  const CoursesView({super.key});

  @override
  State<CoursesView> createState() => _CoursesViewState();
}

class _CoursesViewState extends State<CoursesView> {
  final categories = <Category>[];
  final newCourses = <VideoCourse>[];
  final popularCourses = <VideoCourse>[];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final now = DateTime.now();
    final categories = categoriesJSON.map((e) => Category.fromJson(e)).toList();
    final courses =
        videoCoursesJSON.map((e) => VideoCourse.fromJson(e)).toList();
    final newCourses =
        courses.where((e) => now.difference(e.createdAt).inDays < 17).toList();
    final popularCourses =
        courses.where((e) => e.countStudents > 17000).toList();

    setState(() {
      this.categories.clear();
      this.categories.addAll(categories);
      this.newCourses.clear();
      this.newCourses.addAll(newCourses);
      this.popularCourses.clear();
      this.popularCourses.addAll(popularCourses);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        centerTitle: false,
        title: Text('Courses', style: context.theme.textTheme.titleLarge),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Ionicons.search)),
        ],
      ),
      body: AppPullRefresh(
        onRefresh: loadData,
        child: SingleChildScrollView(
          primary: true,
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 25, top: 6),
          child: Column(
            children: [
              _CategoriesListView(categories: categories),
              _NewCoursesListView(newCourses: newCourses),
              _PopularCoursesListView(popularCourses: popularCourses),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoriesListView extends StatelessWidget {
  const _CategoriesListView({required this.categories});

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:
            categories
                .map(
                  (item) => _MenuButton(
                    onPressed: () {},
                    title: item.name,
                    imagePath: item.imagePath,
                  ),
                )
                .toList(),
      ),
    );
  }
}

class _MenuButton extends StatelessWidget {
  const _MenuButton({
    required this.title,
    required this.imagePath,
    required this.onPressed,
  });

  final String title;
  final String imagePath;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    const radius = 17.00;

    return Column(
      children: [
        InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(radius),
          child: Ink(
            padding: const EdgeInsets.all(12),
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              color: const Color(0xFF94BFF8).withOpacity(0.3),
              borderRadius: BorderRadius.circular(radius),
            ),
            child: SvgPicture.asset(imagePath, width: 50, height: 50),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title, style: const TextStyle(fontSize: 13.5)),
        ),
      ],
    );
  }
}

class _NewCoursesListView extends StatelessWidget {
  const _NewCoursesListView({required this.newCourses});

  final List<VideoCourse> newCourses;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SubHeader(title: 'New Courses', onPressed: () {}),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 300,
            width: context.screenWidth,
            child: ListView(
              primary: false,
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              scrollDirection: Axis.horizontal,
              children:
                  newCourses
                      .map(
                        (item) => NewCourseCard(
                          onPressed: () {},
                          title: item.title,
                          countPlays: item.countPreviewVideoPlays,
                          imageUrl: item.imageUrl,
                        ),
                      )
                      .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _PopularCoursesListView extends StatelessWidget {
  const _PopularCoursesListView({required this.popularCourses});

  final List<VideoCourse> popularCourses;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 23),
      child: Column(
        children: [
          SubHeader(title: 'Popular Courses', onPressed: () {}),
          const SizedBox(height: 20),
          ListView(
            primary: false,
            shrinkWrap: true,
            children:
                popularCourses.map((course) {
                  final orderItem = OrderHistoryItem(
                    tripType: "Online Course",
                    date: "Recently added",
                    title: course.title,
                    span: "${course.lessons.length} lessons",
                    price: "\$${course.categories ?? 0}",
                  );

                  return OrderHistoryCard(
                    item: orderItem,
                    onOrderAgainPressed: () {
                      // Handle course enrollment
                      print("Enrolling in course: ${course.title}");
                    },
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}

class OrderHistoryCard extends StatelessWidget {
  final OrderHistoryItem item;
  final VoidCallback onOrderAgainPressed;

  const OrderHistoryCard({
    super.key,
    required this.item,
    required this.onOrderAgainPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item.tripType,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[700],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green[50],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Available',
                        style: TextStyle(
                          color: Colors.green[800],
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  item.date,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 16),
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.play_circle_outline,
                      size: 16,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      item.span,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const Spacer(),
                    Text(
                      item.price,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                  child: OutlinedButton(
                    onPressed: onOrderAgainPressed,
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.blue[700]!),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'Enroll Now',
                      style: TextStyle(color: Colors.blue[700]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OrderHistoryItem {
  final String tripType;
  final String date;
  final String title;
  final String span;
  final String price;

  OrderHistoryItem({
    required this.tripType,
    required this.date,
    required this.title,
    required this.span,
    required this.price,
  });
}

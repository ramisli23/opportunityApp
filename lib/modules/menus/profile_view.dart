import 'package:opportunity1/componets/components.dart';
import 'package:flutter/material.dart';
import 'package:opportunity1/models/user/user.dart';
import 'package:opportunity1/dummies/categories_dummy.dart';
import 'package:opportunity1/dummies/video_courses_dummy.dart';
import 'package:opportunity1/models/course/video_course.dart';

class ProfileView extends StatefulWidget {
  static const String routeName = '/profile';

  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final List<Category> categories = [];
  final List<VideoCourse> newCourses = [];
  final List<VideoCourse> popularCourses = [];
  late User user;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final now = DateTime.now();
    final loadedCategories =
        categoriesJSON.map((e) => Category.fromJson(e)).toList();
    final loadedCourses =
        videoCoursesJSON.map((e) => VideoCourse.fromJson(e)).toList();

    setState(() {
      categories
        ..clear()
        ..addAll(loadedCategories);
      newCourses
        ..clear()
        ..addAll(
          loadedCourses.where((e) => now.difference(e.createdAt).inDays < 17),
        );
      popularCourses
        ..clear()
        ..addAll(loadedCourses.where((e) => e.countStudents > 17000));
    });
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        const SizedBox(height: 20),
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.blue.shade100, width: 3),
          ),
          child: ClipOval(
            child: Image.network(
              "https://res.cloudinary.com/ddc5uxyt4/image/upload/v1742724001/5980899898968622203_hsumce.jpg",
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value:
                        loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          categories.isNotEmpty ? categories.first.name : "No categories",
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          categories.isNotEmpty ? categories.first.slug : "",
          style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed:
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UpdateProfileCard()),
              ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
          child: const Text('Edit Profile'),
        ),
        const SizedBox(height: 24),
        const Divider(thickness: 1),
      ],
    );
  }

  Widget _buildProfileItem({
    required String iconPath,
    required String title,
    Color? iconColor,
    Color? textColor,
    VoidCallback? onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
      leading: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Image.asset(
            iconPath,
            width: 24,
            height: 24,
            color: iconColor ?? const Color(0xFF529BFA),
          ),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: textColor ?? Colors.black87,
        ),
      ),
      trailing:
          title == "Logout"
              ? null
              : const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile'), centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              _buildProfileHeader(),
              const SizedBox(height: 8),
              _buildProfileItem(
                iconPath: "assets/icons/png/setting.png",
                title: "Settings",
                onTap: () {},
              ),
              _buildProfileItem(
                iconPath: "assets/icons/png/wallet.png",
                title: "Billing Details",
                onTap: () {},
              ),
              _buildProfileItem(
                iconPath: "assets/icons/png/information.png",
                title: "User Management",
                onTap: () {},
              ),
              _buildProfileItem(
                iconPath: "assets/icons/png/info.png",
                title: "Information",
                onTap: () {},
              ),
              _buildProfileItem(
                iconPath: "assets/icons/png/out.png",
                title: "Logout",
                textColor: Colors.red,
                iconColor: Colors.red,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginCard()),
                  );
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

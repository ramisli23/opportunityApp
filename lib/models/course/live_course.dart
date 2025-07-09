import 'course.dart';
import 'teacher.dart';

class LiveCourse extends Course {
  final String liveStreamingUrl;
  final String liveDuration;
  final DateTime livetime;

  LiveCourse({
    required super.id,
    required super.title,
    required super.description,
    required super.level,
    required super.imageUrl,
    required super.teacher,
    required this.liveStreamingUrl,
    required this.liveDuration,
    required this.livetime,
    super.countStudents = 0,
    required super.createdAt,
  });
  factory LiveCourse.fromJson(Map<String, dynamic> json) {
    return LiveCourse(
      id: int.tryParse(json["id"].toString()) ?? 0,
      title: json["title"],
      description: json["description"],
      level: json["level"],
      imageUrl: json["imageUrl"],
      teacher:
          json["teacher"] != null
              ? Teacher.fromJson(json["teacher"])
              : Teacher.defaultTeacher(),
      liveStreamingUrl: json["liveStreamingUrl"],
      liveDuration: json["liveDuration"],
      countStudents: int.tryParse(json["countStudents"].toString()) ?? 0,
      livetime: DateTime.parse(json["livetime"].toString()),
      createdAt: DateTime.parse(json["createdAt"].toString()).toLocal(),
    );
  }
}

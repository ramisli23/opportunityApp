import 'categories_dummy.dart';
import 'teachers_dummy.dart';
import 'users_dummy.dart';

final videoCoursesJSON = [
  {
    "id": 1,
    "title": "Travel Opoortuntey ",
    "description":
        "Couple having coffee in a campsite.\n\nA young couple drinks coffee during a cool morning in a camping area in the middle of a forest.",
    "imageUrl":
        "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAARMAAAC3CAMAAAAGjUrGAAAA6lBMVEX///8AZjPSEDQAXiOlvK0AZDA0f1YAaDP54ubSAC/VDTQAajPQACHRACrSDTLRACzbADT98/XQACQAYzPPABv65+rPABX0zNLQAB743eG5HzT++frNAAD87vH21dqvLDTutLwTYjPLEDRGVTOnLDSnxLTpnKfzx83UGj3ieojxv8bWKUfmjZnrpK6QODQ7WDMpYTMzXDM6TSmrlpBlSzPYOFLdY3LkhJKhLTSDPzTWOE7cW2zCGTTDbHJXUDOYMjPicYJ4RDOKOzTZSF5QUzOdmIwYXTNrRzNbTzPcT2bKSFpNVzMbWSaqsqW0Sq47AAAHxklEQVR4nO3da1PiSBQGYBJ3N6RzIQSIAQW5DQaIIrsCurIjM87ouJf//3c2ARXlnCaMVekwPef9ZlWmynnq9CXdnTan7EkOfsntTbK2eA6ZwJAJDJnAkAkMmcCQCQyZwJAJDJnAkAkMmcCQCQyZwJAJDJnAkAkMmcCQCQyZwJAJDJnAkAkMmcCQCQyZwJAJDJnAkAkMmcCQCQyZwJAJDJnAkAkMmcCQCQyZwJAJDJnAkAkMmcCQCQyZvI0WhUxecRia0roYj37/47CRLxaPsvaIk62HMro8P6m1meM4ll/2fDaZzprVrGEyBCldXkUajDH1JbZdsEx3OG0Wfz4TzWhdnjjOKw31DYzpTTJkyUZkfN7mgDxH99V+9acxiUSu2HaQVblY1jQbFeEkxsVtQomsU/CmFflNNOVa3VUkjmX1ZDcxxjUnqcnYuq7bUZ5+NCcNmU007Xpbs4nHYZMFwz+jBKprWoWli+6F8ppore6WIimU1Ztw0KisprLFSnUQToOyFbOUb8SOywJJxnNukTCn/dchnL4eVcPAi1isYV5KE6PDHYCZetU5+MD5Bat91bV1T2SnIozkI4+EqecXxrb34mIvUnEH0plEJLxWc3sfvRpvXz8phmXLPZXMxOhwelenNopFEteU6jf+8aEgEjEm2riNlglj15q2eiRxTenMskTN9IWQlPARh7U7xvMzyets+SAQNCQLMTnBSWol7eWZXdYebybpe8QRQGJco50J6yprkt3WqBdiZrTpk2gdtEqcrvaKZMd1+4WQwSd9ErwzYV3jNcmuexmhiC4ldRO85bzpS77D5EjE1C1tEu0eJWm33pLsvOclYk0/bROji7UcZ7RBss1E+NZGyiR4B+tcG5sP8k16whdl0zbByoTV4INck7wndJ0gTsokI3TMAS2Hb3I0tCQzMW6xMrkFLYdv0nd1uUy0Elomm2POFpOBb8tm8gkrk89ImXBMKp6qSmZi1LA6uUDKhGNyV5DNRBtjLecKKxPcJHRV6UzQpvMFKxPl4Ot0sPkuc+rZ8pkg6yZsjj978KF5bE2b9Ve/WpGt9rxkMtFac6RMztGmE7edhVsw1Zv1uZMbS5XPBFuYdvCmE5scDXU1Po5zd7aslp6vSmiCdiech+M+tlFeIbjmTS/fcFUJTbBJLDvBm85q3OmtUFRbd/XAltEE7WI53cnTWDy1YGXJZdJGupNLvDt5MqmrNjQRflQpRRMF62I7W02iKQk06QvbAEzdBF11dNCJ/dokF5rg31hla4YcxPghTUaICViH3TRZvuJsxrbKQf9U2MGcFE2Q6QmbtzhPv5jkXdilLFn8YCHovEWKJh8xk1KSSa7pIiRPLJ6QU+eCTWrJJrkhWigrFv94mH6xpGjy5X110uPVie56atgQ0NmmaIK97iT3Jw2fA+JOQkG7GimajN8z7hSjF0EEpHwncJsnRZN3zU8WoOXYrjc5EzqXTc9E0d4xj22Ceayt9+oJ/4cfyQQ5ZMEetprkLcnfd9D3Ymy/a22ynsTaLzhSvRej6ye1bSazp5cd2zKDl75WKhPtAVlnczgTlNhksOpMopebxaBYea4UuUywl0DnG3c9tqja8due2z9dzsuaMq7HKthJNl6HEpk8upY5nK0XS/quhCboGaV2Cd/z+tA7Hs7eztxXXYpcJtrD7o3n4GsIvj9vmBKa3EMSlXVxE2y/+MyUzkQxsEPlbLz7uYJ4HV8yE7Tx4L0sblIs2LKZKArSePD3QM45pUNTtnNKinGONZ7ud5xnC03ZTLQxeqAN2UfnngW9cyUz4Rx8nMM5Ctek7stmwikUuGvMP0fdlO0cNV4o0cRtE+VnumNKK2FDD5yk7GoiYs0tbRPF+IR+rDK/f9f3O0UZvt+Jgh6SZTXlPd95zWT4fodzShZ86bWbyaOQ/jZ9E8XAZvgxSus7vxs9ujtLHyQn5vti4xZHmY/Xo88OJvXhVABITtA313iXojJ2+fI9bbLJYflOBEhO1H0FLc51MM7Vc6eSaBJ6gai9LyEmcT+Lo7D5t53utWgMfVPYHF+MiaKN8JstVObURlrS/Sf5qWcxGfbQd0SJVLqdrffHVvumpasCLw8SZaJo9zyUqK+tPXDvUxo8upZqqSI3jYWZRG8++JUfKxXn72Zlc456VG9Ofb+gqu6j0MvIxJlEQ/L5lvvZdLM8XISDRrVSr9cr+eppbzHxzXhP3fZmIkUE321oXG697NG2XNMssCAI1ILpu9Zqx9hym2JJRN/32OomXgpqry97jH/yBV/iJ9xE0YzLedItmK9jDpuiRTK4P1YrXe9yo+6yRlyvl8V93cJNolIpfU66eTmObgZhNjeYizdZ3tD9qbZdxbbKk7OsbunOwiRWUTq3UbGgLrYeH8wRfpNu1iZLFmP0udZmy6wsIo1CNBwHd2GGIFmarFha/zycn9Tmbea4ZVcPJtPZWUP0cdi9MlGWfz7E0JRS6+Lf/4p78tcyMjd5Cv1dFSxkAkMmMGQCQyYwZAJDJjBkAkMmMGQCQyYwZAJDJjBkAkMmMGQCQyYwZAJDJjBkAkMmMGQCQyYwZAJDJjBkAkMmMGQCQyYwZAJDJjBkAkMmMGQCQyYwZAJDJjBkAkMmMGQCQyYwZAKzTya/7kn2yeS3fQnvm2vx+R8xWuwmOhFJ3gAAAABJRU5ErkJggg==",
    "previewVideoUrl":
        "https://assets.mixkit.co/videos/preview/mixkit-couple-having-coffee-in-a-campsite-43165-large.mp4",
    "previewVideoDuration": "00:17",
    "level": "Beginner",
    "teacher": teachersJSON.firstWhere((element) => element["id"] == 1),
    "categories": [
      categoriesJSON.firstWhere((element) => element["id"] == 1),
      categoriesJSON.firstWhere((element) => element["id"] == 2),
      categoriesJSON.firstWhere((element) => element["id"] == 3),
      categoriesJSON.firstWhere((element) => element["id"] == 4),
    ],
    "lessons": [
      {
        "id": 1,
        "number": 1,
        "title": "Arriving At The Airport",
        "imageUrl":
            "https://mixkit.imgix.net/videos/preview/mixkit-woman-walking-slowly-towards-a-terminal-27760-0.jpg?q=80&auto=format%2Ccompress&w=1080",
        "videoUrl":
            "https://assets.mixkit.co/videos/preview/mixkit-woman-walking-slowly-towards-a-terminal-27760-large.mp4",
        "videoDuration": "01:24",
        "countVideoPlays": 10000,
        "price": "3000 Dz",
        "progress": 0.3,
      },
      {
        "id": 2,
        "number": 2,
        "title": "Getting To Your Bed",
        "imageUrl":
            "https://mixkit.imgix.net/videos/preview/mixkit-a-mother-with-her-daughter-reading-a-book-together-4583-0.jpg?q=80&auto=format%2Ccompress&w=1080",
        "videoUrl":
            "https://assets.mixkit.co/videos/preview/mixkit-a-mother-with-her-daughter-reading-a-book-together-4583-large.mp4",
        "videoDuration": "01:24",
        "countVideoPlays": 10000,
        "price": "3000 Dz",
        "progress": 0.3,
      },
      {
        "id": 3,
        "number": 3,
        "title": "Checking In",
        "imageUrl":
            "https://mixkit.imgix.net/videos/preview/mixkit-checking-in-at-the-airport-counter-23976-0.jpg?q=80&auto=format%2Ccompress&w=1080",
        "videoUrl":
            "https://assets.mixkit.co/videos/preview/mixkit-checking-in-at-the-airport-counter-23976-large.mp4",
        "videoDuration": "01:24",
        "countVideoPlays": 10000,
        "price": "3000 Dz",
        "progress": 0.3,
      },
      {
        "id": 4,
        "number": 4,
        "title": "Tours & Activities",
        "imageUrl":
            "https://mixkit.imgix.net/videos/preview/mixkit-tour-along-the-coast-4062-0.jpg?q=80&auto=format%2Ccompress&w=1080",
        "videoUrl":
            "https://assets.mixkit.co/videos/preview/mixkit-tour-along-the-coast-4062-large.mp4",
        "videoDuration": "01:24",
        "countVideoPlays": 10000,
        "price": "3000 Dz",
        "progress": 0.3,
      },
      {
        "id": 5,
        "number": 5,
        "title": "Ordering Food & Drinks",
        "imageUrl":
            "https://mixkit.imgix.net/videos/preview/mixkit-couple-having-breakfast-cereal-and-see-their-cell-phones-4857-0.jpg?q=80&auto=format%2Ccompress&w=1080",
        "videoUrl":
            "https://assets.mixkit.co/videos/preview/mixkit-couple-having-breakfast-cereal-and-see-their-cell-phones-4857-large.mp4",
        "videoDuration": "01:24",
        "countVideoPlays": 10000,
        "price": "3000 Dz",
        "progress": 0.3,
      },
    ],
    "comments": [
      {
        "id": 1,
        "text":
            "Contrary to popular belief, Lorem Ipsum is not simply random text.",
        "user": usersJSON.firstWhere(
          (element) => element["uid"] == "qwerty123",
        ),
        "createdAt":
            DateTime.now().subtract(const Duration(days: 40)).toIso8601String(),
      },
      {
        "id": 2,
        "text":
            "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
        "user": usersJSON.firstWhere(
          (element) => element["uid"] == "qwerty456",
        ),
        "createdAt":
            DateTime.now().subtract(const Duration(days: 30)).toIso8601String(),
      },
    ],
    "countStudents": 83227,
    "countPreviewVideoPlays": 357317,
    "createdAt":
        DateTime.now().subtract(const Duration(days: 30)).toIso8601String(),
  },
  {
    "id": 2,
    "title": "Building Your English Brain",
    "description":
        "Creative woman writing ideas on sticky notes for marketing project.\n\nA young couple drinks coffee during a cool morning in a camping area in the middle of a forest.",
    "imageUrl":
        "https://mixkit.imgix.net/videos/preview/mixkit-creative-woman-writing-ideas-on-sticky-notes-for-marketing-project-9124-0.jpg?q=80&auto=format%2Ccompress&w=1080",
    "previewVideoUrl":
        "https://assets.mixkit.co/videos/preview/mixkit-creative-woman-writing-ideas-on-sticky-notes-for-marketing-project-9124-large.mp4",
    "previewVideoDuration": "00:15",
    "level": "Beginner",
    "teacher": teachersJSON.firstWhere((element) => element["id"] == 2),
    "categories": [
      categoriesJSON.firstWhere((element) => element["id"] == 1),
      categoriesJSON.firstWhere((element) => element["id"] == 2),
    ],
    "lessons": [
      {
        "id": 2,
        "number": 1,
        "title": "Building Your Mindset",
        "imageUrl":
            "https://mixkit.imgix.net/videos/preview/mixkit-mother-helps-her-daughter-study-4790-0.jpg?q=80&auto=format%2Ccompress&w=1080",
        "videoUrl":
            "https://assets.mixkit.co/videos/preview/mixkit-mother-helps-her-daughter-study-4790-large.mp4",
        "videoDuration": "01:24",
        "countVideoPlays": 10000,
        "progress": 0.3,
      },
    ],
    "comments": [
      {
        "id": 1,
        "text":
            "Contrary to popular belief, Lorem Ipsum is not simply random text.",
        "user": usersJSON.firstWhere(
          (element) => element["uid"] == "qwerty123",
        ),
        "createdAt":
            DateTime.now().subtract(const Duration(days: 40)).toIso8601String(),
      },
      {
        "id": 2,
        "text":
            "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
        "user": usersJSON.firstWhere(
          (element) => element["uid"] == "qwerty456",
        ),
        "createdAt":
            DateTime.now().subtract(const Duration(days: 30)).toIso8601String(),
      },
    ],
    "countStudents": 53227,
    "countPreviewVideoPlays": 357317,
    "createdAt":
        DateTime.now().subtract(const Duration(days: 30)).toIso8601String(),
  },
  {
    "id": 3,
    "title": "Planning Startegy",
    "description":
        "Team of entrepreneurs at a planning meeting. Creative woman writing ideas on sticky notes for marketing project.\n\nA young couple drinks coffee during a cool morning in a camping area in the middle of a forest.",
    "imageUrl":
        "https://mixkit.imgix.net/videos/preview/mixkit-team-of-entrepreneurs-at-a-planning-meeting-21225-0.jpg?q=80&auto=format%2Ccompress&w=1080",
    "previewVideoUrl":
        "https://assets.mixkit.co/videos/preview/mixkit-team-of-entrepreneurs-at-a-planning-meeting-21225-large.mp4",
    "previewVideoDuration": "00:15",
    "level": "Beginner",
    "teacher": teachersJSON.firstWhere((element) => element["id"] == 1),
    "categories": [
      categoriesJSON.firstWhere((element) => element["id"] == 1),
      categoriesJSON.firstWhere((element) => element["id"] == 4),
    ],
    "lessons": [
      {
        "id": 2,
        "number": 1,
        "title": "Building Your Team",
        "imageUrl":
            "https://mixkit.imgix.net/videos/preview/mixkit-group-of-young-people-talking-about-their-presentation-4788-0.jpg?q=80&auto=format%2Ccompress&w=1080",
        "videoUrl":
            "https://assets.mixkit.co/videos/preview/mixkit-group-of-young-people-talking-about-their-presentation-4788-large.mp4",
        "videoDuration": "01:24",
        "countVideoPlays": 10000,
        "progress": 0.3,
      },
    ],
    "comments": [
      {
        "id": 1,
        "text":
            "Contrary to popular belief, Lorem Ipsum is not simply random text.",
        "user": usersJSON.firstWhere(
          (element) => element["uid"] == "qwerty123",
        ),
        "createdAt":
            DateTime.now().subtract(const Duration(days: 40)).toIso8601String(),
      },
      {
        "id": 2,
        "text":
            "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
        "user": usersJSON.firstWhere(
          (element) => element["uid"] == "qwerty456",
        ),
        "createdAt":
            DateTime.now().subtract(const Duration(days: 30)).toIso8601String(),
      },
    ],
    "countStudents": 33227,
    "countPreviewVideoPlays": 357317,
    "createdAt":
        DateTime.now().subtract(const Duration(days: 30)).toIso8601String(),
  },
  {
    "id": 3,
    "title": "Planning a Meeting",
    "description":
        "Students in a cafeteria discussing an assignment.\n\nYoung students sitting at a table, with cups of coffee, while discussing a task with sheets.",
    "imageUrl":
        "https://mixkit.imgix.net/videos/preview/mixkit-students-in-a-cafeteria-discussing-an-assignment-4794-0.jpg?q=80&auto=format%2Ccompress&w=1080",
    "previewVideoUrl":
        "https://assets.mixkit.co/videos/preview/mixkit-students-in-a-cafeteria-discussing-an-assignment-4794-large.mp4",
    "previewVideoDuration": "00:15",
    "level": "Beginner",
    "teacher": teachersJSON.firstWhere((element) => element["id"] == 2),
    "categories": [
      categoriesJSON.firstWhere((element) => element["id"] == 1),
      categoriesJSON.firstWhere((element) => element["id"] == 4),
    ],
    "lessons": [
      {
        "id": 2,
        "number": 1,
        "title": "Building Your Team",
        "imageUrl":
            "https://mixkit.imgix.net/videos/preview/mixkit-group-of-young-people-talking-about-their-presentation-4788-0.jpg?q=80&auto=format%2Ccompress&w=1080",
        "videoUrl":
            "https://assets.mixkit.co/videos/preview/mixkit-group-of-young-people-talking-about-their-presentation-4788-large.mp4",
        "videoDuration": "01:24",
        "countVideoPlays": 10000,
        "progress": 0.3,
      },
    ],
    "comments": [
      {
        "id": 1,
        "text":
            "Contrary to popular belief, Lorem Ipsum is not simply random text.",
        "user": usersJSON.firstWhere(
          (element) => element["uid"] == "qwerty123",
        ),
        "createdAt":
            DateTime.now().subtract(const Duration(days: 40)).toIso8601String(),
      },
      {
        "id": 2,
        "text":
            "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
        "user": usersJSON.firstWhere(
          (element) => element["uid"] == "qwerty456",
        ),
        "createdAt":
            DateTime.now().subtract(const Duration(days: 30)).toIso8601String(),
      },
    ],
    "countStudents": 205,
    "countPreviewVideoPlays": 71317,
    "createdAt": DateTime.now().toIso8601String(),
  },
  {
    "id": 4,
    "title": "Kids Education",
    "description":
        "Little blond-haired girl studying on a computer, on a table with colors and leaves around it.\n\nA young couple drinks coffee during a cool morning in a camping area in the middle of a forest.",
    "imageUrl":
        "https://mixkit.imgix.net/videos/preview/mixkit-little-girl-studying-on-a-computer-4724-0.jpg?q=80&auto=format%2Ccompress&w=1080",
    "previewVideoUrl":
        "https://assets.mixkit.co/videos/preview/mixkit-little-girl-studying-on-a-computer-4724-large.mp4",
    "previewVideoDuration": "00:15",
    "level": "Beginner",
    "teacher": teachersJSON.firstWhere((element) => element["id"] == 1),
    "categories": [
      categoriesJSON.firstWhere((element) => element["id"] == 1),
      categoriesJSON.firstWhere((element) => element["id"] == 3),
    ],
    "lessons": [
      {
        "id": 2,
        "number": 1,
        "title": "Building Your Family",
        "imageUrl":
            "https://mixkit.imgix.net/videos/preview/mixkit-mother-with-her-happy-daughters-4549-0.jpg?q=80&auto=format%2Ccompress&w=1080",
        "videoUrl":
            "https://assets.mixkit.co/videos/preview/mixkit-mother-with-her-happy-daughters-4549-large.mp4",
        "videoDuration": "01:24",
        "countVideoPlays": 10000,
        "progress": 0.3,
      },
    ],
    "countStudents": 170,
    "countPreviewVideoPlays": 57317,
    "createdAt": DateTime.now().toIso8601String(),
  },
  {
    "id": 5,
    "title": "Learn Basic Grammar",
    "description":
        "Girl doing homework in a library.\n\nYoung woman with headphones, working in a library with a lap top, a notebook and a few books, with a large bookcase in the background.",
    "imageUrl":
        "https://mixkit.imgix.net/videos/preview/mixkit-girl-doing-homework-in-a-library-4531-0.jpg?q=80&auto=format%2Ccompress&w=1080",
    "previewVideoUrl":
        "https://assets.mixkit.co/videos/preview/mixkit-girl-doing-homework-in-a-library-4531-large.mp4",
    "previewVideoDuration": "00:15",
    "level": "Beginner",
    "teacher": teachersJSON.firstWhere((element) => element["id"] == 2),
    "categories": [
      categoriesJSON.firstWhere((element) => element["id"] == 1),
      categoriesJSON.firstWhere((element) => element["id"] == 2),
    ],
    "lessons": [
      {
        "id": 2,
        "number": 1,
        "title": "Building Your Family",
        "imageUrl":
            "https://mixkit.imgix.net/videos/preview/mixkit-mother-with-her-happy-daughters-4549-0.jpg?q=80&auto=format%2Ccompress&w=1080",
        "videoUrl":
            "https://assets.mixkit.co/videos/preview/mixkit-mother-with-her-happy-daughters-4549-large.mp4",
        "videoDuration": "01:24",
        "countVideoPlays": 10000,
        "progress": 0.3,
      },
    ],
    "comments": [
      {
        "id": 1,
        "text":
            "Contrary to popular belief, Lorem Ipsum is not simply random text.",
        "user": usersJSON.firstWhere(
          (element) => element["uid"] == "qwerty123",
        ),
        "createdAt":
            DateTime.now().subtract(const Duration(days: 40)).toIso8601String(),
      },
      {
        "id": 2,
        "text":
            "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
        "user": usersJSON.firstWhere(
          (element) => element["uid"] == "qwerty456",
        ),
        "createdAt":
            DateTime.now().subtract(const Duration(days: 30)).toIso8601String(),
      },
    ],
    "countStudents": 717,
    "countPreviewVideoPlays": 27317,
    "createdAt": DateTime.now().toIso8601String(),
  },
];

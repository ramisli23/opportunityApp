library component;

import 'dart:math' as math;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:opportunity1/models/application/application.dart';
import 'package:lottie/lottie.dart';
import 'package:opportunity1/cores/cores.dart';
import 'package:path/path.dart' as path;

import 'package:opportunity1/componets/cards/Payment_card.dart';
import 'package:opportunity1/models/course/live_course.dart';
//import 'package:opportunity1/models/opportunity/opportunity.dart';
import 'package:badges/badges.dart' as b;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:opportunity1/models/opportunity/opportunity.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:opportunity1/cores/cores.dart';
import 'package:opportunity1/models/course/video_course.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:file_picker/file_picker.dart';

part 'cards/learned_card.dart';
part 'cards/new_course_card.dart';
part 'cards/video_course_card.dart';
part 'cards/video_learning_card.dart';

part 'common/app_buttom_bar.dart';
part 'common/app_pull_refresh.dart';
part 'common/dot_container.dart';
part 'common/sub_header.dart';
part 'common/user_info.dart';

part 'cards/live_course_card.dart';
part 'cards/opportunity_card.dart';
part 'cards/Live_card.dart';
part 'cards/update_profile_card.dart';
part 'cards/Home_oppurtunty_card.dart';
part 'cards/Login_card.dart';

part 'cards/signUp_card.dart';
part 'cards/ApplyFormPage.dart';

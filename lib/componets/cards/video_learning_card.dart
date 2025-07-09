part of component;

class VideoLearningCard extends StatelessWidget {
  final String title;
  final String level;
  final String imageUrl;
  final String videoDuration;
  final String countExercises;
  final int countStudents;
  final int countPlays;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry? padding, margin;

  const VideoLearningCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.countExercises,
    required this.level,
    required this.countStudents,
    required this.countPlays,
    required this.videoDuration,
    required this.onPressed,
    this.padding,
    this.margin,
  });

  String tempsEcoule(String dateString) {
    DateTime date = DateFormat("dd-MM-yyyy HH:mm").parse(dateString);
    DateTime now = DateTime.now();

    // Vérification pour éviter les dates futures
    if (date.isAfter(now)) {
      return "Dans le futur";
    }

    Duration difference = now.difference(date);

    int years = (difference.inDays / 365).floor();
    int months = ((difference.inDays % 365) / 30.44).floor();
    int days = (difference.inDays % 30);
    int hours = difference.inHours;
    int minutes = difference.inMinutes;
    int seconds = difference.inSeconds;

    if (years > 0) {
      return "Il y a $years an${years > 1 ? 's' : ''}";
    } else if (months > 0) {
      return "Il y a $months mois";
    } else if (days > 0) {
      return "Il y a $days jour${days > 1 ? 's' : ''}";
    } else if (hours > 0) {
      return "Il y a $hours h";
    } else if (minutes > 0) {
      return "Il y a $minutes min";
    } else {
      return "Il y a $seconds s";
    }
  }

  @override
  Widget build(BuildContext context) {
    const textGreyStyle = TextStyle(color: AppColors.grey, fontSize: 15);
    const radius = 20.00;

    return Padding(
      padding: margin ?? const EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(radius),
        child: Ink(
          padding: padding,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(radius),
            boxShadow: [BoxShadow(color: Colors.grey[300]!, blurRadius: 1.5)],
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 200.0,
                    width: context.screenWidth,
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      errorWidget: (context, url, error) => const SizedBox(),
                      imageBuilder: (context, assetProvider) {
                        return ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(radius),
                          ),
                          child: FadeInImage(
                            placeholder: MemoryImage(kTransparentImage),
                            image: assetProvider,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.transparent,
                            Colors.transparent,
                            Colors.black.withOpacity(0.1),
                            Colors.black.withOpacity(0.3),
                            Colors.black.withOpacity(0.6),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(17.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Text(
                          "${tempsEcoule(countExercises)} ",

                          style: textGreyStyle,
                        ),
                        const DotContainer(),
                        Text(level, style: textGreyStyle),

                        const DotContainer(),
                        Text(
                          "${countStudents.toAbbreviatedString()} ${countStudents > 1 ? 'Students' : 'Student'}",
                          style: textGreyStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

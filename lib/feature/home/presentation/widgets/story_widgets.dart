import 'package:blog_club/feature/home/data/models/story.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class StoryWidgets extends StatelessWidget {
  const StoryWidgets({
    super.key,
    required this.stories,
    required this.theme,
  });

  final List<Story> stories;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 150,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
          scrollDirection: Axis.horizontal,
          itemCount: stories.length,
          itemBuilder: (context, index) {
            final story = stories[index];
            return _StoryList(story: story, theme: theme);
          }),
    );
  }
}

class _StoryList extends StatelessWidget {
  const _StoryList({
    required this.story,
    required this.theme,
  });

  final Story story;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(4, 0, 4, 0),
      child: Column(
        children: [
          Stack(
            children: [
              story.isViewed
                  ? _profileImageViewed(story, context)
                  : _profileImageNormal(story),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  "assets/img/icons/${story.iconFileName}",
                  height: 24,
                  width: 24,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            story.name,
            style: theme.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}

Widget _profileImage(dynamic story) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(16),
    child: Image.asset(
      "assets/img/stories/${story.imageFileName}",
    ),
  );
}

Widget _profileImageNormal(dynamic story) {
  return Container(
    height: 68,
    width: 68,
    decoration: BoxDecoration(
      gradient: const LinearGradient(begin: Alignment.topLeft, colors: [
        Color(0xff376AED),
        Color(0xff49B0E2),
        Color(0xff9CECFB),
      ]),
      borderRadius: BorderRadius.circular(24),
    ),
    child: Container(
      margin: const EdgeInsets.all(2.5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(4),
      child: _profileImage(story),
    ),
  );
}

Widget _profileImageViewed(dynamic story, BuildContext context) {
  return DottedBorder(
    dashPattern: const [5, 3],
    borderType: BorderType.RRect,
    radius: const Radius.circular(24),
    strokeWidth: 2,
    color: Theme.of(context).textTheme.bodySmall!.color!,
    child: Container(
      height: 68,
      width: 68,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Container(
        margin: const EdgeInsets.all(2.5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(4),
        child: _profileImage(story),
      ),
    ),
  );
}

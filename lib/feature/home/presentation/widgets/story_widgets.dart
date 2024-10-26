import 'package:blog_club/feature/home/data/models/story.dart';
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
          padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
          scrollDirection: Axis.horizontal,
          itemCount: stories.length,
          itemBuilder: (context, index) {
            final story = stories[index];
            return Container(
              margin: const EdgeInsets.fromLTRB(4, 0, 4, 0),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 68,
                        width: 68,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              colors: [
                                Color(0xff376AED),
                                Color(0xff49B0E2),
                                Color(0xff9CECFB),
                              ]),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.all(4),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              "assets/img/stories/${story.imageFileName}",
                            ),
                          ),
                        ),
                      ),
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
          }),
    );
  }
}

import 'package:blog_club/feature/home/data/data.dart';
import 'package:blog_club/feature/home/data/models/story.dart';
import 'package:blog_club/feature/home/presentation/widgets/story_widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final stories = AppDatabase.stories;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hi, Mersad!",
                      style: theme.textTheme.titleSmall,
                    ),
                    Image.asset(
                      'assets/img/icons/notification.png',
                      width: 24,
                      height: 24,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 0, 24),
                child: Text(
                  "Explore today's",
                  style: theme.textTheme.headlineSmall,
                ),
              ),
              StoryWidgets(stories: stories, theme: theme),
            ],
          ),
        ),
      ),
    );
  }
}

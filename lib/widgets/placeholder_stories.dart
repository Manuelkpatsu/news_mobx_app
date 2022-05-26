import 'package:flutter/material.dart';
import 'placeholder_story.dart';

class PlaceholderStories extends StatelessWidget {
  const PlaceholderStories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) => const PlaceholderStory(),
    );
  }
}

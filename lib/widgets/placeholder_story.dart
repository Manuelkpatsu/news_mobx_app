import 'package:flutter/material.dart';

import 'placeholder_container.dart';
import 'text_spacer.dart';

class PlaceholderStory extends StatefulWidget {
  const PlaceholderStory({Key? key}) : super(key: key);

  @override
  State<PlaceholderStory> createState() => _PlaceholderStoryState();
}

class _PlaceholderStoryState extends State<PlaceholderStory>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 0.9).animate(controller);
    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
      child: Row(
        children: [
          const Center(
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Center(
                child: Text(
                  '',
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextSpacer(
                    PlaceholderContainer(
                      child: Text(
                        '',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      animation: animation,
                    ),
                  ),
                  TextSpacer(
                    PlaceholderContainer(
                      child: Text(
                        '',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      animation: animation,
                    ),
                  ),
                  PlaceholderContainer(
                    child: Text(
                      '',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    animation: animation,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/utils/custom_show_alert.dart';
import '../data/model/dady_joke/dady_joke.dart';

class JokeCard extends StatelessWidget {
  final DadyJoke joke;
  final int currentJokeIndex;
  final int totalJokes;

  const JokeCard({
    super.key,
    required this.joke,
    required this.currentJokeIndex,
    required this.totalJokes,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(4),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints.tightFor(width: constraints.maxWidth),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12).copyWith(bottom: 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(joke.content),
                  ),
                  const SizedBox(height: 18),
                  Text('Joke $currentJokeIndex of $totalJokes', style: Get.textTheme.caption),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton.icon(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.zero),
                        ),
                        onPressed: () => showSnackbar(context: context, content: 'Under development'),
                        icon: const Icon(Icons.thumb_up_outlined, size: 16),
                        label: Text('Like', style: Get.textTheme.caption),
                      ),
                      TextButton.icon(
                        onPressed: () => showSnackbar(context: context, content: 'Under development'),
                        icon: const Icon(Icons.thumb_down_outlined, size: 16),
                        label: Text('Dislike', style: Get.textTheme.caption),
                      ),
                      TextButton.icon(
                        onPressed: () => showSnackbar(context: context, content: 'Under development'),
                        icon: const Icon(Icons.favorite_outline, size: 16),
                        label: Text('Favorite', style: Get.textTheme.caption),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

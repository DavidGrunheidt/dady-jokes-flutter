import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/model/dady_joke/dady_joke.dart';

class JokeCard extends StatelessWidget {
  final DadyJoke joke;
  final int currentJokeIndex;

  const JokeCard({
    super.key,
    required this.joke,
    required this.currentJokeIndex,
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
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(joke.content),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Text('Joke $currentJokeIndex', style: Get.textTheme.caption),
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

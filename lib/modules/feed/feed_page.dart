import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global_widgets/joke_card.dart';
import '../main_app_page/main_app_page.dart';
import 'feed_controller.dart';

class FeedPage extends GetView<FeedController> {
  static const route = '${MainAppPage.route}/feed';

  FeedPage({
    super.key,
  }) {
    if (!Get.isRegistered<FeedController>()) {
      Get.put<FeedController>(FeedController());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed'),
        automaticallyImplyLeading: false,
      ),
      body: Obx(
        () => PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: controller.totalJokes.value,
          onPageChanged: controller.onJokeChanged,
          itemBuilder: (context, index) {
            final jokeData = controller.getJokeAtIndex(index);
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Center(
                child: controller.loading.value || jokeData == null
                    ? const CircularProgressIndicator()
                    : JokeCard(
                        joke: jokeData,
                        currentJokeIndex: index + 1,
                      ),
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/custom_show_alert.dart';
import '../../global_widgets/joke_card.dart';
import '../main_app_page/main_app_page.dart';
import 'feed_controller.dart';

class FeedPage extends GetView<FeedController> {
  static const route = '${MainAppPage.route}/feed';

  final _searchTextController = TextEditingController();

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
      body: Stack(
        children: [
          Obx(
            () {
              if (controller.firstLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (!controller.loading.value && controller.noResults.value) {
                return Center(
                  child: Text('Ops... No results found', style: Theme.of(context).textTheme.bodyText1),
                );
              }

              return PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: controller.totalJokesPage.value,
                onPageChanged: (index) => controller.onJokeChanged(index, searchingTerm: _searchTextController.text),
                itemBuilder: (context, index) {
                  if (controller.showNoMoreContentMsg(index)) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Ops... No more content here.', style: Get.textTheme.bodyText2),
                          Text(
                            'Search again for more jokes',
                            style: Get.textTheme.caption,
                          ),
                        ],
                      ),
                    );
                  }

                  final jokeData = controller.getJokeAtIndex(index);
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Center(
                      child: controller.loading.value || jokeData == null
                          ? const CircularProgressIndicator()
                          : JokeCard(
                              joke: jokeData,
                              currentJokeIndex: index + 1,
                              totalJokes: controller.totalJokesAll.value,
                            ),
                    ),
                  );
                },
              );
            },
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: AnimSearchBar(
                width: Get.width,
                textController: _searchTextController,
                rtl: true,
                autoFocus: true,
                closeSearchOnSuffixTap: true,
                suffixIcon: const Icon(Icons.search_outlined),
                onSuffixTap: () {
                  final term = _searchTextController.text;
                  if (term.length < 3) {
                    return showSnackbar(context: context, content: 'Please type three or more characters');
                  }

                  controller.loadJokes(term: term);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

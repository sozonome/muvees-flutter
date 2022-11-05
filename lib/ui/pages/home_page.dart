import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muvees/core/models/api/tmdb/movie/movie_list.dart';
import 'package:muvees/core/page_models/home_page_model.dart';
import 'package:muvees/core/services/api/tmdb/fetchers.dart';
import 'package:muvees/ui/page_model_consumer.dart';

class MyHomePageParams {
  const MyHomePageParams({
    this.title = '',
    this.isDeepLink = false,
  });

  final String title;
  final bool isDeepLink;
}

final StateNotifierProvider<HomePageModel, HomePageState> homePageModel =
    StateNotifierProvider<HomePageModel, HomePageState>(
  (StateNotifierProviderRef<HomePageModel, HomePageState> ref) {
    return HomePageModel(
      movieApi: ref.read(movieApiProvider),
    );
  },
);

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    required this.params,
    Key? key,
  }) : super(key: key);

  final MyHomePageParams params;

  @override
  Widget build(BuildContext context) {
    return PageModelConsumer<HomePageModel, HomePageState>(
      pageModel: homePageModel,
      onModelReady: (HomePageModel model) async {
        await model.initPageModel();
      },
      builder: (
        BuildContext context,
        HomePageState state,
        HomePageModel notifier,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('muvees'),
          ),
          body: notifier.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Text'),
                      Expanded(
                        child: GridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          shrinkWrap: true,
                          children: List<Widget>.generate(
                            state.items.length,
                            (int index) {
                              return Container(
                                padding: const EdgeInsets.all(4),
                                child: Text(
                                  state.items[index].title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
        );
      },
    );
  }

  // void _navigate({
  //   required BuildContext context,
  // }) {
  //   context.go(
  //     AppRoute.home,
  //     extra: const MyHomePageParams(isDeepLink: false, title: 'Hello'),
  //   );
  // }
}

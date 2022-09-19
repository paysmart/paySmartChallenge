import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:pay_smart_challenge/application/modules/movie_home/widgets/movie_card.dart';
import 'package:pay_smart_challenge/application/shared/ui/widgets/custom_text_form_field.dart';
import 'package:pay_smart_challenge/application/shared/ui/widgets/custom_title.dart';
import 'movie_home_vm.dart';

class MovieHomePage extends GetView<MovieHomeControllerVM> {
  const MovieHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFormField(
              onChanged: (value) {
                controller.filterMoviesByName(value);
              },
            ),
            const CustomTitle(title: 'Lançamentos'),
            Expanded(
              child: Obx(
                () {
                  return controller.searching
                      ? const Center(
                          child: Text('Filme não encontrado!'),
                        )
                      : controller.upcomingMoviesList.isNotEmpty
                          ? LazyLoadScrollView(
                              onEndOfPage: () => controller.nextPage(),
                              isLoading: controller.lastPage,
                              child: GridView.builder(
                                addAutomaticKeepAlives: true,
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                padding: EdgeInsets.zero,
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 120,
                                  childAspectRatio: 0.59,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 40,
                                ),
                                itemCount: controller.upcomingMoviesList.length,
                                itemBuilder: (context, index) {
                                  var movie =
                                      controller.upcomingMoviesList[index];
                                  return MovieCard(
                                    movie: movie,
                                  );
                                },
                              ),
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
                            );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

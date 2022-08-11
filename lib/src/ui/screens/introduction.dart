import 'package:beer_distribution_game/src/config/beerroutes.dart';
import 'package:beer_distribution_game/src/providers.dart';
import 'package:beer_distribution_game/src/ui/screens/base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IntroductionPageItem {
  IntroductionPageItem({
    required this.title,
    required this.description,
    required this.image,
  });
  final String title;
  final String description;
  final String image;
}

class IntroductionScreen extends ConsumerStatefulWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends ConsumerState<IntroductionScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    // TODO(freek): add images and styling for introduction pages
    var translation = AppLocalizations.of(context)!;
    var introductionPages = [
      IntroductionPageItem(
        title: translation.introduction_page_1_title,
        description: translation.introduction_page_1_body,
        image: '',
      ),
      IntroductionPageItem(
        title: translation.introduction_page_2_title,
        description: translation.introduction_page_2_body,
        image: '',
      ),
      IntroductionPageItem(
        title: translation.introduction_page_3_title,
        description: translation.introduction_page_3_body,
        image: '',
      ),
      IntroductionPageItem(
        title: translation.introduction_page_4_title,
        description: translation.introduction_page_4_body,
        image: '',
      ),
      IntroductionPageItem(
        title: translation.introduction_page_5_title,
        description: translation.introduction_page_5_body,
        image: '',
      ),
      IntroductionPageItem(
        title: translation.introduction_page_6_title,
        description: translation.introduction_page_6_body,
        image: '',
      ),
      IntroductionPageItem(
        title: translation.introduction_page_7_title,
        description: translation.introduction_page_7_body,
        image: '',
      ),
      IntroductionPageItem(
        title: translation.introduction_page_8_title,
        description: translation.introduction_page_8_body,
        image: '',
      ),
    ];
    return BaseScreen(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onHorizontalDragEnd: (details) {
          if (_currentPage == introductionPages.length - 1) {
            if (details.primaryVelocity! < -500) {
              finishIntroduction(context);
            } else if (details.primaryVelocity! > 500) {
              _pageController.previousPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            }
          }
        },
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                physics: (_currentPage == introductionPages.length - 1)
                    ? NeverScrollableScrollPhysics()
                    : AlwaysScrollableScrollPhysics(),
                onPageChanged: (value) => setState(() => _currentPage = value),
                itemBuilder: (context, index) {
                  var introductionPage = introductionPages[index];
                  return Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          width: double.infinity,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                introductionPage.title,
                                style: Theme.of(context).textTheme.headline3,
                              ),
                              Text(
                                introductionPage.description,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              Spacer(),
                              // show page indicator
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
                itemCount: introductionPages.length,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                introductionPages.length,
                buildDot,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentPage > 0) ...[
                  GestureDetector(
                    onTap: () {
                      _pageController.previousPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                      setState(() {
                        _currentPage--;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(),
                      width: 100,
                      height: 50,
                      child: Center(
                        child: Text(translation.buttonPrevious),
                      ),
                    ),
                  ),
                ] else ...[
                  SizedBox(
                    width: 100,
                    height: 50,
                  ),
                ],
                GestureDetector(
                  onTap: () {
                    if (_currentPage == introductionPages.length - 1) {
                      finishIntroduction(context);
                    } else {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                      setState(() {
                        _currentPage++;
                      });
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(),
                    width: 100,
                    height: 50,
                    child: Center(
                      child: Text(translation.buttonNext),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void finishIntroduction(BuildContext context) {
    var updatedSettings = ref.read(applicationConfigProvider).copyWith(
          introductionFinished: true,
        );
    ref
        .read(applicationConfigProvider.notifier)
        .saveApplicationSettings(updatedSettings);
    Navigator.of(context).pushReplacementNamed(BeerRoute.homeScreen.route);
  }

  Widget buildDot(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      height: 10,
      width: (index == _currentPage) ? 20 : 10,
      decoration: BoxDecoration(
        color: (index == _currentPage) ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}

// TODO(freek): different layout for mobile and desktop

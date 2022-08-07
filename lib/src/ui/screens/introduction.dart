import 'package:beer_distribution_game/src/config/beerroutes.dart';
import 'package:beer_distribution_game/src/providers.dart';
import 'package:beer_distribution_game/src/ui/screens/base.dart';
import 'package:flutter/material.dart';

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
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    var introductionPages = [
      IntroductionPageItem(
        title: 'Welcome',
        description: 'This is the introduction for the beer distribution game, '
            'you can swipe through the different pages',
        image: '',
      ),
      IntroductionPageItem(
        title: 'Whiplash effect',
        description: '',
        image: '',
      ),
      IntroductionPageItem(
        title: 'Programming agents',
        description: 'You can program your own agents to play the game',
        image: '',
      ),
      IntroductionPageItem(
        title: 'Online Multiplayer',
        description: '',
        image: '',
      ),
      IntroductionPageItem(
        title: 'Creating custom games',
        description: '',
        image: '',
      ),
      IntroductionPageItem(
        title: 'Replaying previous games',
        description: '',
        image: '',
      ),
    ];
    return BaseScreen(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onHorizontalDragEnd: (details) {
          if (_currentPage == introductionPages.length - 1) {
            if (details.primaryVelocity! < -500) {
              var updatedSettings =
                  ref.read(applicationConfigProvider).copyWith(
                        introductionFinished: true,
                      );
              ref
                  .read(applicationConfigProvider.notifier)
                  .saveApplicationSettings(updatedSettings);
              Navigator.of(context)
                  .pushReplacementNamed(BeerRoute.homeScreen.route);
            } else if (details.primaryVelocity! > 500) {
              _pageController.previousPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            }
          }
        },
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
                        Text(
                          'Page $index',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Spacer(),
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
                                    child: Text('Back'),
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
                                  _pageController.nextPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                  );
                                  setState(() {
                                    _currentPage++;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(),
                                  width: 100,
                                  height: 50,
                                  child: Center(
                                    child: Text('Next'),
                                  ),
                                ),
                              )
                          ],
                        ),
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
    );
  }
}

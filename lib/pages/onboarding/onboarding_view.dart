import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todo/core/app_colors.dart';
import 'package:todo/pages/home/home_view.dart';
import 'package:todo/pages/onboarding/Onboarding_items.dart';

class OnboardingView extends StatefulWidget {
  OnboardingView({super.key});

  static String routeName = "OnboardingOneScreen";

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final controller = OnboardingItems();

  final pageController = PageController();

  bool lastPage = false;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Scaffold(
      body: Expanded(
        child: PageView.builder(
          itemCount: controller.items.length,
          controller: pageController,
          onPageChanged: (value) {
            setState(() {});
            lastPage = controller.items.length - 1 == value;
          },
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                  top: mediaQuery.height * 0.07,
                  left: 15,
                  right: 15,
                  bottom: mediaQuery.height * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  index != 2
                      ? Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                              onPressed: () {
                                pageController
                                    .jumpToPage(controller.items.length - 1);
                              },
                              child: Text(
                                "SKIP",
                                style: theme.textTheme.titleSmall?.copyWith(
                                  color: whiteColor.withOpacity(.44),
                                ),
                              )),
                        )
                      : SizedBox(height: mediaQuery.height * 0.1),
                  Padding(
                    padding: EdgeInsets.only(top: mediaQuery.height * 0.01),
                  ),
                  Image.asset(controller.items[index].image),
                  SizedBox(height: mediaQuery.height * 0.01),
                  SmoothPageIndicator(
                      controller: pageController, // PageController
                      count: controller.items.length,
                      effect: const SlideEffect(
                          spacing: 8.0,
                          radius: 2.0,
                          dotWidth: 26.28,
                          dotHeight: 5.0,
                          //paintStyle:  PaintingStyle.stroke,
                          strokeWidth: 1.5,
                          //dotColor:  Colors.grey,
                          activeDotColor: iconColorBlue),
                      // your preferred effect
                      onDotClicked: (index) {
                        pageController.animateToPage(index,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      }),
                  SizedBox(height: mediaQuery.height * 0.03),
                  Text(
                    controller.items[index].title,
                    style: theme.textTheme.titleLarge,
                  ),
                  SizedBox(height: mediaQuery.height * 0.02),
                  Text(
                    controller.items[index].description,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleSmall,
                  ),
                  SizedBox(
                    height: mediaQuery.height * 0.1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // back button
                      index != 0
                          ? TextButton(
                              onPressed: () {
                                setState(() {});
                                pageController.previousPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.fastLinearToSlowEaseIn);
                              },
                              child: Text("BACK",
                                  style: theme.textTheme.titleSmall?.copyWith(
                                    color: whiteColor.withOpacity(.44),
                                  )))
                          : Container(),
                      index != 2
                          ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: iconColorBlue,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 13),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)),
                              ),
                              onPressed: () {
                                setState(() {});
                                pageController.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.fastLinearToSlowEaseIn);
                              },
                              child: Text(
                                "NEXT",
                                style: theme.textTheme.titleSmall,
                              ))
                          : ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: iconColorBlue,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 13),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4))),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => HomeView()));
                              },
                              child: Text(
                                "Get Started",
                                style: theme.textTheme.titleSmall,
                              )),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

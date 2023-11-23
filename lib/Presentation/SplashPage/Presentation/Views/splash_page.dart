import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../../../Animation/slide_animation.dart';
import '../../../../core/Colors/app_colors.dart';
import '../../../../core/Images/app_assets.dart';
import '../../../App/Presentaion/Views/app_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double value1 = 40;
  double value2 = 40;
  double value3 = 40;
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 2),
      () {
        Navigator.of(context).pushReplacement(SlideToPage(page: AppPage()));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          value1 = MediaQuery.of(context).size.width / 3;
          value2 = MediaQuery.of(context).size.height / 2.4 + 10;
          value3 = MediaQuery.of(context).size.height / 3;
        });
      }
    });
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              duration: Duration(seconds: 1),
              left: value1,
              top: value2,
              child: AnimatedContainer(
                transform: Matrix4.translationValues(0, 0, value1),
                duration: Duration(milliseconds: 500),
                child:
                    buildImage(context: context, image: Assets.imagesBgTopLeft),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(seconds: 1),
              right: value1,
              top: value2,
              child: AnimatedContainer(
                transform: Matrix4.translationValues(0, 0, value1),
                duration: Duration(milliseconds: 500),
                child: buildImage(
                    context: context, image: Assets.imagesPgTopRight),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(seconds: 1),
              bottom: value3,
              left: value1,
              child: AnimatedContainer(
                transform: Matrix4.translationValues(0, 0, value1),
                duration: Duration(milliseconds: 500),
                child: buildImage(
                    context: context, image: Assets.imagesBgBottomLeft),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(seconds: 1),
              bottom: value3,
              right: value1,
              child: AnimatedContainer(
                transform: Matrix4.translationValues(0, 0, value1),
                duration: Duration(milliseconds: 500),
                child: buildImage(
                    context: context, image: Assets.imagesBgBottomRight),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedTextKit(
                  isRepeatingAnimation: false,
                  animatedTexts: [
                    ColorizeAnimatedText(
                      'Welcome To Eaalim',
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                      colors: [
                        AppColors.background,
                        AppColors.background,
                        AppColors.text,
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildImage({required BuildContext context, required String image}) {
  return Container(
    width: MediaQuery.of(context).size.width / 6,
    height: MediaQuery.of(context).size.height / 6,
    child: Image.asset(image),
  );
}

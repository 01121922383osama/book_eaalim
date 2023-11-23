import '../../../../../core/Images/app_assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../Animation/slide_animation.dart';
import '../../../../Books/Presentation/Views/books_page.dart';
import '../view_pdf_page.dart';

class CustomBodyHomePage extends StatelessWidget {
  const CustomBodyHomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.6,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(SlideFromRight(page: ViewPdfPage()));
            },
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: CachedNetworkImage(
                imageUrl: booksImages[index],
                imageBuilder: (context, imageProvider) => Container(
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FittedBox(
                      child: Text(
                        'The BookName',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          shadows: [
                            Shadow(
                              color: Colors.grey,
                              offset: Offset(0, 1),
                            ),
                            Shadow(
                              color: Colors.grey,
                              offset: Offset(1, 0),
                            ),
                            Shadow(
                              color: Colors.grey,
                              offset: Offset(0, -1),
                            ),
                            Shadow(
                              color: Colors.grey,
                              offset: Offset(-1, 0),
                            ),
                          ],
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ).animate().fadeIn(
                        duration: Duration(seconds: 1),
                      ),
                ),
                placeholder: (context, url) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        Assets.imagesBgwhite,
                      ),
                    ),
                  ),
                )
                    .animate(
                      autoPlay: true,
                      onComplete: (controller) {
                        controller.repeat();
                      },
                    )
                    .shimmer(duration: Duration(seconds: 1)),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ).animate().shimmer(),
            ),
          );
        },
        childCount: booksImages.length,
      ),
    );
  }
}

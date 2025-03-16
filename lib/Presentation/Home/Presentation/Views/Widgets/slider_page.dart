import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart' as anim;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/Images/app_assets.dart';
import '../../Manager/IndexSliders/indexslider_cubit.dart';

class SliderWidgetHomePage extends StatelessWidget {
  const SliderWidgetHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<IndexsliderCubit, IndexsliderState>(
        builder: (context, state) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 200.0,
              child: CarouselView(
                controller: CarouselController(
                  initialItem: state.index,
                ),
                itemExtent: 10000,
                children: List.generate(
                    4,
                    (index) => anim.Animate(
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 10),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              // image: DecorationImage(
                              //   fit: BoxFit.fill,
                              //   image: NetworkImage(imagesSliders[index]),
                              // ),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: imagesSliders[index],
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 10),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
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
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                        )
                            .animate(
                              autoPlay: true,
                              onComplete: (controller) {
                                controller.repeat();
                              },
                            )
                            .shimmer(duration: Duration(seconds: 3))).toList(),
              ),
            ),
            AnimatedSmoothIndicator(
              activeIndex: state.index,
              count: 4, // Set this to the number of items in your carousel
              axisDirection: Axis.horizontal,
              effect: SlideEffect(
                spacing: 8.0,
                dotWidth: 15,
                dotHeight: 15,
                paintStyle: PaintingStyle.fill,
                strokeWidth: 1.5,
                dotColor: Colors.grey,
                activeDotColor: Colors.red.withOpacity(0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> imagesSliders = [
  'https://imgs.search.brave.com/E5AjwmscUkTKY6AG4t_1pzjEmnKa9DDnAkeXevab2Jw/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMuY3RmYXNzZXRz/Lm5ldC9ocmx0eDEy/cGw4aHEvNTU5Nnoy/QkNSOUttVDFLZVJC/ck9RYS80MDcwZmQ0/ZTJmMWExM2Y3MWMy/YzQ2YWZlYjE4ZTQx/Yy9zaHV0dGVyc3Rv/Y2tfNDUxMDc3MDQz/LWhlcm8xLmpwZz9m/aXQ9ZmlsbCZ3PTYw/MCZoPTQwMA',
  'https://imgs.search.brave.com/NbITOffqy7rRYIZjY8xSzn-O2mF32p972xlQUoJLDkI/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9idXJz/dC5zaG9waWZ5Y2Ru/LmNvbS9waG90b3Mv/bGVuc2JhbGwteWVs/bG93LWFuZC1vcmFu/Z2UtbGlnaHRzLmpw/Zz93aWR0aD0xMDAw/JmZvcm1hdD1wanBn/JmV4aWY9MCZpcHRj/PTA',
  'https://imgs.search.brave.com/95hznLoDaAEo4KneXq8vOkJrIDbmJfQQvZL9SDlF9i0/rs:fit:860:0:0/g:ce/aHR0cHM6Ly93d3cu/aXN0b2NrcGhvdG8u/Y29tL3Jlc291cmNl/cy9pbWFnZXMvUGhv/dG9GVExQL1AzLU5P/Vi1pU3RvY2stMTQ4/MTQ2ODEwMy5qcGc',
  'https://imgs.search.brave.com/uw8p89Rbd-jzs_GNn7GWZvWVriXgGmdrMOlIc5-erLU/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMudW5zcGxhc2gu/Y29tL3Bob3RvLTE2/OTM1MjA5OTk2MzEt/NmFjMTQ1YzFkZDE1/P2F1dG89Zm9ybWF0/JmZpdD1jcm9wJnE9/ODAmdz0xMDAwJml4/bGliPXJiLTQuMC4z/Jml4aWQ9TTN3eE1q/QTNmREI4TUh4bGVI/QnNiM0psTFdabFpX/UjhNVFo4Zkh4bGJu/d3dmSHg4Zkh3PQ',
];

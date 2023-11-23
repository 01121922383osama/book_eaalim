import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart' as anim;
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderWidgetHomePage extends StatefulWidget {
  const SliderWidgetHomePage({super.key});

  @override
  State<SliderWidgetHomePage> createState() => _SliderWidgetHomePageState();
}

class _SliderWidgetHomePageState extends State<SliderWidgetHomePage> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height / 3.5,
              autoPlay: true,
              autoPlayAnimationDuration: const Duration(seconds: 3),
              autoPlayCurve: Curves.easeInOut,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  currentPage = index;
                });
              },
            ),
            items: [
              anim.Animate(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(image1),
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
                  .shimmer(duration: Duration(seconds: 3)),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(image2),
                  ),
                ),
              )
                  .animate(
                    autoPlay: true,
                    onComplete: (controller) {
                      controller.repeat();
                    },
                  )
                  .shimmer(duration: Duration(seconds: 3)),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(image3),
                  ),
                ),
              )
                  .animate(
                    autoPlay: true,
                    onComplete: (controller) {
                      controller.repeat();
                    },
                  )
                  .shimmer(duration: Duration(seconds: 3)),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(image4),
                  ),
                ),
              )
                  .animate(
                    autoPlay: true,
                    onComplete: (controller) {
                      controller.repeat();
                    },
                  )
                  .shimmer(duration: Duration(seconds: 3)),
            ],
          ),
          AnimatedSmoothIndicator(
            activeIndex: currentPage,
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
    );
  }
}

const image1 =
    'https://imgs.search.brave.com/E5AjwmscUkTKY6AG4t_1pzjEmnKa9DDnAkeXevab2Jw/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMuY3RmYXNzZXRz/Lm5ldC9ocmx0eDEy/cGw4aHEvNTU5Nnoy/QkNSOUttVDFLZVJC/ck9RYS80MDcwZmQ0/ZTJmMWExM2Y3MWMy/YzQ2YWZlYjE4ZTQx/Yy9zaHV0dGVyc3Rv/Y2tfNDUxMDc3MDQz/LWhlcm8xLmpwZz9m/aXQ9ZmlsbCZ3PTYw/MCZoPTQwMA';
const image2 =
    'https://imgs.search.brave.com/NbITOffqy7rRYIZjY8xSzn-O2mF32p972xlQUoJLDkI/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9idXJz/dC5zaG9waWZ5Y2Ru/LmNvbS9waG90b3Mv/bGVuc2JhbGwteWVs/bG93LWFuZC1vcmFu/Z2UtbGlnaHRzLmpw/Zz93aWR0aD0xMDAw/JmZvcm1hdD1wanBn/JmV4aWY9MCZpcHRj/PTA';
const image3 =
    'https://imgs.search.brave.com/95hznLoDaAEo4KneXq8vOkJrIDbmJfQQvZL9SDlF9i0/rs:fit:860:0:0/g:ce/aHR0cHM6Ly93d3cu/aXN0b2NrcGhvdG8u/Y29tL3Jlc291cmNl/cy9pbWFnZXMvUGhv/dG9GVExQL1AzLU5P/Vi1pU3RvY2stMTQ4/MTQ2ODEwMy5qcGc';
const image4 =
    'https://imgs.search.brave.com/uw8p89Rbd-jzs_GNn7GWZvWVriXgGmdrMOlIc5-erLU/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMudW5zcGxhc2gu/Y29tL3Bob3RvLTE2/OTM1MjA5OTk2MzEt/NmFjMTQ1YzFkZDE1/P2F1dG89Zm9ybWF0/JmZpdD1jcm9wJnE9/ODAmdz0xMDAwJml4/bGliPXJiLTQuMC4z/Jml4aWQ9TTN3eE1q/QTNmREI4TUh4bGVI/QnNiM0psTFdabFpX/UjhNVFo4Zkh4bGJu/d3dmSHg4Zkh3PQ';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/Colors/app_colors.dart';
import '../../../../glopal.dart';

class BooksPage extends StatelessWidget {
  const BooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: AppColors.bg100,
      color: AppColors.text,
      displacement: MediaQuery.of(context).size.height / 6,
      notificationPredicate: (notification) {
        notification.dispatch(context);
        return true;
      },
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 2));
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(
              Icons.menu,
              color: Global.storageService.getBoolain()
                  ? Colors.black
                  : Colors.black,
              shadows: [
                Shadow(
                  color: Colors.white,
                  offset: Offset(0, 1),
                ),
                Shadow(
                  color: Colors.white,
                  offset: Offset(1, 0),
                ),
              ],
            ),
          ),
          title: const Text(
            'Books',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              shadows: [
                Shadow(
                  color: Colors.white,
                  offset: Offset(0, 1),
                ),
                Shadow(
                  color: Colors.white,
                  offset: Offset(1, 0),
                ),
                Shadow(
                  color: Colors.white,
                  offset: Offset(0, -1),
                ),
                Shadow(
                  color: Colors.white,
                  offset: Offset(-1, 0),
                ),
              ],
            ),
          ),
        ),
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (notification) {
            notification.disallowIndicator();
            return true;
          },
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.6,
            ),
            itemCount: booksImages.length,
            itemBuilder: (context, index) {
              return Padding(
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
                      child: Text(
                        'The BookName',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          shadows: [
                            Shadow(
                              color: Colors.indigoAccent,
                              offset: Offset(0, 1),
                            ),
                            Shadow(
                              color: Colors.indigoAccent,
                              offset: Offset(1, 0),
                            ),
                            Shadow(
                              color: Colors.indigoAccent,
                              offset: Offset(0, -1),
                            ),
                            Shadow(
                              color: Colors.indigoAccent,
                              offset: Offset(-1, 0),
                            ),
                          ],
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ).animate().shimmer(),
              );
            },
          ),
        ),
      ),
    );
  }
}

List<String> booksName = [
  "To Kill a Mockingbird",
  "The Great Gatsby",
  "Pride and Prejudice",
  "The Catcher in the Rye",
  "Harry Potter",
  "Sorcerer's Stone",
  "The Lord of the Rings",
  "The Hunger Games",
  "The Da Vinci Code",
  "The Alchemist",
  "The Shining",
  "Moby-Dick",
  "The Odyssey",
  "Brave New World",
  "War and Peace",
  "The Road",
  "Fahrenheit 451",
  "The Grapes of Wrath",
  "The Giver",
  "Iron Man",
];
List<String> booksImages = [
  'https://cdn.pixabay.com/photo/2015/06/30/08/07/lens-826308_1280.jpg',
  'https://cdn.pixabay.com/photo/2019/10/17/21/17/joker-4557864_1280.jpg',
  'https://cdn.pixabay.com/photo/2018/07/06/19/48/charles-chaplin-3521070_1280.jpg',
  'https://cdn.pixabay.com/photo/2023/04/06/09/39/camera-7903435_1280.jpg',
  'https://cdn.pixabay.com/photo/2016/01/13/22/54/man-1139066_1280.jpg',
  'https://cdn.pixabay.com/photo/2017/09/16/08/56/photography-2754902_1280.jpg',
  'https://cdn.pixabay.com/photo/2012/11/04/08/23/cinema-strip-64074_1280.jpg',
  'https://cdn.pixabay.com/photo/2018/10/26/11/14/man-3774381_1280.jpg',
  'https://cdn.pixabay.com/photo/2012/08/27/22/59/movie-projector-55122_1280.png',
  'https://cdn.pixabay.com/photo/2014/11/30/17/15/theater-551797_1280.jpg',
  'https://cdn.pixabay.com/photo/2017/09/16/08/56/photography-2754902_1280.jpg',
  'https://cdn.pixabay.com/photo/2018/01/03/01/17/film-3057394_1280.jpg',
  'https://cdn.pixabay.com/photo/2017/02/23/21/35/cinema-2093264_1280.jpg',
  'https://cdn.pixabay.com/photo/2020/06/29/21/13/city-5354477_1280.jpg',
  'https://cdn.pixabay.com/photo/2017/09/16/08/56/photography-2754902_1280.jpg',
  'https://cdn.pixabay.com/photo/2013/09/29/12/21/camera-188083_1280.jpg',
  'https://cdn.pixabay.com/photo/2016/11/21/22/08/white-male-1847732_1280.jpg',
  'https://cdn.pixabay.com/photo/2013/09/29/12/21/camera-188083_1280.jpg',
  'https://cdn.pixabay.com/photo/2014/04/09/17/48/man-320276_1280.png',
  'https://cdn.pixabay.com/photo/2019/10/17/09/18/cartoon-4556429_1280.png',
];

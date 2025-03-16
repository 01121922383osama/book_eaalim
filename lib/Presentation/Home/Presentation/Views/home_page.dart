import 'package:flutter/material.dart';

import '../../../../core/Colors/app_colors.dart';
import 'Widgets/costtom_appbar_widget.dart';
import 'Widgets/custom_body_home_page.dart';
import 'Widgets/slider_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (notification) {
        notification.disallowIndicator();
        return true;
      },
      child: RefreshIndicator(
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
        child: const CustomScrollView(
          slivers: [
            CosttomAppBarWidget(),
            SliderWidgetHomePage(),
            CustomBodyHomePage(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rick_morty/pages/home_page.dart';
import 'package:rick_morty/theme/app_images.dart';

import '../theme/app_colors.dart';

PreferredSizeWidget appBarComponent(
  BuildContext context, {
  bool isSecondPage = false,
}) {
  return AppBar(
    toolbarHeight: kToolbarHeight * 2.2,
    backgroundColor: AppColors.appBarColor,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    leading: Align(
      alignment: Alignment.topCenter,
      child: GestureDetector(
        onTap: () {
          final currentRoute = ModalRoute.of(context)?.settings.name;
          if (currentRoute == HomePage.routeId) return;
          Navigator.pop(context);
        },
        child: Icon(
          isSecondPage ? Icons.arrow_back : Icons.menu,
          color: AppColors.whiteOff,
        ),
      ),
    ),
    actions: [
      Container(
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.only(right: 16),
        child: Image.asset(AppImages.icon, height: 26),
      ),
    ],
    flexibleSpace: SafeArea(
      child: Column(
        children: [
          Image.asset(AppImages.logo),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              "RICK AND MORTY API",
              style: TextStyle(
                fontSize: 14.5,
                fontWeight: FontWeight.w400,
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:fos7a/data/models/category_model.dart';
import 'package:fos7a/presentation/page/home/inner_screen/info/category_page.dart';
import 'package:fos7a/presentation/widget/center_text.dart';
import 'package:fos7a/presentation/widget/global_methods.dart';
import 'package:fos7a/provider/home_provider.dart';
import 'package:fos7a/provider/setting_provider.dart';
import 'package:provider/provider.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel categoryModel;
  CategoryItem({Key? key, required this.categoryModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var settingProvider = Provider.of<SettingProvider>(context);
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, _) {
        return GestureDetector(
          onTap: () {
            homeProvider.findPlaceByGovAndCategory(categoryModel.id);
            GlobalMethods().navigateTo(
                context,
                CategoryPage(
                  categoryName: settingProvider.lang.toLowerCase() ==
                          'English'.toLowerCase()
                      ? categoryModel.titleEn
                      : categoryModel.titleAr,
                ));
          },
          child: Container(
            width: size.width * .5,
            height: size.height * .3,
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            decoration: BoxDecoration(
              // color: passedColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(children: [
              // Container for the image
              Flexible(
                fit: FlexFit.tight,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
                    height: size.height * 25,
                    child: Image.asset(
                      categoryModel.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // Category name
              CenterText(
                  title: settingProvider.lang.toLowerCase() ==
                          'English'.toLowerCase()
                      ? categoryModel.titleEn
                      : categoryModel.titleAr),
            ]),
          ),
        );
      },
    );
  }
}

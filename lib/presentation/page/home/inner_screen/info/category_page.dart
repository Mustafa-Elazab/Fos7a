// ignore_for_file: must_be_immutable

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:fos7a/constnats/theme.dart';
import 'package:fos7a/constnats/utils.dart';
import 'package:fos7a/data/models/place_model.dart';
import 'package:fos7a/presentation/page/home/inner_screen/info/place_info.dart';
import 'package:fos7a/presentation/widget/center_text.dart';
import 'package:fos7a/presentation/widget/custom_text.dart';
import 'package:fos7a/presentation/widget/global_methods.dart';
import 'package:fos7a/provider/home_provider.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  String categoryName;
  CategoryPage({Key? key, required this.categoryName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomeProvider>(context);
    List<PlaceModel> placeModelList = homeProvider.placeByCategoryAndGoverment;
    Size size = Utils(context).getScreenSize;
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, _) {
        return placeModelList.isNotEmpty
            ? Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  title: CustomText(
                    title: categoryName,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                body: ListView.separated(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    itemBuilder: (context, index) => CategoryWidget(
                          placeModelList: placeModelList[index],
                        ),
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 20,
                        ),
                    itemCount: placeModelList.length),
              )
            : Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  title: CustomText(
                    title: categoryName,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: size.height * .2,
                      width: size.width * .5,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/images/box.png'))),
                    ),
                    CenterText(
                      title: 'Whoops!',
                      fontSize: 32,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                    CenterText(
                      title: 'No Item for this Category',
                      fontSize: 20,
                      color: Colors.lightBlueAccent,
                    ),
                    CenterText(
                      title: 'Search for onther categories :)',
                      fontSize: 20,
                      color: Colors.lightBlueAccent,
                    ),
                  ],
                ),
              );
      },
    );
  }
}

class CategoryWidget extends StatelessWidget {
  PlaceModel placeModelList;
  CategoryWidget({Key? key, required this.placeModelList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = Utils(context).getScreenSize;
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: darkGreyColor.withOpacity(.4),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          GlobalMethods()
              .navigateTo(context, PlaceInfoPage(placeModel: placeModelList));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              SizedBox(
                height: size.height * .3,
                width: size.width,
                child: FancyShimmerImage(
                    imageUrl: placeModelList.thumbnail!, boxFit: BoxFit.fill),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: blackColor.withOpacity(.4),
                ),
                padding: const EdgeInsets.all(8),
                child: CustomText(
                  title: placeModelList.title!,
                  color: whiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Positioned(
                  top: 10,
                  right: 10,
                  child: GestureDetector(
                      onTap: () {
                        // favouriteProvider.addItemToWishList(
                        //     placeId: placeModelList.id);
                      },
                      child: const Icon(
                        Typicons.heart_filled,
                        color: redColor,
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}

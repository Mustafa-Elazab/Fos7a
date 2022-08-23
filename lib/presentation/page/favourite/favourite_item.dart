import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fos7a/constnats/theme.dart';
import 'package:fos7a/constnats/utils.dart';
import 'package:fos7a/data/models/place_model.dart';
import 'package:fos7a/presentation/page/home/inner_screen/info/place_info.dart';
import 'package:fos7a/presentation/widget/custom_text.dart';
import 'package:fos7a/presentation/widget/global_methods.dart';
import 'package:fos7a/provider/favourite_provider.dart';
import 'package:provider/provider.dart';

class FavouriteItem extends StatelessWidget {
  PlaceModel placeModel;
  FavouriteItem({Key? key, required this.placeModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    return Consumer<FavouriteProvider>(
      builder: (context, favouriteProvider, _) {
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
          height: size.height * .23,
          width: size.width,
          child: GestureDetector(
            onTap: () {
              GlobalMethods()
                  .navigateTo(context, PlaceInfoPage(placeModel: placeModel));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  SizedBox(
                      height: size.height * .23,
                      width: size.width,
                      child:
                          FancyShimmerImage(imageUrl: placeModel.thumbnail!)),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: CustomText(
                      title: placeModel.title!,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: whiteColor,
                    ),
                  ),
                  Positioned(
                      top: 10,
                      right: 10,
                      child: GestureDetector(
                          onTap: () {
                            favouriteProvider.removePlace(placeModel);
                          },
                          child: const Icon(
                            Entypo.trash,
                            color: greenColor,
                          ))),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

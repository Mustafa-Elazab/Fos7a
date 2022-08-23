import 'package:flutter/material.dart';
import 'package:fos7a/constnats/theme.dart';
import 'package:fos7a/data/models/place_model.dart';
import 'package:fos7a/presentation/page/home/inner_screen/info/place_info.dart';
import 'package:fos7a/presentation/widget/custom_text.dart';
import 'package:fos7a/presentation/widget/global_methods.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

class SuggestItem extends StatelessWidget {
  PlaceModel placeModel;
  SuggestItem({Key? key, required this.placeModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var size = Utils(context).getScreenSize;
    return GestureDetector(
      onTap: () {
        GlobalMethods().navigateTo(
            context,
            PlaceInfoPage(
              placeModel: placeModel,
            ));
      },
      child: Stack(
        fit: StackFit.expand,
        alignment: AlignmentDirectional.bottomStart,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: FancyShimmerImage(
                imageUrl: placeModel.thumbnail!, boxFit: BoxFit.fill),
          ),
          Positioned(
            bottom: 12,
            left: 12,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: blackColor.withOpacity(.4),
              ),
              padding: const EdgeInsets.all(4),
              child: CustomText(
                title: placeModel.title!,
                color: whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}

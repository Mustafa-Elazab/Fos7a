// ignore_for_file: implementation_imports, must_be_immutable, deprecated_member_use

import 'package:easy_localization/src/public_ext.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:fos7a/constnats/theme.dart';
import 'package:fos7a/constnats/utils.dart';
import 'package:fos7a/data/models/place_model.dart';
import 'package:fos7a/presentation/page/home/inner_screen/info/location_place.dart';
import 'package:fos7a/presentation/widget/custom_button_contact.dart';
import 'package:fos7a/presentation/widget/custom_dialog.dart';
import 'package:fos7a/presentation/widget/custom_see_more.dart';
import 'package:fos7a/presentation/widget/custom_text.dart';
import 'package:fos7a/presentation/widget/global_methods.dart';
import 'package:fos7a/provider/favourite_provider.dart';
import 'package:fos7a/translations/locale_keys.g.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaceInfoPage extends StatelessWidget {
  PlaceModel? placeModel;
  PlaceInfoPage({
    required this.placeModel,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = Utils(context).getScreenSize;

    var favouriteProvider = Provider.of<FavouriteProvider>(context)
      ..fetchAllFavourite();
    //print(favouriteProvider.placeList);
    bool? isInFavouriteList =
        favouriteProvider.placeIdList.contains(placeModel!.id);
    print(favouriteProvider.placeIdList);
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
                backgroundColor: Colors.transparent,
                pinned: true,
                elevation: 2,
                expandedHeight: size.height * .6,
                flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    titlePadding: const EdgeInsets.all(10),
                    background: Stack(children: [
                      Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            elevation: 20,
                            margin: EdgeInsets.zero,
                            child: GestureDetector(
                              onTap: () {
                                GlobalMethods().navigateTo(context,
                                    ImagesPage(images: placeModel!.images!));
                              },
                              child: Hero(
                                tag: 'customTag',
                                child: FancyShimmerImage(
                                    imageUrl: placeModel!.images![index],
                                    boxFit: BoxFit.fill),
                              ),
                            ),
                          );
                        },
                        itemCount: placeModel!.images!.length,
                        autoplay: true,
                        curve: Curves.easeInCubic,
                        pagination: const SwiperPagination(
                            alignment: Alignment.bottomCenter,
                            builder: DotSwiperPaginationBuilder(
                                color: Colors.white, activeColor: Colors.red)),
                      ),
                      Container(
                          margin: const EdgeInsets.only(bottom: 35),
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: blackColor.withOpacity(.4),
                                    ),
                                    padding: const EdgeInsets.all(4),
                                    child: CustomText(
                                      title: placeModel!.title!,
                                      color: whiteColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: blackColor.withOpacity(.1),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4, vertical: 8),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            if (isInFavouriteList == false) {
                                              favouriteProvider
                                                  .addPlaceToFavorite(
                                                placeModel: placeModel!,
                                              );
                                            } else {
                                              //print('item Alrady in ');
                                              favouriteProvider.placeIdList
                                                  .remove(placeModel!.id);

                                              // print(favouriteProvider
                                              //     .placeIdList);
                                            }
                                          },
                                          child: Icon(
                                            Typicons.heart_filled,
                                            size: size.height * .04,
                                            color: isInFavouriteList
                                                ? redColor
                                                : whiteColor,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            GlobalMethods().navigateTo(
                                                context, LocationPlace());
                                          },
                                          child: Icon(
                                            Typicons.location,
                                            color: whiteColor,
                                            size: size.height * .04,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        GestureDetector(
                                            child: Icon(FontAwesome.phone,
                                                size: size.height * .04,
                                                color: whiteColor),
                                            onTap: () async {
                                              var phone = placeModel!.phone;
                                              if (phone.toString().isEmpty) {
                                                showDialog(
                                                    barrierDismissible: false,
                                                    context: context,
                                                    builder: (BuildContext
                                                            context) =>
                                                        CustomDialog(
                                                            title: 'Error',
                                                            description:
                                                                'This Place Don\'t have phone number',
                                                            buttonText:
                                                                'Cancel'));
                                              }
                                              await launch(('tel://$phone'));
                                            }),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        GestureDetector(
                                            child: Icon(
                                              FontAwesome.whatsapp,
                                              color: whiteColor,
                                              size: size.height * .04,
                                            ),
                                            onTap: () async {
                                              var whatsupNumber =
                                                  placeModel!.whatsupNumber ??
                                                      '';
                                              if (whatsupNumber
                                                  .toString()
                                                  .isEmpty) {
                                                showDialog(
                                                    barrierDismissible: false,
                                                    context: context,
                                                    builder: (BuildContext
                                                            context) =>
                                                        CustomDialog(
                                                            title: 'Error',
                                                            description:
                                                                'This Place Don\'t have whatsapp Account',
                                                            buttonText:
                                                                'Cancel'));
                                              }
                                              var whatsappUrl =
                                                  "whatsapp://send?phone=$whatsupNumber";
                                              await canLaunch(whatsappUrl)
                                                  ? launch(whatsappUrl)
                                                  : print(
                                                      "open whatsapp app link or do a snackbar with notification that there is no whatsapp installed");
                                            }),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ))
                    ]))),
          ];
        },
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                margin: const EdgeInsets.all(8),
                elevation: 10.0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        title: LocaleKeys.information_tx.tr(),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(height: 8),
                      ExpandableText(placeModel!.description ?? ''),
                    ],
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.all(8),
                elevation: 10.0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        title: LocaleKeys.contact_tx.tr(),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(height: 16),
                      CustomContactButton(
                        title: LocaleKeys.facebook_tx.tr(),
                        iconData: FontAwesome5.facebook,
                        onTap: () async {
                          var facebookUrl = placeModel!.facebookLink ?? '';
                          if (facebookUrl.isEmpty) {
                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) => CustomDialog(
                                    title: 'Error',
                                    description:
                                        'This Place Don\'t have facebook account',
                                    buttonText: 'Cancel'));
                          }
                          await canLaunch(facebookUrl)
                              ? launch(facebookUrl,
                                  forceSafariVC: false, forceWebView: false)
                              : print("");
                        },
                      ),
                      const SizedBox(height: 8),
                      CustomContactButton(
                          title: LocaleKeys.instagram_tr.tr(),
                          iconData: FontAwesome5.instagram,
                          onTap: () async {
                            var instagramUrl = placeModel!.instagramLink ?? '';
                            if (instagramUrl.isEmpty) {
                              showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (BuildContext context) => CustomDialog(
                                      title: 'Error',
                                      description:
                                          'This Place Don\'t have instagram account',
                                      buttonText: 'OK'));
                            } else {
                              await canLaunch(instagramUrl)
                                  ? launch(instagramUrl,
                                      forceSafariVC: false, forceWebView: false)
                                  : print("");
                            }
                          }),
                    ],
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.all(8),
                elevation: 10.0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        title: LocaleKeys.opening_tx.tr(),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            title: placeModel!.openingTime!,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Card(
              //   margin: const EdgeInsets.all(8),
              //   elevation: 10.0,
              //   child: Container(
              //     padding:
              //         const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         CustomText(
              //           title: LocaleKeys.close_tx.tr(),
              //           fontSize: 18,
              //           fontWeight: FontWeight.w600,
              //         ),
              //         const SizedBox(height: 8),
              //         Row(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             CustomText(
              //               title: 'Friday',
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              Card(
                margin: const EdgeInsets.all(8),
                elevation: 10.0,
                child: Container(
                  width: size.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        title: LocaleKeys.address.tr(),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomText(
                        title: placeModel!.address!,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ImagesPage extends StatelessWidget {
  List<String> images;
  ImagesPage({required this.images});
  @override
  Widget build(BuildContext context) {
    var size = Utils(context).getScreenSize;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return InteractiveViewer(
            child: Center(
              child: Hero(
                tag: 'customTag',
                child: FancyShimmerImage(
                  imageUrl: images[index],
                  boxFit: BoxFit.fill,
                  height: size.height * .6,
                  width: size.width,
                ),
              ),
            ),
          );
        },
        itemCount: images.length,
        curve: Curves.easeInCubic,
        pagination: const SwiperPagination(
            alignment: Alignment.bottomCenter,
            builder: DotSwiperPaginationBuilder(
                color: Colors.black, activeColor: Colors.red)),
      ),
    );
  }
}

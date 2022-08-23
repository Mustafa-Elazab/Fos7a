import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:fos7a/constnats/theme.dart';
import 'package:fos7a/constnats/utils.dart';
import 'package:fos7a/presentation/page/home/inner_screen/info/categoty_item.dart';
import 'package:fos7a/presentation/page/home/inner_screen/info/suggest_item.dart';
import 'package:fos7a/presentation/widget/center_text.dart';
import 'package:fos7a/presentation/widget/custom_text.dart';
import 'package:fos7a/provider/home_provider.dart';
import 'package:fos7a/provider/setting_provider.dart';
import 'package:fos7a/translations/locale_keys.g.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = Utils(context).getScreenSize;
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);
    return Consumer<HomeProvider>(builder: (context, homeProvider, _) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StatefulBuilder(builder: (context, setState) {
              return SizedBox(
                height: size.height * .08,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            setState(() {
                              homeProvider.govermentId =
                                  homeProvider.govermentList[index].id;
                              homeProvider.findPlaceByGov();
                              // print(homeProvider.govermentId);
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 40),
                            curve: Curves.fastOutSlowIn,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: homeProvider.govermentId ==
                                        homeProvider.govermentList[index].id
                                    ? appColorPrimary
                                    : appColorPrimary.withOpacity(.4)),
                            child: CenterText(
                              title: settingProvider.lang.toLowerCase() ==
                                      'English'.toLowerCase()
                                  ? homeProvider
                                      .govermentList[index].governorateNameEn
                                  : homeProvider
                                      .govermentList[index].governorateNameAr,
                              fontSize: 20,
                              fontFamily: 'Maxima',
                              color: whiteColor,
                            ),
                          ),
                        ),
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 10,
                        ),
                    itemCount: homeProvider.govermentList.length),
              );
            }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: CustomText(
                title: LocaleKeys.categories_tx.tr(),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: size.height * 0.18,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => CategoryItem(
                        categoryModel: homeProvider.categoryList[index],
                      ),
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 4,
                      ),
                  itemCount: homeProvider.categoryList.length),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: CustomText(
                title: LocaleKeys.suggest_tx.tr(),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            homeProvider.placeByGoverment.isNotEmpty
                ? Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: darkGreyColor.withOpacity(.1),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset:
                              const Offset(0, 8), // changes position of shadow
                        ),
                      ],
                    ),
                    height: size.height * .42,
                    width: size.width,
                    child: CarouselSlider(
                        items: List.generate(
                            homeProvider.placeByGoverment.length < 5
                                ? homeProvider.placeByGoverment.length
                                : 5,
                            (index) => SuggestItem(
                                placeModel:
                                    homeProvider.placeByGoverment[index])),
                        options: CarouselOptions(
                          height: size.height * .2,
                          enlargeCenterPage: true,
                          disableCenter: true,
                          viewportFraction: .7,
                        )),
                  )
                : Column(
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
                        title: 'No Item for this Goverment',
                        fontSize: 20,
                        color: Colors.lightBlueAccent,
                      ),
                      CenterText(
                        title: 'Search for onther Goverment :)',
                        fontSize: 20,
                        color: Colors.lightBlueAccent,
                      ),
                    ],
                  ),
          ],
        ),
      );
    });
  }
}

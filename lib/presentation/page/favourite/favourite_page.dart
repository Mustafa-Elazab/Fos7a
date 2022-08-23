import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:fos7a/constnats/utils.dart';
import 'package:fos7a/data/models/place_model.dart';
import 'package:fos7a/presentation/page/favourite/favourite_item.dart';
import 'package:fos7a/presentation/widget/center_text.dart';
import 'package:fos7a/presentation/widget/custom_text.dart';
import 'package:fos7a/translations/locale_keys.g.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;

    return Scaffold(
        appBar: AppBar(
          elevation: 0.2,
          title: CustomText(
            title: LocaleKeys.favourite_tx.tr(),
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: 'Quaker',
          ),
          // actions: [
          //   IconButton(
          //       onPressed: () {
          //         favouriteProvider.clearfavouriteList();
          //       },
          //       icon: const Icon(
          //         Entypo.trash,
          //       ))
          // ],
        ),
        body: ValueListenableBuilder<Box<PlaceModel>>(
            valueListenable: Hive.box<PlaceModel>('favourite').listenable(),
            builder: (context, box, _) {
              final fav = box.values.toList().cast<PlaceModel>();
              return fav.isNotEmpty
                  ? ListView.separated(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      itemBuilder: (context, index) => FavouriteItem(
                        placeModel: fav[index],
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                      itemCount: fav.length,
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
                          title: 'No Item Favourite Yet',
                          fontSize: 20,
                          color: Colors.lightBlueAccent,
                        ),
                        CenterText(
                          title: 'Try Add One :)',
                          fontSize: 20,
                          color: Colors.lightBlueAccent,
                        ),
                      ],
                    );
            }));
  }
}

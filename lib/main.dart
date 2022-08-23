import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fos7a/constnats/theme.dart';
import 'package:fos7a/data/models/place_model.dart';
import 'package:fos7a/presentation/page/splash/splash_page.dart';
import 'package:fos7a/provider/favourite_provider.dart';
import 'package:fos7a/provider/home_provider.dart';
import 'package:fos7a/provider/location_provider.dart';
import 'package:provider/provider.dart';
import 'provider/bottom_bar_provider.dart';
import 'provider/setting_provider.dart';
import 'translations/codegen_loader.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Hive.initFlutter();
  Hive.registerAdapter(PlaceModelAdapter());
  await Hive.openBox('settings');
  await Firebase.initializeApp();

  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        assetLoader: const CodegenLoader(),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => BottomBarProvider()),
          ListenableProvider(create: (context) => SettingProvider()),
          ChangeNotifierProvider(
            create: (context) => HomeProvider()
              ..placeByCategoryAndGoverment
              ..findPlaceByGov(),
          ),
          ListenableProvider(create: (context) => FavouriteProvider()),
          ChangeNotifierProvider(create: (context) => LocationProvider()),
        ],
        child:
            Consumer<SettingProvider>(builder: (context, settingProvider, _) {
          return ValueListenableBuilder(
              valueListenable: Hive.box('settings').listenable(),
              builder: (context, box, widget) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  locale: context.locale,
                  theme: lightTheme,
                  darkTheme: darkTheme,
                  themeMode:
                      settingProvider.isDark ? ThemeMode.dark : ThemeMode.light,
                  //themeMode: ThemeMode.light,
                  // ignore: unnecessary_null_comparison
                  home: FutureBuilder(
                    future: Future.wait([
                      //Hive.openBox('settings'),
                      Hive.openBox<PlaceModel>('favourite'),
                    ]),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.error != null) {
                          //    print(snapshot.error);
                          return const Scaffold(
                            body: Center(
                              child: Text('Something went wrong :/'),
                            ),
                          );
                        } else {
                          return SplashPage();
                        }
                      } else {
                        return const Scaffold(
                          body: Center(
                            child: Text('Opening Hive...'),
                          ),
                        );
                      }
                    },
                  ),
                );
              });
        }));
  }
}

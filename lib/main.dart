import 'package:easy_localization/easy_localization.dart';
import 'package:eco_smart/core/localization/locates.dart';
import 'package:eco_smart/core/route/navigator.dart';
import 'package:eco_smart/core/route/routes.dart';
import 'package:eco_smart/core/route/routes_const.dart';
import 'package:eco_smart/core/theme.dart';
import 'package:eco_smart/data/injection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  await Firebase.initializeApp();

  await EasyLocalization.ensureInitialized();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // await hiveInit();

  await getItInit();

  // AndroidYandexMap.useAndroidViewSurface = false;

  runApp(
    EasyLocalization(
      fallbackLocale: Locates.all[0],
      supportedLocales: Locates.all,
      path: 'assets/languages',
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eco-Smart',
      theme: themeData,
      navigatorKey: NavigationService.navigatorKey,
      initialRoute: RouteList.splash,
      debugShowCheckedModeBanner: false,
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: child ?? Container()),
      onGenerateRoute: (RouteSettings settings) {
        final routes = Routes.getRoutes(settings);
        final WidgetBuilder builder = routes[settings.name]!;
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}

// hiveInit() async {
//   await Hive.initFlutter();
//
//   debugPrint(
//       "Hive init start: ${DateTime.now().minute}:${DateTime.now().second}:${DateTime.now().millisecond}");
//
//   final directory = await getApplicationDocumentsDirectory();
//   Hive.init(directory.path);
//
//   try {
//     if (!Hive.isAdapterRegistered(0)) {
//       Hive.registerAdapter(HiveDBAdapter());
//     }
//
//     if (!Hive.isAdapterRegistered(1)) {
//       Hive.registerAdapter(HomeDataAdapter());
//     }
//
//     if (!Hive.isAdapterRegistered(2)) {
//       Hive.registerAdapter(ProductAdapter());
//     }
//
//     if (!Hive.isAdapterRegistered(3)) {
//       Hive.registerAdapter(SymptomsAdapter());
//     }
//
//     if (!Hive.isAdapterRegistered(4)) {
//       Hive.registerAdapter(PopularsAdapter());
//     }
//
//     if (!Hive.isAdapterRegistered(5)) {
//       Hive.registerAdapter(OrderDataAdapter());
//     }
//
//     if (!Hive.isAdapterRegistered(6)) {
//       Hive.registerAdapter(CategoryDataAdapter());
//     }
//
//     if (!Hive.isAdapterRegistered(7)) {
//       Hive.registerAdapter(SubAdapter());
//     }
//
//     if (!Hive.isAdapterRegistered(8)) {
//       Hive.registerAdapter(ChatModelDataAdapter());
//     }
//
//     if (!Hive.isAdapterRegistered(9)) {
//       Hive.registerAdapter(FilesAdapter());
//     }
//
//     if (!Hive.isAdapterRegistered(10)) {
//       Hive.registerAdapter(AddressDataModelAdapter());
//     }
//
//     if (!Hive.isAdapterRegistered(11)) {
//       Hive.registerAdapter(CardsListModelDataAdapter());
//     }
//
//     if (!Hive.isAdapterRegistered(12)) {
//       Hive.registerAdapter(CardDataAdapter());
//     }
//
//     if (!Hive.isAdapterRegistered(13)) {
//       Hive.registerAdapter(StoryModelAdapter());
//     }
//
//     if (!Hive.isAdapterRegistered(14)) {
//       Hive.registerAdapter(ContentsAdapter());
//     }
//
//     if (!Hive.isAdapterRegistered(15)) {
//       Hive.registerAdapter(FilterDataAdapter());
//     }
//
//     if (!Hive.isAdapterRegistered(16)) {
//       Hive.registerAdapter(SymptomAdapter());
//     }
//
//     if (!Hive.isAdapterRegistered(17)) {
//       Hive.registerAdapter(LastFilterModelAdapter());
//     }
//
//     if (!Hive.isAdapterRegistered(18)) {
//       Hive.registerAdapter(FormulaAdapter());
//     }
//
//     if (!Hive.isBoxOpen(hiveDb)) {
//       await Hive.openBox<HiveDB>(hiveDb);
//     }
//   } catch (e) {
//     debugPrint('Error: $e');
//     await Hive.deleteBoxFromDisk(hiveDb, path: directory.path);
//     hiveInit();
//     return;
//   }
//
//   Box<HiveDB> box = Hive.box(hiveDb);
//   HiveDB? hive = box.get(hiveDb);
//   if (hive == null) {
//     box.put(hiveDb, HiveDB());
//   }
//
//   DateTime? date = hive?.date;
//   DateTime now = DateTime.now();
//
//   if (date != null) {
//     if (date.isBefore(DateTime(now.year, now.month, now.day - 7))) {
//       box.put(hiveDb, HiveDB());
//     }
//   } else {
//     box.put(
//         hiveDb,
//         hive ?? HiveDB()
//           ..date = now);
//   }
//
//   debugPrint(
//       "Hive init end: ${DateTime.now().minute}:${DateTime.now().second}:${DateTime.now().millisecond}");
// }

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:teleco/routing/app_router.dart';
import 'package:teleco/utils/app_theme.dart';
import 'package:teleco/utils/logger.dart';
import 'constants/colors_data.dart';
import 'extensions/localization.dart';


void main()async{

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp( EasyLocalization(
      supportedLocales: L10n.all,
      path: 'assets/l10n',
      fallbackLocale: L10n.all[0],
  child: ProviderScope(observers: [Logger()],child:const MyApp())));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerDelegate: goRouter.routerDelegate,
      routeInformationProvider: goRouter.routeInformationProvider,
      routeInformationParser: goRouter.routeInformationParser,
      debugShowCheckedModeBanner: false,
      title: '',
      theme: AppTheme.instance.lightTheme(),
      localizationsDelegates:context.localizationDelegates ,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      builder: (context, widget) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget!),
          maxWidth: 1700,
          minWidth: 400,
          defaultScale: true,
          breakpoints:const [
            ResponsiveBreakpoint.resize(400, name: MOBILE),
            ResponsiveBreakpoint.autoScale(600, name: TABLET),
            ResponsiveBreakpoint.resize(800, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
          ],
          background: Container(color: kNavyBlue)),
    );
  }
}

//flutter pub run easy_localization:generate -S assets/l10n -f keys -O lib/l10n -o locale_keys.g.dart
import 'package:doantotnghiep/src/common/constant.dart';
import 'package:doantotnghiep/src/localization/locales.dart';
import 'package:doantotnghiep/src/modules/authen/provider/authen_provider.dart';
import 'package:doantotnghiep/src/utilities/language/provider/locales_provider.dart';
import 'package:doantotnghiep/src/modules/onboarding/screens/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LocaLesProvider>(
            create: (context) => LocaLesProvider()),
        ChangeNotifierProvider<AuthenProvider>(
            create: (context) => AuthenProvider()),
        // khi nao tao 1 provider phai khai bao
      ],
      child: ScreenUtilInit(
          designSize: Size(WIDTH_DESIGN, HEIGHT_DESIGN),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) => AppScreen()),
    );
  }
}

class AppScreen extends StatefulWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  final FlutterLocalization localization = FlutterLocalization.instance;

  @override
  void initState() {
    configureLocalization();
    super.initState();
  }

  void onTranslatedLanguage(Locale? locale) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Onboarding Screen',
      home: OnboardingScreen(),
      debugShowCheckedModeBanner: false,
      supportedLocales: localization.supportedLocales,
      localizationsDelegates: localization.localizationsDelegates,
    );
  }

  void configureLocalization() {
    localization.init(mapLocales: LOCALES, initLanguageCode: "en");
    localization.onTranslatedLanguage = onTranslatedLanguage;
  }
}

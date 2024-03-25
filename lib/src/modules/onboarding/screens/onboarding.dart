import 'package:doantotnghiep/UI/auth.dart';
import 'package:doantotnghiep/UI/constants.dart';
import 'package:doantotnghiep/src/localization/locales.dart';
import 'package:doantotnghiep/src/modules/onboarding/widget/page_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  // controler FlutterLocalization
  late FlutterLocalization _flutterLocalization;
  late String _currentLocale;
  @override
  void initState() {
    super.initState();
    _flutterLocalization = FlutterLocalization.instance;
    _currentLocale = _flutterLocalization.currentLocale!.languageCode;
    print("Ngon ngu: ${_currentLocale}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 20),
            child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => const AuthScreen()));
                }, //to login screen. We will update later
                child: Row(
                  children: [
                    DropdownButton(
                      icon: Icon(Icons.public),
                      value: _currentLocale,
                      items: [
                        DropdownMenuItem(
                          child: Text("VI"),
                          value: "vi",
                        ),
                        DropdownMenuItem(
                          child: Text("EN"),
                          value: "en",
                        )
                      ],
                      onChanged: (value) {
                        setLocale(value);
                      },
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      LocaleData.skip.getString(context),
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                )),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: [
              PageItem(
                image: 'assets/images/bequetqr.png',
                title: LocaleData.titleOne.getString(context),
                description: LocaleData.descriptionOne.getString(context),
              ),
              PageItem(
                image: 'assets/images/bedapxe.png',
                title: LocaleData.titleTwo.getString(context),
                description: LocaleData.descriptionTwo.getString(context),
              ),
              PageItem(
                image: 'assets/images/bedoxe.png',
                title: LocaleData.titleThree.getString(context),
                description: LocaleData.descriptionThree.getString(context),
              ),
            ],
          ),
          Positioned(
            bottom: 80,
            left: 30,
            child: Row(
              children: _buildIndicator(),
            ),
          ),
          Positioned(
            bottom: 60,
            right: 30,
            child: Container(
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      if (currentIndex < 2) {
                        currentIndex++;
                        if (currentIndex < 3) {
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                        }
                      } else {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const AuthScreen()));
                      }
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    size: 24,
                    color: Colors.white,
                  )),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Constants.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  //Extra Widgets

  //Create the indicator decorations widget
  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 10.0,
      width: isActive ? 20 : 8,
      margin: const EdgeInsets.only(right: 5.0),
      decoration: BoxDecoration(
        color: Constants.primaryColor,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

//Create the indicator list
  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];

    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }

  void setLocale(String? value) {
    if (value == null) return;
    if (value == "en") {
      _flutterLocalization.translate("en");
    } else if (value == "vi") {
      _flutterLocalization.translate("vi");
    } else {
      return;
    }
    setState(() {
      _currentLocale = value;
    });
  }
}

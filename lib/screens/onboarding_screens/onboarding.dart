import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medshop/auth/signIn.dart';
import 'package:onboarding/onboarding.dart';

import '../../config/constant.dart';

class onboard extends StatefulWidget {
  const onboard({Key? key}) : super(key: key);

  @override
  State<onboard> createState() => _onboardState();
}

class _onboardState extends State<onboard> {
  late Material materialButton;
  late int index;
  final onboardingPagesList = [
    PageModel(
      widget: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 69, 161, 218),
          border: Border.all(
            width: 0.0,
            color: const Color.fromARGB(255, 69, 161, 218),
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 80, 0, 0),
                child: Align(
                    alignment: Alignment.center,
                    child:
                        Lottie.asset('assets/images/animation_lnndxywu.json')),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    onboardone,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    PageModel(
      widget: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 69, 161, 218),
          border: Border.all(
            width: 0.0,
            color: const Color.fromARGB(255, 69, 161, 218),
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 80, 0, 0),
                child: Align(
                    alignment: Alignment.center,
                    child:
                        Lottie.asset('assets/images/animation_lnogukhl.json')),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    onboardtwo,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    PageModel(
      widget: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 69, 161, 218),
          border: Border.all(
            width: 0.0,
            color: const Color.fromARGB(255, 69, 161, 218),
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 80, 0, 0),
                child: Align(
                    alignment: Alignment.center,
                    child:
                        Lottie.asset('assets/images/animation_lnogbvhl.json')),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    onboardthree,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    materialButton = _skipButton();
    index = 0;
  }

  Material _skipButton({void Function(int)? setIndex}) {
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      color: Colors.orangeAccent,
      child: InkWell(
        borderRadius: defaultSkipButtonBorderRadius,
        onTap: () {
          if (setIndex != null) {
            index = 2;
            setIndex(2);
          }
        },
        child: const Padding(
          padding: defaultSkipButtonPadding,
          child: Text(
            'Skip',
            style: defaultSkipButtonTextStyle,
          ),
        ),
      ),
    );
  }

  Material get _signupButton {
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      color: Colors.orangeAccent,
      child: InkWell(
        borderRadius: defaultProceedButtonBorderRadius,
        onTap: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) =>  SignIn(),
              ),
              (route) => false);
        },
        child: const Padding(
          padding: defaultProceedButtonPadding,
          child: Text(
            'Sign up',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MedShop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Onboarding(
          pages: onboardingPagesList,
          onPageChange: (int pageIndex) {
            index = pageIndex;
          },
          startPageIndex: 0,
          footerBuilder: (context, dragDistance, pagesLength, setIndex) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 69, 161, 218),
                border: Border.all(
                  width: 0.0,
                  color: const Color.fromARGB(255, 69, 161, 218),
                ),
              ),
              child: ColoredBox(
                color: const Color.fromARGB(255, 69, 161, 218),
                child: Padding(
                  padding: const EdgeInsets.all(45.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomIndicator(
                        netDragPercent: dragDistance,
                        pagesLength: pagesLength,
                        indicator: Indicator(
                          activeIndicator: ActiveIndicator(color: Colors.black),
                          indicatorDesign: IndicatorDesign.polygon(
                            polygonDesign: PolygonDesign(
                              polygon: DesignType.polygon_diamond,
                            ),
                          ),
                        ),
                      ),
                      index == pagesLength - 1
                          ? _signupButton
                          : _skipButton(setIndex: setIndex)
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

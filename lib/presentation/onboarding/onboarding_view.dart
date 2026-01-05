import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:services/presentation/resources/assets_manager.dart';
import 'package:services/presentation/resources/color_manager.dart';
import 'package:services/presentation/resources/strings_manager.dart';
import 'package:services/presentation/resources/values_manager.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late final List<SliderObject> _list = _getSliderData();

  final PageController _pageController = PageController();

  int _currentPageIndex = 0;

  List<SliderObject> _getSliderData() => [
    SliderObject(
      AppStrings.onBoardingSubTitle1,
      AppStrings.onBoardingSubTitle1,
      ImageAssets.onboardingLogo1,
    ),
    SliderObject(
      AppStrings.onBoardingSubTitle2,
      AppStrings.onBoardingSubTitle2,
      ImageAssets.onboardingLogo2,
    ),
    SliderObject(
      AppStrings.onBoardingSubTitle3,
      AppStrings.onBoardingSubTitle3,
      ImageAssets.onboardingLogo3,
    ),
    SliderObject(
      AppStrings.onBoardingSubTitle4,
      AppStrings.onBoardingSubTitle4,
      ImageAssets.onboardingLogo4,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _list.length,
        onPageChanged: (value) {
          setState(() {
            _currentPageIndex = value;
          });
        },
        itemBuilder: (context, index) {
          return OnBoardingPage(_list[index]);
        },
      ),
      bottomSheet: Container(
        color: ColorManager.white,
        height: AppSize.s100,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(AppStrings.skip, textAlign: TextAlign.end,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage(this._sliderObject, {super.key});

  final SliderObject _sliderObject;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppSize.s40),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        SizedBox(height: AppSize.s60),
        SvgPicture.asset(_sliderObject.image),
      ],
    );
  }
}

class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}

import 'dart:async';

import 'package:services/domain/model/models.dart';
import 'package:services/presentation/base/base_view_model.dart';
import 'package:services/presentation/resources/assets_manager.dart';
import 'package:services/presentation/resources/strings_manager.dart';

class OnBoardingViewModel
    implements
        BaseViewModel,
        OnBoardingViewModelInputs,
        OnBoardingViewModelOutputs {
  final StreamController _streamController =
      StreamController<SliderViewObject>();
  late final List<SliderObject> _list;

  int _currentPageIndex = 0;

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  int goNext() {
    int nextIndex = ++_currentPageIndex;
    if (nextIndex == 4) {
      nextIndex = 0;
    }
    return nextIndex;
  }

  @override
  int goPrevious() {
    int previousIndex = --_currentPageIndex;
    if (previousIndex == -1) {
      previousIndex = _list.length - 1;
    }
    return previousIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentPageIndex = index;
    _postDataToView();
  }

  @override
  // TODO: implement inputSliderViewObject
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  // TODO: implement outputSliderViewObject
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  void _postDataToView() {
    inputSliderViewObject.add(
      SliderViewObject(
        _list[_currentPageIndex],
        _list.length,
        _currentPageIndex,
      ),
    );
  }

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
}

abstract class OnBoardingViewModelInputs {
  int goNext();

  int goPrevious();

  void onPageChanged(int index);

  Sink get inputSliderViewObject;
}

abstract class OnBoardingViewModelOutputs {
  Stream<SliderViewObject> get outputSliderViewObject;
}
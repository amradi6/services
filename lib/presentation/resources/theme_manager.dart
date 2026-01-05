import 'package:flutter/material.dart';
import 'package:services/presentation/resources/color_manager.dart';
import 'package:services/presentation/resources/font_manager.dart';
import 'package:services/presentation/resources/style_manager.dart';
import 'package:services/presentation/resources/values_manager.dart';

ThemeData getApplicationTheme() => ThemeData(
  primaryColor: ColorManager.primary,
  primaryColorLight: ColorManager.lightPrimary,
  primaryColorDark: ColorManager.darkPrimary,
  disabledColor: ColorManager.grey1,
  splashColor: ColorManager.lightPrimary,

  cardTheme: CardThemeData(
    color: ColorManager.white,
    shadowColor: ColorManager.grey,
    elevation: AppSize.s4,
  ),

  appBarTheme: AppBarTheme(
    backgroundColor: ColorManager.primary,
    centerTitle: true,
    elevation: AppSize.s4,
    shadowColor: ColorManager.lightPrimary,
    titleTextStyle: getRegularStyle(
      fontSize: FontSize.s16,
      color: ColorManager.white,
    ),
  ),

  buttonTheme: ButtonThemeData(
    shape: StadiumBorder(),
    disabledColor: ColorManager.grey1,
    buttonColor: ColorManager.primary,
    splashColor: ColorManager.lightPrimary,
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: getRegularStyle(
        color: ColorManager.white,
        fontSize: FontSize.s17,
      ),
      backgroundColor: ColorManager.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s12),
      ),
    ),
  ),

  textTheme: TextTheme(
    displayLarge: getSemiBoldStyle(
      color: ColorManager.darkGrey,
      fontSize: FontSize.s16,
    ),
    headlineMedium: getRegularStyle(
      color: ColorManager.darkGrey,
      fontSize: FontSize.s14,
    ),
    headlineLarge: getSemiBoldStyle(
      color: ColorManager.darkGrey,
      fontSize: FontSize.s16,
    ),
    titleMedium: getMediumStyle(
      color: ColorManager.primary,
      fontSize: FontSize.s16,
    ),
    bodyLarge: getRegularStyle(color: ColorManager.grey),
    bodySmall: getRegularStyle(color: ColorManager.grey),
  ),

  inputDecorationTheme: InputDecorationThemeData(
    contentPadding: const EdgeInsets.all(AppPadding.p8),
    hintStyle: getRegularStyle(
      color: ColorManager.grey,
      fontSize: FontSize.s14,
    ),
    labelStyle: getMediumStyle(
      color: ColorManager.grey,
      fontSize: FontSize.s14,
    ),
    errorStyle: getRegularStyle(color: ColorManager.error),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
      borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
      borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
      borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
      borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
    ),
  ),
);

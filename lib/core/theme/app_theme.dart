// Objectives: This file is responsible for providing the app themes that is used in the app.

import 'package:dashboard_ecommerce/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app_colors.dart';

abstract class AppTheme {
  static bool? isDark;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    dialogTheme: DialogTheme(
      actionsPadding: EdgeInsets.zero,
      elevation: 0,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.r),
        ),
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.secondaryPrimary,
      onPrimary: Colors.white,
      outlineVariant: AppColors.lightGrey,
      onSurface: AppColors.inverseBase,
    ),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      headerHeadlineStyle: AppTextStyles.font23BlackRegularCairo,
      weekdayStyle: AppTextStyles.font12DarkGrayCairo,
      headerBackgroundColor: AppColors.secondaryPrimary,
      headerForegroundColor: Colors.white,
      backgroundColor: AppColors.card,
      todayBackgroundColor: WidgetStatePropertyAll(AppColors.card),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
      ),
      dayStyle: AppTextStyles.font14BlackCairoMedium,
      dayBackgroundColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.secondaryPrimary;
          }
          return AppColors.card;
        },
      ),
      dayForegroundColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.white;
          } else if (states.contains(WidgetState.disabled)) {
            return AppColors.lightGrey;
          }
          return AppColors.text;
        },
      ),
      yearBackgroundColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.secondaryPrimary;
          }
          return AppColors.card;
        },
      ),
      yearForegroundColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.white;
          }
          return AppColors.text;
        },
      ),
      dividerColor: AppColors.secondaryPrimary,
      dayShape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      todayForegroundColor: WidgetStateProperty.all(
        AppColors.secondaryPrimary,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    dialogTheme: DialogTheme(
      actionsPadding: EdgeInsets.zero,
      elevation: 0,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.r),
        ),
      ),
    ),
    colorScheme: ColorScheme.dark(
      primary: AppColors.secondaryPrimary,
      onPrimary: Colors.white,
      outlineVariant: AppColors.lightGrey,
      onSurface: AppColors.inverseBase,
    ),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      headerHeadlineStyle: AppTextStyles.font23BlackRegularCairo,
      weekdayStyle: AppTextStyles.font12DarkGrayCairo,
      headerBackgroundColor: AppColors.secondaryPrimary,
      headerForegroundColor: Colors.white,
      backgroundColor: AppColors.card,
      todayBackgroundColor: WidgetStatePropertyAll(AppColors.card),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
      ),
      dayStyle: AppTextStyles.font14BlackCairoMedium,
      dayBackgroundColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.secondaryPrimary;
          }
          return AppColors.white;
        },
      ),
      dayForegroundColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.white;
          } else if (states.contains(WidgetState.disabled)) {
            return AppColors.lightGrey;
          }
          return AppColors.black;
        },
      ),
      yearBackgroundColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.secondaryPrimary;
          }
          return AppColors.card;
        },
      ),
      yearForegroundColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.white;
          }
          return AppColors.text;
        },
      ),
      dividerColor: AppColors.secondaryPrimary,
      dayShape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      todayForegroundColor: WidgetStateProperty.all(
        AppColors.secondaryPrimary,
      ),
    ),
  );

  // ****************** DEFINE COLOR PALETTE HERE ******************
  static Map<String, Color> lightThemeColors = {
    'evenRowColor': const Color(0xFFf1f1f1),
    'secondaryPrimary': const Color(0xffE5B800),
    'primary': const Color(0xffFFDE59),
    'inputColor': const Color(0xff8D8D8D),
    'grey': const Color(0xffD9D9D9),
    'lightGrey': const Color(0xffC3C3C3),
    'moreLightGrey': const Color(0xffEFEFEF),
    'mediumGrey': const Color(0xffA6A6A6),
    'darkGrey': const Color(0xff858585),
    'blackShadow': const Color.fromRGBO(0, 0, 0, 0.4),
    'green': const Color(0xff008000),
    'red': const Color(0xffDF1C1C),
    'header': const Color(0xff2D2D2D),
    'warming': const Color(0xffFF814A),
    'blue': const Color(0xff1F78D1),
    'card': Colors.white,
    'field': const Color(0xffEFEFEF),
    'text': const Color(0xff2D2D2D),
    'base': Colors.white,
    'inverseBase': const Color(0xff797979),
    'dropShadow': const Color(0xffC3C3C3).withOpacity(0.5),
    'borderCard': const Color(0xffFFFFFF),
    'message': const Color(0xffEFEFEF),
    'messageText': const Color(0xff858585),
    'border': const Color(0xffD9D9D9),
    'background': const Color(0xffF5F5F5),
    'appBar': const Color(0xffF5F5F5),
    'indicator': const Color(0xffE9E9E9),
    'starredCard': Colors.white,
    'black': const Color(0xff2D2D2D),
    'secondaryBlack': const Color(0xff797979),
    'whiteShadow': const Color(0xD9D9D9E0),
    'darkWhiteShadow': const Color(0x9E9E9E9E),
    'white': Colors.white,
    'darkWhite': const Color(0xffF2F2F2),
    'dialog': Colors.white,
    'button': const Color(0xffF2F2F2),
    'icon': const Color(0xff2D2D2D),
    'chatBackground': const Color(0xffF5F5F5),
    'chatField': Colors.white,
    'lightGreen': const Color(0xff4BB609),
    'orange': const Color(0xffFF814A),
    'darkRed': const Color(0xffDF1C1C),
    'yellow': const Color(0xffE5B800),
    'fieldBorder': const Color(0xffE5E5ED),
    'oddRowColor': Colors.white,
  };

  // ****************** DEFINE DARK COLOR PALETTE HERE ******************
  static Map<String, Color> darkThemeColors = {
    'secondaryPrimary': const Color(0xffE5B800),
    'evenRowColor': const Color(0xFF545454),
    'oddRowColor': const Color(0xFF28282B),
    'primary': const Color(0xffFFDE59),
    'inputColor': const Color(0xff8D8D8D),
    'grey': const Color(0xffD9D9D9),
    'lightGrey': const Color(0xffC3C3C3),
    'moreLightGrey': const Color(0xffEFEFEF),
    'mediumGrey': const Color(0xffA6A6A6),
    'darkGrey': const Color(0xff858585),
    'blackShadow': const Color.fromRGBO(0, 0, 0, 0.4),
    'green': const Color(0xff008000),
    'red': const Color(0xffDF1C1C),
    'header': const Color(0xFF171717),
    'warming': const Color(0xffFF814A),
    'blue': const Color(0xff1F78D1),
    'card': const Color(0xff4B4B4B),
    'field': const Color(0xff4B4B4B),
    'text': Colors.white,
    'base': const Color(0xff797979),
    'inverseBase': Colors.white,
    'dropShadow': const Color(0xffC3C3C3).withOpacity(0.5),
    'borderCard': const Color(0xffFFFFFF),
    'message': const Color(0xffEFEFEF),
    'messageText': const Color(0xff858585),
    'border': Colors.transparent,
    'background': const Color(0xff2D2D2D),
    'appBar': const Color(0xff2D2D2D),
    'indicator': const Color(0xffE9E9E9),
    'starredCard': Colors.white,
    'black': const Color(0xff2D2D2D),
    'secondaryBlack': Colors.white,
    'whiteShadow': const Color(0xD9D9D9E0),
    'darkWhiteShadow': const Color(0x9E9E9E9E),
    'white': Colors.white,
    'darkWhite': const Color(0xffF2F2F2),
    'dialog': const Color(0xff2D2D2D),
    'button': const Color(0xD9D9D9E0),
    'icon': const Color(0xD9D9D9E0),
    'chatBackground': const Color(0xff4B4B4B),
    'chatField': const Color(0xff2D2D2D),
    'lightGreen': const Color(0xff4BB609),
    'orange': const Color(0xffFF814A),
    'darkRed': const Color(0xffDF1C1C),
    'yellow': const Color(0xffE5B800),
    'fieldBorder': const Color(0xff797979),
  };

  static void setCurrentThemeColors() {
    AppColors.currentThemeColors =
        Get.isDarkMode ? lightThemeColors : darkThemeColors;
  }

  static Color contrastColor() {
    final double primaryLuminance = AppColors.primary.computeLuminance();
    final double secondaryPrimaryLuminance =
        AppColors.secondaryPrimary.computeLuminance();

    // Check if both colors are light or dark
    if (primaryLuminance > 0.5 && secondaryPrimaryLuminance > 0.5) {
      return AppColors.black; // Return black for light colors
    } else if (primaryLuminance <= 0.5 && secondaryPrimaryLuminance <= 0.5) {
      return AppColors.white; // Return white for dark colors
    } else {
      // If one color is light and the other is dark, return a contrasting color
      return AppColors.white; // Change this to the desired contrasting color
    }
  }
}

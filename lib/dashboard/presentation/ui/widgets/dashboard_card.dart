import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';

class DashboardCard extends StatelessWidget {
  final Color color;
  final String title;

  final int value;

  const DashboardCard({
    super.key,
    required this.color,
    required this.title,
    required this.value,
  });

  @override

  /// Builds a dashboard card widget.
  ///
  /// The card displays a title and a value, styled differently
  /// based on whether the device is a tablet.
  ///
  /// [context] is the build context in which the widget is built.
  ///
  /// Returns a [Container] widget styled to represent a card.
  Widget build(BuildContext context) {
    // Determine if the device is a tablet.
    var isTablet = context.isTablet;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.card, // Set the background color of the card.
        borderRadius: BorderRadius.circular(8.r), // Round the corners.
        border: Border.all(
          color: color, // Border color based on the provided color.
          width: 1.w, // Border width.
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w), // Padding inside the card.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center vertically.
          crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally.
          children: [
            Align(
              alignment: AlignmentDirectional.center,
              child: Text(
                title.tr, // Display the translated title.
                style: isTablet
                    ? AppTextStyles.font18BlackCairoMedium
                        .copyWith(color: color) // Tablet-specific styling.
                    : AppTextStyles.font16BlackMediumCairo
                        .copyWith(color: color), // Default styling.
              ),
            ),
            verticalSpace(isTablet ? 16 : 0), // Vertical spacing.
            Text(
              value.toString(), // Display the value.
              style: isTablet
                  ? AppTextStyles.font36MediumBlackCairo // Tablet styling.
                  : AppTextStyles.font23MediumBlackCairo, // Default styling.
            ),
            verticalSpace(isTablet ? 16 : 0), // Additional vertical spacing.
          ],
        ),
      ),
    );
  }
}

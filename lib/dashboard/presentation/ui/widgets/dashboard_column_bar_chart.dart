// Date: 29/9/2024
// By: Nada Mohammed
// Last update: 29/9/2024
// Objectives: This file is responsible for providing a widget that displays bar chart data in the dashboard.

// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../data/models/chart_data.dart';

class DashboardColumnBarChart extends StatelessWidget {
  final String title;
  final String titleIconAsset;
  final List<ChartData> data;

  const DashboardColumnBarChart({
    super.key,
    required this.title,
    required this.titleIconAsset,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return data.isEmpty
        ? const SizedBox()
        : Container(
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Padding(
                padding: EdgeInsets.all(8.w),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.primary,
                          radius: 13.r,
                          child: SvgPicture.asset(
                            titleIconAsset,
                            color: AppColors.icon,
                          ),
                        ),
                        horizontalSpace(4),
                        Text(
                          title,
                          style: AppTextStyles.font16BlackRegularCairo,
                        ),
                        const Spacer(),
                      ],
                    ),
                    verticalSpace(24),
                    Divider(
                      color: AppColors.chatBackground,
                      thickness: 1.w,
                    ),
                    verticalSpace(16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        width: data.length * Get.width / 11,
                        height: 500.h,
                        child: SfCartesianChart(
                          plotAreaBorderWidth: 0,
                          // isTransposed: true,
                          margin: EdgeInsets.zero,
                          backgroundColor: AppColors.card,
                          primaryXAxis: CategoryAxis(
                            labelStyle: AppTextStyles.font10BlackRegularInter,
                            majorTickLines: const MajorTickLines(size: 0),
                            axisLine: AxisLine(
                              color: AppColors.secondaryBlack,
                            ),
                            initialZoomPosition: 1,
                            majorGridLines: const MajorGridLines(width: 0),
                          ),
                          primaryYAxis: NumericAxis(
                            numberFormat: NumberFormat.compact(
                              locale: 'en',
                            ),
                            labelIntersectAction: AxisLabelIntersectAction.wrap,
                            majorTickLines: const MajorTickLines(
                              size: 0,
                            ),
                            axisLine: const AxisLine(color: Colors.transparent),
                            interval: 1,
                            majorGridLines: MajorGridLines(
                              //   width: 0.7.w,
                              color: AppColors.secondaryBlack,
                              dashArray: const <double>[5, 5],
                            ),
                          ),
                          series: <CartesianSeries<ChartData, String>>[
                            ColumnSeries<ChartData, String>(
                              animationDuration: 1000,
                              dataSource: data,
                              //use dataa to test long list
                              xValueMapper: (ChartData data, _) =>
                                  data.xAxisLabel,
                              yValueMapper: (ChartData data, _) =>
                                  data.yAxisLabel,
                              pointColorMapper: (ChartData data, _) =>
                                  AppColors.primary,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          );
  }
}

import 'dart:ui';

import 'package:complaints_application/core/shared/widgets/back_button.dart';
import 'package:complaints_application/features/details_complaint/presentation/bloc/details_complaint_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/Theme/app_colors.dart';
import '../../../../core/Theme/app_gradient.dart';
import '../../../../core/Theme/app_text_style.dart';
import '../../../../core/constants/colors/colors.dart';
import '../../../../core/constants/layout/app_padding.dart';
import '../../../../core/constants/layout/app_radius.dart';
import '../../../../core/constants/layout/app_space.dart';
import '../../../../core/constants/styles/text_styles.dart';
import '../../../../core/utils/helpers/size_config.dart';
import '../../../edit_complaint/presentation/pages/edit_complaint.dart';
import '../bloc/details_complaint_event.dart';
import '../bloc/details_complaint_state.dart';
import '../widgets/attachments_viewer.dart';

class DetailsComplaint extends StatefulWidget {
  final int complaintId;
  const DetailsComplaint({super.key, required this.complaintId});

  @override
  State<DetailsComplaint> createState() => _DetailsComplaintState();
}

class _DetailsComplaintState extends State<DetailsComplaint> {
  @override
  void initState() {
    super.initState();
    context.read<DetailsBloc>().add(LoadComplaintDetails(widget.complaintId));
  }

  @override
  Widget build(BuildContext context) {
    final gradients = Theme.of(context).extension<AppGradients>()!;
    final texts = Theme.of(context).extension<AppTextStyleTheme>()!;
    final colors = Theme.of(context).extension<AppColorsTheme>()!;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient:gradients.onboardingGradient    
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 45, left: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                           Row(
                              children: [
                                Text(
                                  'Complaint Details',
                                  style: texts.detTitle
                                ),
                              ],
                            ),
                          // Row(
                          //   children: [
                          //     Text(
                          //       'S',
                          //       style: TextStyle(
                          //         fontSize: 35,
                          //         fontWeight: FontWeight.bold,
                          //         color: AppColors.oliveGreen,
                          //         fontFamily: 'Arima',
                          //       ),
                          //     ),
                      
                          //     Text(
                          //       'hakwa \n yr',
                          //       style: TextStyle(
                          //         fontSize: 12,
                          //         fontWeight: FontWeight.bold,
                          //         color: AppColors.beige,
                          //         fontFamily: 'Arima',
                          //       ),
                          //     ),
                          //   ],
                          // ),
                      
                          SizedBox(width: SizeConfig.w(100)),
                          buildBackButton(context),
                        ],
                      ),
                         Divider(
                        thickness: 0.5,
                        indent: 2,
                        endIndent: 15,
                        color: AppColors.primaryColor,
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 675,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          children: [
                            // Row(
                            //   children: [
                            //     Text(
                            //       'Complaint Details',
                            //       style: texts.detTitle
                            //     ),
                            //   ],
                            // ),
                            SizedBox(height: SizeConfig.h(10)),
                            ClipRRect(
                              borderRadius: AppRadius.circularMedium,
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: SizeConfig.w(20),
                                  sigmaY: SizeConfig.h(20),
                                ),
                                child: Container(
                                  width: SizeConfig.w(350),
                                  height: SizeConfig.h(650),
                                  padding: AppPadding.allSmall,
                                  decoration: BoxDecoration(
                                    color: colors.cardBackground,
                                    borderRadius: AppRadius.circularMedium,
                                    border: Border.all(
                                      color: AppColors.whiteWithOpacity3,
                                      width: SizeConfig.w(1.5),
                                    ),
                                  ),
                                  child: SingleChildScrollView(
                                    child: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: BlocConsumer<DetailsBloc, DetailsState>(
                                        listener: (context, state) {
                                          if (state is DetailsFailure) {
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Directionality(
                                                  textDirection:
                                                      TextDirection.rtl,
                                                  child: Text(
                                                    state.message,
                                                    style: AppTextStyles
                                                        .smallBeigeStyle,
                                                  ),
                                                ),
                                                backgroundColor:
                                                    Colors.redAccent,
                                              ),
                                            );
                                          }
                                        },
                                        builder: (context, state) {
                                          if (state is DetailsLoading ||
                                              state is DetailsInitial) {
                                            return const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          } else if (state is DetailsLoaded) {
                                            final d = state.detail;
                                            return Directionality(
                                              textDirection: TextDirection.ltr,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Container(
                                                        alignment:
                                                            Alignment.center,
                                                        height: SizeConfig.h(
                                                          39,
                                                        ),
                                                        width: SizeConfig.w(95),
                                                        decoration: BoxDecoration(
                                                          color: AppColors
                                                              .oliveGreen,
                                                          borderRadius: AppRadius
                                                              .circularLarge,
                                                        ),
                                                        child: Text(
                                                          d.statusName,
                                                          style: AppTextStyles
                                                              .smallBeigeStyle,
                                                        ),
                                                      ),
                                                    
                                                      AppSpaces
                                                          .horizontalVerySmall,
                                                      SizedBox(
                                                        height: 37,
                                                        width: 85,
                                                        child: ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                            backgroundColor:
                                                                AppColors.beige,
                                                            shadowColor:
                                                                AppColors
                                                                    .oliveGreen,
                                                            elevation: 3,
                                                          ),
                                                          onPressed: () {
                                                            Navigator.pushReplacement(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder: (_) => EditComplaintPage(
                                                                  type:d.typeName,
                                                                  department:
                                                                      d.departmentName,
                                                                  location:
                                                                      d.location,
                                                                  description:
                                                                      d.problemDescription,
                                                                  complaintId:
                                                                      d.id,
                                                                       attachments: d.attachments,
                                                                ),
                                                              ),
                                                            );
                                                          },

                                                          child: Text(
                                                            'edit',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: AppColors
                                                                  .oliveGreen,
                                                              fontFamily:
                                                                  'Arima',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                  AppSpaces.verticalSmall,
                                                  AppSpaces.verticalSmall,
                                                  Text(
                                                    'Complaint Direction:',
                                                    style: TextStyle(
                                                      color:
                                                          AppColors.oliveGreen,
                                                      fontFamily: 'Arima',
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  AppSpaces.verticalTiny,
                                                  Text(
                                                    d.departmentName,
                                                    style: AppTextStyles
                                                        .medBeigeStyle,
                                                  ),
                                                  AppSpaces.verticalMedSmall,

                                                  Text(
                                                    "Complaint Type:",
                                                    style: TextStyle(
                                                      color:
                                                          AppColors.oliveGreen,
                                                      fontFamily: 'Arima',
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),

                                                  AppSpaces.verticalTiny,
                                                  Text(
                                                    d.typeName,
                                                    style: AppTextStyles
                                                        .medBeigeStyle,
                                                  ),
                                                  AppSpaces.verticalVeryMedium,

                                                  Text(
                                                    'Discription',
                                                    style: TextStyle(
                                                      color:
                                                          AppColors.oliveGreen,
                                                      fontFamily: 'Arima',
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  AppSpaces.verticalVerySmall,
                                                  Padding(
                                                    padding: AppPadding
                                                        .symmetricHorizontalVerySmall,
                                                    child: Container(
                                                      constraints:
                                                          BoxConstraints(
                                                            maxHeight: 135,
                                                          ),
                                                      child: SingleChildScrollView(
                                                        child: Text(
                                                          d.problemDescription,
                                                          style: AppTextStyles
                                                              .medBeigeStyle,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  AppSpaces.verticalVeryMedium,
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.location_on,
                                                        color: AppColors
                                                            .oliveGreen,
                                                        size: SizeConfig.w(
                                                          22.5,
                                                        ),
                                                      ),
                                                      AppSpaces
                                                          .horizontalVerySmall,
                                                      Text(
                                                        d.location,
                                                        style: AppTextStyles
                                                            .medBeigeStyle,
                                                      ),
                                                    ],
                                                  ),

                                                  // AppSpaces.verticalMedSmall,
                                                  AppSpaces.verticalSmall,
                                                  Divider(
                                                    thickness: 0.2,
                                                    indent: 10,
                                                    endIndent: 10,
                                                    color: AppColors.oliveGreen,
                                                  ),
                                                  AppSpaces.verticalSmall,
                                                  Text(
                                                    'Attachments',
                                                    style: TextStyle(
                                                      color:
                                                          AppColors.oliveGreen,
                                                      fontFamily: 'Arima',
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  AppSpaces.verticalSmall,

                                                  AttachmentsViewer(
                                                    attachments: d.attachments,
                                                  ),
                                                ],
                                              ),
                                            );
                                          } else if (state is DetailsFailure) {
                                            return Center(
                                              child: Text(
                                                'حدث خطأ: ${state.message}',
                                                style:
                                                    AppTextStyles.medBeigeStyle,
                                              ),
                                            );
                                          } else {
                                            return const SizedBox.shrink();
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:ui';

import 'package:complaints_application/core/shared/pages/background_with_logo.dart';
import 'package:complaints_application/core/shared/widgets/back_button.dart';
import 'package:complaints_application/features/details_complaint/presentation/bloc/details_complaint_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/colors/colors.dart';
import '../../../../core/constants/layout/app_padding.dart';
import '../../../../core/constants/layout/app_radius.dart';
import '../../../../core/constants/layout/app_space.dart';
import '../../../../core/constants/strings/texts.dart';
import '../../../../core/constants/styles/text_styles.dart';
import '../../../../core/utils/helpers/size_config.dart';
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
    // Load details
    context.read<DetailsBloc>().add(LoadComplaintDetails(widget.complaintId));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BackgroundWithLogo(
        icon: buildBackButton(context),
        appbarName: AppTexts.details,
        padding: AppPadding.onlyTopLargeAndLeftVeryMed,
        useListview: true,
        child: Center(
          child: ClipRRect(
            borderRadius: AppRadius.circularMedium,
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: SizeConfig.w(20),
                sigmaY: SizeConfig.h(20),
              ),
              child: Container(
                width: SizeConfig.w(364),
                height: SizeConfig.h(450),
                padding: AppPadding.allSmall,
                decoration: BoxDecoration(
                  color: AppColors.whiteWithOpacity15,
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
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Text(
                                  state.message,
                                  style: AppTextStyles.smallBeigeStyle,
                                ),
                              ),
                              backgroundColor: Colors.redAccent,
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is DetailsLoading || state is DetailsInitial) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (state is DetailsLoaded) {
                          final d = state.detail;
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: SizeConfig.h(39),
                                    width: SizeConfig.w(95),
                                    decoration: BoxDecoration(
                                      color: AppColors.oliveGreen,
                                      borderRadius: AppRadius.circularLarge,
                                    ),
                                    child: Text(
                                      d.statusName,
                                      style: AppTextStyles.smallBeigeStyle,
                                    ),
                                  ),
                                ],
                              ),
      
                              AppSpaces.verticalVerySmall,
                              Text(
                                AppTexts.direction,
                                style: AppTextStyles.veryMedBeigeStyle,
                              ),
                              AppSpaces.verticalTiny,
                              Text(
                                d.departmentName,
                                style: AppTextStyles.largeWhite70Style,
                              ),
                              AppSpaces.verticalMedSmall,
      
                              Text(
                                AppTexts.type,
                                style: AppTextStyles.veryMedBeigeStyle,
                              ),
      
                              AppSpaces.verticalTiny,
                              Text(
                                d.typeName,
                                style: AppTextStyles.largeWhite70Style,
                              ),
                              AppSpaces.verticalVeryMedium,
      
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: AppColors.oliveGreen,
                                    size: SizeConfig.w(22.5),
                                  ),
                                  AppSpaces.horizontalVerySmall,
                                  Text(
                                    d.location,
                                    style: AppTextStyles.largeWhite70Style,
                                  ),
                                ],
                              ),
                              AppSpaces.verticalVeryMedium,
                              Text(
                                'الوصف',
                                style: AppTextStyles.veryMedBeigeStyle,
                              ),
                              AppSpaces.verticalVerySmall,
                              Padding(
                                padding: AppPadding.symmetricHorizontalVerySmall,
                                child: Container(
                                  constraints: BoxConstraints(maxHeight: 135),
                                  child: SingleChildScrollView(
                                    child: Text(
                                      d.problemDescription,
                                      style: AppTextStyles.medWhite70Style,
                                    ),
                                  ),
                                ),
                              ),
                              AppSpaces.verticalMedSmall,
                              Text(
                                'المرفقات',
                                style: AppTextStyles.veryMedBeigeStyle,
                              ),
                              AppSpaces.verticalSmall,
      
                              AttachmentsViewer(attachments: d.attachments),
                            ],
                          );
                        } else if (state is DetailsFailure) {
                          return Center(
                            child: Text(
                              'حدث خطأ: ${state.message}',
                              style: AppTextStyles.medBeigeStyle,
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
        ),
      ),
    );
  }
}



// import 'package:flutter_bloc/flutter_bloc.dart';


// class DetailsComplaint extends StatefulWidget {
//   final int complaintId;
//   const DetailsComplaint({super.key, required this.complaintId});

//   @override
//   State<DetailsComplaint> createState() => _DetailsComplaintState();
// }

// class _DetailsComplaintState extends State<DetailsComplaint> {
//   @override
//   void initState() {
//     super.initState();
//     // Load details
//     context.read<DetailsBloc>().add(LoadComplaintDetails(widget.complaintId));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.amber,
//       body: SafeArea(
//         child: BlocConsumer<DetailsBloc, DetailsState>(
//           listener: (context, state) {
//             if (state is DetailsFailure) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text(state.message), backgroundColor: Colors.red),
//               );
//             }
//           },
//           builder: (context, state) {
//             if (state is DetailsLoading || state is DetailsInitial) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (state is DetailsLoaded) {
//               final d = state.detail;
//               return SingleChildScrollView(
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(d.statusName, style: AppTextStyles.largeWhite70Style),
//                     AppSpaces.verticalVeryMedium,
//                     Text('الوصف', style: AppTextStyles.veryMedBeigeStyle),
//                     AppSpaces.verticalVerySmall,
//                     Container(
//                       constraints: const BoxConstraints(maxHeight: 135),
//                       child: SingleChildScrollView(
//                         child: Text(d.problemDescription, style: AppTextStyles.medWhite70Style),
//                       ),
//                     ),
//                     AppSpaces.verticalMedSmall,
//                     Text('المرفقات', style: AppTextStyles.veryMedBeigeStyle),
//                     AppSpaces.verticalSmall,
//                     AttachmentsViewer(attachments: d.attachments),
//                     // أي عناصر إضافية: نوع، قسم، موقع، ...
//                     AppSpaces.verticalVeryMedium,
//                     Text('النوع: ${d.typeName}', style: AppTextStyles.medWhite70Style),
//                     Text('القسم: ${d.departmentName}', style: AppTextStyles.medWhite70Style),
//                     Text('الموقع: ${d.location}', style: AppTextStyles.medWhite70Style),
//                   ],
//                 ),
//               );
//             } else if (state is DetailsFailure) {
//               return Center(child: Text('حدث خطأ: ${state.message}', style: AppTextStyles.medWhite70Style));
//             } else {
//               return const SizedBox.shrink();
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
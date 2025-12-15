import 'package:complaints_application/core/constants/strings/texts.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/colors/colors.dart';
import '../../../../core/constants/layout/app_padding.dart';
import '../../../../core/constants/layout/app_radius.dart';
import '../../../../core/constants/layout/app_space.dart';
import '../../../../core/constants/styles/text_styles.dart';
import '../../../../core/utils/helpers/size_config.dart';



import '../../../details_complaint/presentation/pages/details_complaint.dart';
import '../../domain/entities/my_complaints_entity.dart';


class ComplaintCard extends StatelessWidget {
  final ComplaintEntity complaint;
  const ComplaintCard({super.key, required this.complaint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.allVerySmall,
      child: Container(
        width: SizeConfig.w(200),
        height: SizeConfig.h(220),
        decoration: BoxDecoration(
          borderRadius: AppRadius.circularMedium,
          color: AppColors.beige.withOpacity(0.15),
          border: Border.all(
            color: AppColors.whiteWithOpacity3,
            width: SizeConfig.w(1.5),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {

                    //  GoRouter.of(context).push('/MyComplaints/DetailsComplaint');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailsComplaint(complaintId: complaint.id),
                      ),
                    );
                    
                  },
                  icon: Icon(
                    Icons.directions,
                    color: AppColors.oliveGreen,
                    size: SizeConfig.h(28),
                  ),
                ),
                Text('تفاصيل', style: AppTextStyles.verySmallWhite70Style),
                Spacer(),
                Container(
                  alignment: Alignment.center,
                  height: SizeConfig.h(43),
                  width: SizeConfig.w(55),
                  decoration: BoxDecoration(
                    color: AppColors.oliveGreen,
                    shape: BoxShape.rectangle,
                    borderRadius: AppRadius.circularMedium,
                  ),
                  child: Text('${complaint.id}', style: AppTextStyles.medBeigeStyle),
                ),
              ],
            ),

            Padding(
              padding: AppPadding.onlyRightSmall,
              child: Row(
                children: [
                  Text(AppTexts.direction, style: AppTextStyles.medBeigeStyle),
                  AppSpaces.horizontalVerySmall,
                  Expanded(child: Text(complaint.departmentName, style: AppTextStyles.medWhite70Style)),
                ],
              ),
            ),
            AppSpaces.verticalVerySmall,
            Padding(
              padding: AppPadding.onlyRightSmall,
              child: Row(
                children: [
                  Text(AppTexts.type, style: AppTextStyles.medBeigeStyle),
                  AppSpaces.horizontalVerySmall,
                  Text(complaint.typeName, style: AppTextStyles.medWhite70Style),
                ],
              ),
            ),
            AppSpaces.verticalVerySmall,
            Padding(
              padding: AppPadding.onlyRightSmall,
              child: Row(
                children: [
                  Icon(Icons.location_on, color: AppColors.oliveGreen, size: SizeConfig.w(21)),
                  AppSpaces.horizontalVerySmall,
                  Expanded(child: Text(complaint.location, style: AppTextStyles.medWhite70Style)),
                ],
              ),
            ),
            AppSpaces.verticalMedium,
            Container(
              alignment: Alignment.center,
              height: SizeConfig.h(39),
              width: SizeConfig.w(100),
              decoration: BoxDecoration(
                color: AppColors.oliveGreen,
                borderRadius: AppRadius.circularLarge,
              ),
              child: Text(complaint.statusName, style: AppTextStyles.smallBeigeStyle),
            ),
            Divider(color: AppColors.oliveGreen, height: SizeConfig.h(7.5), indent: SizeConfig.w(75), endIndent: SizeConfig.w(75)),
          ],
        ),
      ),
    );
  }
}
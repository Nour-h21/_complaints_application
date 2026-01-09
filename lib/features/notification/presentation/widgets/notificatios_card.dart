import 'package:complaints_application/core/constants/layout/app_space.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/colors/colors.dart';
import '../../../../core/constants/layout/app_padding.dart';
import '../../../../core/constants/layout/app_radius.dart';
import '../../../../core/constants/styles/text_styles.dart';
import '../../../../core/utils/helpers/size_config.dart';
import '../../domain/entities/notifications_entity.dart';

class NotificatiosCard extends StatelessWidget {
  final NotificationEntity notifications;
  const NotificatiosCard({super.key, required this.notifications});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        width: SizeConfig.w(200),
        height: SizeConfig.h(100),//220
        decoration: BoxDecoration(
          borderRadius: AppRadius.circularSmall,
          color: AppColors.beige.withOpacity(0.15),
          border: Border.all(
            color: AppColors.whiteWithOpacity3,
            width: SizeConfig.w(1.5),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSpaces.verticalTiny,
               Text(
                notifications.body,
                style: AppTextStyles.smallOliveGreen2Style,
              ),
              AppSpaces.verticalTiny,
              Text(
                notifications.title,
                style: AppTextStyles.medWhite70Style,
              ),
                AppSpaces.verticalTiny,
            ],
          ),
        ),
      ),
    );
  }
}

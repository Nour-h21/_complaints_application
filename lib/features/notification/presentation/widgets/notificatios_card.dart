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
    return Container(
      width: SizeConfig.w(200),
      height: SizeConfig.h(50),//220
      decoration: BoxDecoration(
        borderRadius: AppRadius.circularMedium,
        color: AppColors.beige.withOpacity(0.15),
        border: Border.all(
          color: AppColors.whiteWithOpacity3,
          width: SizeConfig.w(1.5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            notifications.title,
            style: AppTextStyles.medWhite70Style,
          ),
        ],
      ),
    );
  }
}

import 'package:complaints_application/core/constants/colors/colors.dart';
import 'package:complaints_application/core/constants/layout/app_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/bloc/unread_count_bloc.dart';
import '../bloc/bloc/unread_count_event.dart';
import '../bloc/bloc/unread_count_state.dart';

class NotificationsIconButton extends StatelessWidget {
  const NotificationsIconButton({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UnreadCountBloc, UnreadCountState>(
      builder: (context, state) {
        int count = 0;
        if (state is UnreadCountLoaded) count = state.count;
    
        return Stack(
          children: [
            IconButton(
      icon: Icon(Icons.notifications , color: AppColors.beige,),
      onPressed: () async {
        await context.push('/Notifications');
    
        context
      .read<UnreadCountBloc>()
      .add(FetchUnreadCountEvent());
      },
    ),
            if (count > 0)
              Positioned(
                right: 6,
                top: 6,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColors.red,
                    // borderRadius: BorderRadius.circular(25),//12
                    borderRadius: AppRadius.circularMedium,
                  ),
                  constraints:
                      const BoxConstraints(minWidth: 10, minHeight: 10),//18
                  child: Text(
                    '$count',
                    style: TextStyle(
                      color: AppColors.primaryColor,//white
                      fontSize: 10,//11
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
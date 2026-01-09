import 'package:complaints_application/core/Theme/app_theme.dart';
import 'package:complaints_application/core/constants/layout/app_space.dart';
import 'package:complaints_application/features/settings/bloc/theme_bloc.dart';
import 'package:complaints_application/features/settings/bloc/theme_event.dart';
import 'package:complaints_application/features/settings/localization_bloc/bloc/translate_bloc.dart';
import 'package:complaints_application/features/settings/localization_bloc/bloc/translate_event.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/Theme/app_colors.dart';
import '../../core/Theme/app_gradient.dart';
import '../../core/Theme/app_text_style.dart';
import '../../core/constants/colors/colors.dart';
import '../../core/shared/widgets/back_button.dart';
import '../../core/utils/helpers/size_config.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLang = context
        .watch<LocalizationBloc>()
        .state
        .locale
        .languageCode;
    final gradients = Theme.of(context).extension<AppGradients>()!;
    final texts = Theme.of(context).extension<AppTextStyleTheme>()!;
    final colors = Theme.of(context).extension<AppColorsTheme>()!;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(gradient: gradients.onboardingGradient),
          ),

          Padding(
            padding: EdgeInsets.only(top: 45, left: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.settings, color: AppColors.beige),
                    Text(
                      'Settings',
                      textAlign: TextAlign.center,
                      style: texts.addTitle,
                    ),

                    SizedBox(width: SizeConfig.w(200)),
                    buildBackButton(context),
                  ],
                ),
                Divider(
                  thickness: 0.5,
                  indent: 2,
                  endIndent: 15,
                  color: AppColors.primaryColor,
                ),
                AppSpaces.verticalMedium,

                Padding(
                  padding: EdgeInsets.only(left: 2, right: 12),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 70,
                        child: Card(
                          color: colors.cardBackground,
                          shadowColor: AppColors.armyGreen2,
                          elevation: 10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Dark mode', style: texts.settingTitle),
                              AppSpaces.horizontalMedium,
                              BlocBuilder<ThemeBloc, ThemeData>(
                                builder: (context, state) {
                                  return Switch(
                                    activeColor: AppColors.oliveGreen,
                                    value: state == AppTheme.darkTheme,
                                    onChanged: (value) {
                                      context.read<ThemeBloc>().add(
                                        ChangeThemeEvent(),
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      AppSpaces.verticalMedSmall,
                      SizedBox(
                        height: 70,
                        child: Card(
                          color: colors.cardBackground,
                          shadowColor: AppColors.armyGreen2,
                          elevation: 10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Arabic language',
                                style: texts.settingTitle,
                              ),
                              SizedBox(width: SizeConfig.w(20)),
                              BlocBuilder<ThemeBloc, ThemeData>(
                                builder: (context, state) {
                                  return Switch(
                                    activeColor: AppColors.oliveGreen,
                                    value: state == AppTheme.darkTheme,
                                    onChanged: (value) {
                                      context.read<ThemeBloc>().add(
                                        ChangeThemeEvent(),
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      AppSpaces.verticalMedSmall,
                      SizedBox(
                        height: 70,
                        child: Card(
                          color: colors.cardBackground,
                          shadowColor: AppColors.armyGreen2,
                          elevation: 10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Log out', style: texts.settingTitle),
                              SizedBox(width: SizeConfig.w(120)),
                              BlocBuilder<ThemeBloc, ThemeData>(
                                builder: (context, state) {
                                  return Icon(
                                    Icons.logout_outlined,
                                    color: colors.iconColor,
                                    size: 30,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),

                      ListTile(
                        title: const Text('arabic').tr(),
                        trailing: currentLang == 'ar'
                            ? const Icon(Icons.check)
                            : null,
                        onTap: () {
                          context.read<LocalizationBloc>().add(
                            const ChangeLanguage(Locale('ar', 'AR')),
                          );
                        },
                      ),
                      ListTile(
                        title: const Text('english').tr(),
                        trailing: currentLang == 'en'
                            ? const Icon(Icons.check)
                            : null,
                        onTap: () {
                          context.read<LocalizationBloc>().add(
                            const ChangeLanguage(Locale('en', 'US')),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

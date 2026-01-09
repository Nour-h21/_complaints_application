import 'package:complaints_application/features/add_complaint/presentation/pages/add_complaint.dart';
import 'package:complaints_application/features/my_complaints/presentation/pages/my_complaints.dart';
import 'package:complaints_application/features/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/di/injection_container.dart';
import '../../../../core/Theme/app_colors.dart';
import '../../../../core/Theme/app_gradient.dart';
import '../../../../core/Theme/app_text_style.dart';
import '../../../../core/constants/colors/colors.dart';
import '../../../logout/presentation/bloc/logout_bloc.dart';

class NavicationBar extends StatefulWidget {
  const NavicationBar({super.key});

  @override
  State<NavicationBar> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<NavicationBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    // GoRouter.go('/MyComplaints'),
    MyComplaints(),
    AddComplaint(),
   BlocProvider(create: (context) => getIt<LogoutBloc>(),
        child: Settings(),),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final gradients = Theme.of(context).extension<AppGradients>()!;
    final texts = Theme.of(context).extension<AppTextStyleTheme>()!;
    final colors = Theme.of(context).extension<AppColorsTheme>()!;
    return Scaffold(
      body: _pages[_selectedIndex],
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _selectedIndex = 1;
          });
        },
        backgroundColor: colors.floatingButtonBackground,
        foregroundColor: AppColors.beige,
        splashColor: colors.floatingButtonSplashColor,
        elevation: 8,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, size: 30),
      ),
      bottomNavigationBar: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.offWhite, AppColors.lowGreen],
          ),
        ),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 6,
          height: 69,
          color: colors.navBrrBackground,
          child: SizedBox(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // العنصر الأول
                Expanded(
                  child: _buildNavItem(
                    icon: Icons.home_rounded,
                    label: 'Home',
                    index: 0,
                  ),
                ),

                // مسافة للزر البارز
                const Expanded(child: SizedBox()),

                // العنصر الرابع
                Expanded(
                  child: _buildNavItem(
                    icon: Icons.settings_rounded,
                    label: 'Settings',
                    index: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final isSelected = _selectedIndex == index;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _onItemTapped(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.oliveGreen : AppColors.offWhite,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Arima',
                fontWeight: FontWeight.w600,
                color: isSelected ? AppColors.oliveGreen : AppColors.offWhite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

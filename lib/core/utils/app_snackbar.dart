import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:subspace_task/core/app/app_colors.dart';

enum SnackType { success, info }

class AppSnack {
  static void success(
    BuildContext context,
    String message, [
    DesktopSnackBarPosition? position,
  ]) {
    AnimatedSnackBar(
      mobilePositionSettings: const MobilePositionSettings(
        topOnAppearance: 60,
      ),
      desktopSnackBarPosition: position ?? DesktopSnackBarPosition.topCenter,
      duration: const Duration(seconds: 2),
      builder: (context) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.green.shade400,
            borderRadius: BorderRadius.circular(3.w),
          ),
          child: ListTile(
            leading: const Icon(
              Icons.done,
              color: AppColors.whiteColor,
            ),
            title: Text(
              message,
              style: const TextStyle(color: AppColors.whiteColor),
            ),
          ),
        );
      },
    ).show(context);
  }

  static void info(
    BuildContext context,
    String message, [
    DesktopSnackBarPosition? position,
  ]) {
    AnimatedSnackBar(
      mobilePositionSettings: const MobilePositionSettings(
        topOnAppearance: 60,
      ),
      desktopSnackBarPosition: position ?? DesktopSnackBarPosition.topCenter,
      duration: const Duration(seconds: 2),
      builder: (context) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.grey.shade400,
            borderRadius: BorderRadius.circular(3.w),
          ),
          child: ListTile(
            leading: const Icon(
              Icons.info,
              color: AppColors.whiteColor,
            ),
            title: Text(
              message,
              style: const TextStyle(color: AppColors.whiteColor),
            ),
          ),
        );
      },
    ).show(context);
  }
}

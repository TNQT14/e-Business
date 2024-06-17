import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/values/app_colors.dart';
import 'app_colors.dart';

abstract class AppStyles {

    static const txt12BoldWhite = TextStyle(
    fontFamily: 'Manrope',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static const txt12Bold = TextStyle(
    fontFamily: 'Manrope',
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );
  static const txt12Medium = TextStyle(
    fontFamily: 'Manrope',
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
  static const txt14MediumBlack200 = TextStyle(
    fontFamily: 'Manrope',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.black200,
  );

  static const txt14SemiBoldBlack300 = TextStyle(
    fontFamily: 'Manrope',
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.black300,
  );
  static const txt14SemiBoldGrey300 = TextStyle(
    fontFamily: 'Quicksand',
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Color(0xFF6e7f91),
  );

  static const txt14SemiBoldGreen1 = TextStyle(
    fontFamily: 'Manrope',
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.green1,
  );

  static const txt14SemiBoldRed = TextStyle(
    fontFamily: 'Manrope',
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.red,
  );

  static const txt16SemiBoldWhite = TextStyle(
    fontFamily: 'Quicksand',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static const txt16Bold = TextStyle(
    fontFamily: 'Manrope',
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  static const txt16BoldBlack300 = TextStyle(
    fontFamily: 'Manrope',
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.black300,
  );

  static const txt16BoldWhite = TextStyle(
    fontFamily: 'Manrope',
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static const txt16MediumBlack200 = TextStyle(
    fontFamily: 'Manrope',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.black200,
  );

  static const txt16MediumBlack300 = TextStyle(
    fontFamily: 'Manrope',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.black300,
  );

  static const txt16Regular = TextStyle(
    fontFamily: 'Manrope',
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const txt16SemiBold = TextStyle(
    fontFamily: 'Manrope',
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const txt16SemiBold700 = TextStyle(
    fontFamily: 'Manrope',
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  static const txt16SemiBold800 = TextStyle(
    fontFamily: 'Quicksand',
    fontSize: 16,
    fontWeight: FontWeight.w800,
  );

  static const txt16SemiBold500 = TextStyle(
    fontFamily: 'Manrope',
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const txt16SemiBoldBlack200 = TextStyle(
    fontFamily: 'Manrope',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.black200,
  );

  static const txt16SemiBoldBlack300 = TextStyle(
    fontFamily: 'Manrope',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.black300,
  );

  static const txt18Bold = TextStyle(
    fontFamily: 'Manrope',
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );

  static const txt18Bold600 = TextStyle(
    fontFamily: 'Manrope',
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static const txt18BoldDarkBlue = TextStyle(
    fontFamily: 'Manrope',
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.darkBlue,
  );

  static const txt18BoldWhite = TextStyle(
    fontFamily: 'Manrope',
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static const txt18BoldBlack = TextStyle(
    fontFamily: 'Manrope',
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static const txt18MediumBlack300 = TextStyle(
    fontFamily: 'Manrope',
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.black300,
  );

  static const txt18RegularDarkBlue = TextStyle(
    fontFamily: 'Manrope',
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.darkBlue,
  );
  static const txt18RegularBlack = TextStyle(
    fontFamily: 'Quicksand',
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );

  static const txt18SemiBoldWhite = TextStyle(
    fontFamily: 'Manrope',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static const txt18SemiBold700 = TextStyle(
    fontFamily: 'Manrope',
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );

  static const txt20BoldMainColor = TextStyle(
    fontFamily: 'Manrope',
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.mainColor,
  );

  static const txt20BoldWhite = TextStyle(
    fontFamily: 'Manrope',
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static const txt20SemiBoldDarkBlue = TextStyle(
    fontFamily: 'Manrope',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.darkBlue,
  );

  static const txt28BoldDarkBlue = TextStyle(
    fontFamily: 'Manrope',
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: AppColors.darkBlue,
  );

  static const txt32MediumBlack200 = TextStyle(
    fontFamily: 'Manrope',
    fontSize: 32,
    fontWeight: FontWeight.w500,
    color: AppColors.black200,
  );

  static const txt32MediumBlack200Anton = TextStyle(
    fontFamily: 'Anton',
    fontSize: 32,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

    static TextStyle font24Blue700Weight = TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w700,
      color: ColorsManager.mainBlue,
    );

    static TextStyle font14Blue400Weight = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: ColorsManager.mainBlue,
    );

    static TextStyle font16White600Weight = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );
    static TextStyle font13Grey400Weight = TextStyle(
      fontSize: 13.sp,
      fontWeight: FontWeight.w400,
      color: ColorsManager.gray,
    );
    static TextStyle font14Grey400Weight = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: ColorsManager.gray,
    );
    static TextStyle font14Hint500Weight = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: ColorsManager.gray76,
    );
    static TextStyle font14DarkBlue500Weight = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: ColorsManager.darkBlue,
    );
    static TextStyle font15DarkBlue500Weight = TextStyle(
      fontSize: 15.sp,
      fontWeight: FontWeight.w500,
      color: ColorsManager.darkBlue,
    );
    static TextStyle font11DarkBlue500Weight = TextStyle(
      fontSize: 11.sp,
      fontWeight: FontWeight.w500,
      color: ColorsManager.darkBlue,
    );
    static TextStyle font11DarkBlue400Weight = TextStyle(
      fontSize: 11.sp,
      fontWeight: FontWeight.w400,
      color: ColorsManager.darkBlue,
    );
    static TextStyle font11Blue600Weight = TextStyle(
      fontSize: 11.sp,
      fontWeight: FontWeight.w600,
      color: ColorsManager.mainBlue,
    );
    static TextStyle font11MediumLightShadeOfGray400Weight = TextStyle(
      fontSize: 11.sp,
      fontWeight: FontWeight.w400,
      color: ColorsManager.mediumLightShadeOfGray,
    );
}

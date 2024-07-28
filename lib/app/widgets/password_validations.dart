import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../theme/app_colors.dart';
import '../theme/app_style.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasMinLength;
  const PasswordValidations({super.key, required this.hasMinLength});

  @override
  Widget build(BuildContext context) {
    return buildValidationRow('Ít nhất 6 kí tự', hasMinLength);
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 2.5,
          backgroundColor: ColorsManager.gray,
        ),
        Gap(6.w),
        Text(
          text,
          style: AppStyles.font14DarkBlue500Weight.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2,
            color: hasValidated ? ColorsManager.gray : ColorsManager.darkBlue,
          ),
        )
      ],
    );
  }
}

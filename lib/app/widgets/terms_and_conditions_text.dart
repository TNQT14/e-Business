import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_style.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Bằng cách đăng nhập, bạn đồng ý với chúng tôi',
            style: AppStyles.font11MediumLightShadeOfGray400Weight,
          ),
          TextSpan(
            text: ' Điều khoản và điều kiện',
            style: AppStyles.font11DarkBlue500Weight,
          ),
          TextSpan(
            text: ' và',
            style: AppStyles.font11MediumLightShadeOfGray400Weight
                .copyWith(height: 4.h),
          ),
          TextSpan(
            text: ' Chính sách bảo mật.',
            style: AppStyles.font11DarkBlue500Weight,
          ),
        ],
      ),
    );
  }
}

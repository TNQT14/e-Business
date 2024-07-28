import 'package:flutter/material.dart';
import '../../../../helpers/extensions.dart';
import '../../../../routes/app_routes.dart';
import '../../../../theme/app_style.dart';

class DoNotHaveAccountText extends StatelessWidget {
  const DoNotHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(AppRoutes.signupScreen);
      },
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Nếu bạn chưa có tài khoản?',
              style: AppStyles.font11DarkBlue400Weight,
            ),
            TextSpan(
              text: ' Đăng ký',
              style: AppStyles.font11Blue600Weight,
            ),
          ],
        ),
      ),
    );
  }
}

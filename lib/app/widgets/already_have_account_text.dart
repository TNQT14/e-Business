import 'package:ebusiness/app/helpers/extensions.dart';
import 'package:ebusiness/app/theme/app_style.dart';
import 'package:flutter/material.dart';

import '../routes/app_routes.dart';


class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamedAndRemoveUntil(
          AppRoutes.loginScreen,
          predicate: (route) => false,
        );
      },
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Already have an account?',
              style: AppStyles.font11DarkBlue400Weight,
            ),
            TextSpan(
              text: ' Login',
              style: AppStyles.font11Blue600Weight,
            ),
          ],
        ),
      ),
    );
  }
}

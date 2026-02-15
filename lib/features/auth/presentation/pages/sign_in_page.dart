import 'package:flutter/material.dart';
import '../../../../core/utils/responsive_layout.dart';
import '../mobile/auth_mobile_navigation.dart';
import '../web/sign_in_web.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobile: AuthMobileNavigation(),
      desktop: SignInWeb(),
    );
  }
}

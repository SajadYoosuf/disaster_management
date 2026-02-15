import 'package:flutter/material.dart';
import 'auth_selection_screen.dart';

class AuthMobileNavigation extends StatelessWidget {
  const AuthMobileNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Navigator(onGenerateRoute: _onGenerateRoute);
  }

  static Route<dynamic> _onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const AuthSelectionScreen());
  }
}

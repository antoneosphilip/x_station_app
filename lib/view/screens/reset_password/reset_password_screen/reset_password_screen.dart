
import 'package:flutter/material.dart';

import '../reset_password_widget/reset_password_widget.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: ResetPasswordWidget()
      ),
    );
  }
}
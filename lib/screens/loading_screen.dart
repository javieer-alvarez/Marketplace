import 'package:flutter/material.dart';
import 'package:productos_app/themes/app_theme.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: Center(
        child: CircularProgressIndicator(
          color: AppTheme.primary,
        ),
      ),
    );
  }
}

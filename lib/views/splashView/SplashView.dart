import 'package:flutter/material.dart';

import '../../data/Exceptions/AppExceptions.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Splash View'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          throw UnauthorisedException();
        },
        child: const Icon(Icons.add),
      )
    );
  }
}

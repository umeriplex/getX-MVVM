import 'package:flutter/material.dart';

class InterNetExceptionWidget extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const InterNetExceptionWidget({Key? key, required this.message, required this.onRetry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              message,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: onRetry,
              child: const Text("Retry"),
            )
          ],
        ),
      ),
    );
  }
}
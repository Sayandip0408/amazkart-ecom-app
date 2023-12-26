import 'package:amazkart/screens/homeScreen.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class OrderSuccess extends StatelessWidget {
  const OrderSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Order placed successfully", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),),
            Image.asset("images/Completed.png"),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const HomeScreen()));
                },
                child: const Text("Back to Home"))
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Image.asset('assets/images/chillguy.jpg')
            ,
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.primary,
              child: Center(
                child: Text(
                  'I am just a chill guy!',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

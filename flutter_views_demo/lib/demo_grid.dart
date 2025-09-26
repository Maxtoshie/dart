import 'package:flutter/material.dart';

class DemoGrid extends StatelessWidget {
  const DemoGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: 4, // Add more if you have more images
      itemBuilder: (context, index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          child: Card(
            elevation: 4,
            child: Image.asset(
              'assets/images/image${index + 1}.jpg',
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';

class NewHomeImageSection extends StatelessWidget {
  final String imagePath;
  final String title;

  const NewHomeImageSection(
      {super.key, required this.imagePath, required this.title});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: Theme.of(context).textTheme.bodyLarge),
              const Icon(
                Icons.menu,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Image.asset(imagePath),
        ),
        const SizedBox(
          height: 24,
        )
      ],
    );
  }
}

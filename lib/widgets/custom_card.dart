import 'package:flutter/material.dart';
import '../models/item_model.dart';

class CustomCard extends StatelessWidget {
  final Item item;

  const CustomCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(item.description),
          ],
        ),
      ),
    );
  }
}

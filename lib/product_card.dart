import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: 
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium,),
          const SizedBox(height: 5.0,),
          Text("$price", style: Theme.of(context).textTheme.bodySmall,),
          SizedBox(height: 5.0,),
          Image.asset(image,height: 175,)

        ],
      ),
    );
  }
}
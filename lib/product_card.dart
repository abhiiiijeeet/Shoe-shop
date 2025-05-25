import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final Color backgroundColor;
  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.backgroundColor
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
      color: backgroundColor,),
      child: 
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium,),
          const SizedBox(height: 5.0,),
          Text("\$$price", style: Theme.of(context).textTheme.bodySmall,),
          SizedBox(height: 5.0,),
          Center(child: Image.asset(image,height: 175,))
      
        ],
      ),
    );
  }
}
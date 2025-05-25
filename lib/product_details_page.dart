import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:shopping_app/global_variables.dart';

class ProductDetailsPage extends StatelessWidget {

  final Map<String,Object> product;
  const ProductDetailsPage({
    super.key,
    required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(product["name"] as String,
          style: Theme.of(context).textTheme.titleLarge,),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(product["imageUrl"] as String),
          ),
          Spacer(flex: 2,),
          Container(
            height: 250,
            decoration: BoxDecoration(color: Color.fromRGBO(245, 247, 249, 1),
            borderRadius: BorderRadius.circular(40)),
            child: Column(
              children: [
                Text(
                  '\$${product['price']}',
                  style: Theme.of(context).textTheme.titleLarge,),
                  SizedBox(height: 10,),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (product['sizes'] as List<int>).length,
                      itemBuilder: (context, index) {
                        final size = (product['sizes'] as List<int>)[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Chip(
                            
                            label: Text(size.toString()),
                          ),
                        );
                      
                    },),
                  ),
                  SizedBox(height: 10,),
                  ElevatedButton(onPressed: (){}
                  , child: Text("Add to cart"))
              ],
            ),
          )
        ],
      ),
      
    );
  }
}
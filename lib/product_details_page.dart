import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:shopping_app/global_variables.dart';

class ProductDetailsPage extends StatefulWidget {

  final Map<String,Object> product;
  const ProductDetailsPage({
    super.key,
    required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {

  int selectedSize =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(widget.product["name"] as String,
          style: Theme.of(context).textTheme.titleLarge,),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(widget.product["imageUrl"] as String),
          ),
          Spacer(flex: 2,),
          Container(
            height: 250,
            decoration: BoxDecoration(color: Color.fromRGBO(245, 247, 249, 1),
            borderRadius: BorderRadius.circular(40)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\$${widget.product['price']}',
                  style: Theme.of(context).textTheme.titleLarge,),
                  SizedBox(height: 10,),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (widget.product['sizes'] as List<int>).length,
                      itemBuilder: (context, index) {
                        final size = (widget.product['sizes'] as List<int>)[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = size;
                              });
                            },
                            child: Chip(
                              backgroundColor: selectedSize == size ? Theme.of(context).primaryColor: null,
                              
                              label: Text(size.toString()),
                            ),
                          ),
                        );
                      
                    },),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton.icon(
  onPressed: () {},
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.yellow.shade700, // match yellow from image
    foregroundColor: Colors.black, // applies to both icon and text
    minimumSize: Size(double.infinity, 50),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30), // match pill shape
    ),
  ),
  icon: Icon(Icons.shopping_cart_outlined,color: Colors.black,),
  label: Text(
    "Add to cart",
    style: TextStyle(
      fontSize: 18,
    ),
  ),
),

                  )
              ],
            ),
          )
        ],
      ),
      
    );
  }
}
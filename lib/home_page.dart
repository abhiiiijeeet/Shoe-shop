import 'package:flutter/material.dart';
import 'package:shopping_app/global_variables.dart';
import 'package:shopping_app/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> filters = const [
    'All',
    "Addidas",
    'Nike',
    'Bata'
  ];

  late String selectedFilter;

  @override
  void initState() {
    
    selectedFilter = filters[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    const border = OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(225, 225, 225, 1)
                        ),
                        borderRadius: BorderRadius.horizontal(left: Radius.circular(50))
                        
                      );
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("Shoes\nCollections",
                  style:  Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: border,
                      enabledBorder: border,
                      focusedBorder: border,                      
                    ),

                  ))
              ],
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index){
                  final filter = filters[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filter;
                      });
                      
                    },
                    child: Chip(
                      backgroundColor:selectedFilter == filter? Theme.of(context).colorScheme.primary: Color.fromRGBO(245, 247, 249, 1),
                      side: BorderSide(
                        color: Color.fromRGBO(245, 247, 249, 1)
                      ),
                      label: Text(filter),
                      labelStyle: TextStyle(fontSize: 16),
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                      ),),
                  ),
                );
              },),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductCard(
                    title: product['name'] as String,
                    price: product['price'] as double ,
                    image: product['imageUrl'] as String,
                    backgroundColor: index.isEven? Color.fromRGBO(216, 240, 253, 1):const Color.fromRGBO(245, 247, 249, 1));

              
              
                  
                  
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:shopping_app/global_variables.dart';
// import 'package:shopping_app/home_page.dart';
import 'package:shopping_app/product_details_page.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Lato',
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
            fontSize: 16, 
            fontWeight: FontWeight.w700
          ),
          prefixIconColor: Color.fromRGBO(119, 119, 119, 1)
        ),
        colorScheme: ColorScheme.fromSeed(seedColor:Color.fromRGBO(254, 206, 1,1),
        primary: Color.fromRGBO(254, 206, 1,1)),
        textTheme: TextTheme(
          titleLarge: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 35
                  ),
          titleMedium:TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ) ,
           bodySmall: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 16,
  ),

  
          
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 20,
            color: Colors.black
          )
        )
      ),
      
      
      debugShowCheckedModeBanner: false,
      title: 'Shopping App',
      home: ProductDetailsPage(product: products[0],),
    );
  }
}
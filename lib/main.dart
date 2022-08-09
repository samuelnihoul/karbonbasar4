import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

// in this view we have the list of the projects and we can checkout using Paypal
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      body: ListView(children: [
        ListTile(title: Text('Our Products')),
        
      ]),
    );
  }
}

class Product {
  final String name;
  String description;
  String price;
  String image;
  String id;

  Product(
      {required this.name,
      required this.description,
      required this.price,
      required this.image,
      required this.id});
  factory Product.fromMap(Map data) {
    return Product(
      name: data['name'] as String,
      description: data['description'] as String,
      price: data['price'] as String,
      image: data['image'] as String,
      id: data['id'] as String,
    );
  }
}

import 'dart:async';
import '../compon/appBar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

final db = new dbService();

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
        appBar: AppBa(),
        body: StreamBuilder<List<Product>>(
            stream: db.getProducts(),
            builder: ((context, snapshot) {
              if (snapshot.hasError) {
                return Text('Error ${snapshot.error} ${snapshot.data}');
              } else if (snapshot.hasData) {
                final products = snapshot.data!;
                return ListView(children: products.map(buildProduct).toList());
              } else
                return Center(child: CircularProgressIndicator());
            })));
  }
}

class Product {
  final String name;
  String description;
  String price;
  String image;
  String? id;

  Product(
      {required this.name,
      required this.description,
      required this.price,
      required this.image,
      this.id});
  factory Product.fromJson(Map<String, dynamic> data) {
    return Product(
      name: data['name'] as String,
      description: data['description'] as String,
      price: data['price'] as String,
      image: data['image'] as String,
    );
  }
}

class dbService {
  final _db = FirebaseFirestore.instance.collection("products");

  Stream<List<Product>> getProducts() {
    return _db.snapshots().map(
        (event) => event.docs.map((e) => Product.fromJson(e.data())).toList());
  }

  dbService();
}

Widget buildProduct(Product product) => ListTile(
      title: Text(product.name),
      subtitle: Text(product.description),
      trailing: Text(product.price),
      leading: Image.network(product.image),
    );

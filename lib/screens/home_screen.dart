// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kingslab_test/components/colors.dart';
import 'package:kingslab_test/components/dummy_shimmer.dart';
import 'package:kingslab_test/components/homecard.dart';
import 'package:kingslab_test/model/product_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

var result;
bool loading = true;

class _HomeScreenState extends State<HomeScreen> {
  Future<ProductModel> viewProducts() async {
    final response = await http.get(Uri.parse("https://dummyjson.com/products"),
        headers: {'Content-Type': 'application/json'});
    Map<String, dynamic> map = json.decode(response.body);

    if (response.statusCode == 200) {
      print(response.body);
      setState(() {
        result = ProductModel.fromJson(map);
        loading = false;
      });
      print(result.products.length);
      return result;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    viewProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Home Screen",
          style: TextStyle(
            color: kBlackColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: loading
          ? bannerShimmer()
          : ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: result.products.length,
              itemBuilder: (context, int index) {
                return homeCard(
                  item: result.products[index],
                  context: context,
                );
              },
            ),
    );
  }
}

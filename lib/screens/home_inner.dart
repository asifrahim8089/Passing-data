// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:kingslab_test/components/textstyles.dart';

class HomeInner extends StatefulWidget {
  final id;
  final title;
  final description;
  final image;
  const HomeInner(
      {Key? key,
      @required this.id,
      @required this.title,
      @required this.description,
      @required this.image})
      : super(key: key);

  @override
  State<HomeInner> createState() => _HomeInnerState();
}

class _HomeInnerState extends State<HomeInner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                widget.image,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: SizedBox(
                child: Text(
                  widget.title,
                  style: Text22black,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: SizedBox(
                child: Text(
                  widget.description,
                  style: Text20black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

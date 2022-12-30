// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages, unnecessary_string_interpolations, prefer_function_declarations_over_variables

import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:kingslab_test/components/colors.dart';
import 'package:kingslab_test/components/textstyles.dart';
import 'package:kingslab_test/screens/home_inner.dart';

Widget homeCard({item, context}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: Card(
      elevation: 1,
      clipBehavior: Clip.antiAlias,
      color: HexColor('F9FAFC'),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: SizedBox(
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Image.network(
                    item.thumbnail,
                    height: 50,
                    width: 50,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: SizedBox(
                    width: 200,
                    child: Text(
                      item.title,
                      style: Text14black,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text(
                item.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Text12grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeInner(
                        id: item.id,
                        title: item.title,
                        description: item.description,
                        image: item.thumbnail,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: HexColor('#42C3A7'),
                      borderRadius: BorderRadius.circular(15),
                      // ignore: prefer_const_literals_to_create_immutables
                    ),
                    child: Center(
                      child: Text(
                        "View Details",
                        style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

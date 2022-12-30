// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget bannerShimmer() {
  return Shimmer.fromColors(
    baseColor: const Color(0xBBE6E6E6),
    highlightColor: const Color(0x77EEEEEE),
    child: ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 180,
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.symmetric(vertical: 5.0),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      },
    ),
  );
}

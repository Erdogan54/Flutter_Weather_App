import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LocationWidget extends StatelessWidget {
  final String sehir;
  const LocationWidget({Key? key, required this.sehir}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        sehir,
        style: const TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
      ),
    );
  }
}

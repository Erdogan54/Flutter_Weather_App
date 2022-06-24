import 'package:flutter/material.dart';

class SonGuncelleme extends StatelessWidget {
  final dynamic sonGuncelleme;
  const SonGuncelleme({Key? key, required this.sonGuncelleme})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var saatVerisi = sonGuncelleme.toString().split(" ")[1];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Son Güncelleme",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w300,
              color: Colors.black.withOpacity(0.8)),
        ),
        const SizedBox(width: 10),
        Text(
          saatVerisi,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w300,
              color: Colors.black.withOpacity(0.8)),
        ),
      ],
    );
  }
}

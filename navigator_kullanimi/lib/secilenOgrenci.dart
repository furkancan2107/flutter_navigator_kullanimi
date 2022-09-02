import 'package:flutter/material.dart';

import 'ogrenci.dart';

class SecilenOgrenci extends StatelessWidget {
  final Ogrenci secilenOgrenci;
  const SecilenOgrenci({required this.secilenOgrenci, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detay"),
      ),
      body: Column(
        children: [
          Text(secilenOgrenci.id.toString()),
          Text(secilenOgrenci.isim),
          Text(secilenOgrenci.soyisim),
        ],
      ),
    );
  }
}

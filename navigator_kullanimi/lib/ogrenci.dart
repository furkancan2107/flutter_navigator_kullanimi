import 'package:flutter/material.dart';

class OgrenciListesi extends StatefulWidget {
  const OgrenciListesi({super.key});

  @override
  State<OgrenciListesi> createState() => _OgrenciListesiState();
}

class _OgrenciListesiState extends State<OgrenciListesi> {
  @override
  Widget build(BuildContext context) {
    int? elemanSayisi = ModalRoute.of(context)!.settings.arguments as int;
    List<Ogrenci> _tumOgrenciler = List.generate(
        elemanSayisi,
        (index) =>
            Ogrenci(index + 1, "Ahmet ${index + 1}", "Simsek ${index + 1}"));
    return Scaffold(
      appBar: AppBar(
        title: Text(elemanSayisi.toString()),
      ),
      body: ListView.builder(itemBuilder: ((context, index) {
        var talabe = _tumOgrenciler[index];
        return ListTile(
          onTap: () {
            Navigator.pushNamed(context, "ogrenciDetay", arguments: talabe);
          },
          leading: CircleAvatar(
            child: Text(talabe.id.toString()),
          ),
          title: Text(talabe.isim),
          subtitle: Text(talabe.soyisim),
        );
      })),
    );
  }
}

class Ogrenci {
  final int id;
  final String isim;
  final String soyisim;

  Ogrenci(this.id, this.isim, this.soyisim);
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:navigator_kullanimi/main.dart';
import 'package:navigator_kullanimi/ogrenci.dart';
import 'package:navigator_kullanimi/secilenOgrenci.dart';

class RouteGenerator {
  static _routeOlustur(Widget _gelenSayfa, RouteSettings settings) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return MaterialPageRoute(
          settings: settings, builder: (context) => _gelenSayfa);
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return CupertinoPageRoute(
          settings: settings, builder: (context) => _gelenSayfa);
    } else {
      return CupertinoPageRoute(
          settings: settings, builder: (context) => _gelenSayfa);
    }
  }

  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case "redPage":
        return _routeOlustur(AnaSayfa(), settings);

      case "ogrenciDetay":
        var secilenOgrenci = settings.arguments as Ogrenci;
        return _routeOlustur(
            SecilenOgrenci(secilenOgrenci: secilenOgrenci), settings);

      case "ogrenciListesi":
        print(settings.arguments);
        print("a");
        return _routeOlustur(OgrenciListesi(), settings = settings);

      default:
        return _routeOlustur(
            Scaffold(
              body: Center(
                child: Text("BOS"),
              ),
            ),
            settings);
    }
  }
}

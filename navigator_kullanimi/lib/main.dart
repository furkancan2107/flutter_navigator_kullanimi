import 'package:flutter/material.dart';
import 'package:navigator_kullanimi/onGenera.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      /* routes: {
        "redPage": (context) => AnaSayfa(),
        "yeniSayfa": ((context) => AnaSayfa())
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
          builder: (context) => Scaffold(
                body: Center(child: Text("YANLİS")),
              )),*/
      onGenerateRoute: RouteGenerator.routeGenerator,
      home: Main(),
    );
  }
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigator kullanimi"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AnaSayfa()));
                },
                child: Text("Ana Sayfaya Git")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "redPage");
                },
                child: Text("Ana Sayfaya Git")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "as");
                },
                child: Text("Ana Sayfaya Git")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "ogrenciListesi", arguments: 80);
                },
                child: Text("Liste Olustur")),
          ],
        ),
      ),
    );
  }
}

class AnaSayfa extends StatelessWidget {
  const AnaSayfa({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false); // appBardaki geri tusunu inaktif eder
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red.shade500,
          title: Text("Kırmizi Sayfa"),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Geri dön"))
            ],
          ),
        ),
      ),
    );
  }
}

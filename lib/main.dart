import 'package:caffyne/offersPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Greet extends StatefulWidget {
  const Greet({super.key});

  @override
  State<Greet> createState() => _GreetState();
}

class _GreetState extends State<Greet> {
  var name = "";
  var greetStyle = const TextStyle(fontSize: 24);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Greetings $name ...",
          style: greetStyle,
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: TextField(
            onChanged: (value) {
              setState(() {
                name = value;
              });
            },
          ),
        )
      ],
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Caffyne',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: Colors.brown,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget currentWidget = const Text("!!!");

    switch (currentIndex) {
      case 0:
        currentWidget = const Text("Home works!");
        break;

      case 1:
        currentWidget = const Offerspage();
        break;

      case 2:
        currentWidget = const Text("Orders works!");
        break;
    }

    // This method is rerun every time setState is called.
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Image.asset(
            "images/logo-white.png",
            scale: 15,
          ),
        ),
        body: Center(child: currentWidget),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) => setState(() {
            currentIndex = value;
          }),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.coffee),
              label: "Menu",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.celebration),
              label: "Offers",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.coffee_maker),
              label: "Orders",
            ),
          ],
        ));
  }
}

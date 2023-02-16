import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange
      ),
      home: const MyHomePage(title: 'Library'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List games = ["Atomic Heart", "Hogwarts Legacy", "Octopath II", "Kerbal Space Program II"];

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.orange),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Library'),
            centerTitle: true,
          ),
          body: DecoratedBox(

            decoration: BoxDecoration(
              image: DecorationImage(
                  image: const AssetImage("assets/background.png"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(Colors.grey.withOpacity(0.5), BlendMode.color),
              )
            ),
            child: ListView.builder(
              itemCount: games.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.orange.withOpacity(0.75),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  borderOnForeground: true,
                  elevation: 5,
                  margin: const EdgeInsets.fromLTRB(5,5,5,5),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      child: Image.asset("assets/OT.png"),
                    ),
                    title: Text("${games[index]}", textAlign: TextAlign.center,),
                    subtitle: Column(
                      children: <Widget>[
                        FloatingActionButton.large(child: Text("Score"),onPressed: (){})
                      ],
                    )
                  )
                );
              },
            ),
          ),
      ));
  }
}

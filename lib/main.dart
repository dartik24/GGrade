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

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List games = ["Atomic Heart", "Hogwarts Legacy", "Octopath II", "Kerbal Space Program II"];
  List scores = [7,9,8,7];
  List img = [Image.asset('assets/AH.jpg'),Image.asset('assets/hgw.jpg'),Image.asset('assets/OT.jpg'),Image.asset('assets/KSP.jpg'),];

  void _incrementCounter() {
    setState(() {
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
                      child: img[index],
                    ),
                    title: Text("${games[index]}", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Column(
                      children: <Widget>[
                        FloatingActionButton.large(child: Text("${scores[index]}/10", style: TextStyle(fontWeight: FontWeight.bold),),onPressed: (){})
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

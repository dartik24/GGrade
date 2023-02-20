import 'package:flutter/cupertino.dart';
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
      title: 'GGrade Demo',
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
  List games = ["Atomic Heart", "Hogwarts Legacy", "Octopath II", "Kerbal Space Program II"];
  List img = [Image.asset('assets/AH.jpg'),Image.asset('assets/hgw.jpg'),Image.asset('assets/OT.jpg'),Image.asset('assets/KSP.jpg'),];
  List dph = [5,5,8,10];
  List perf = [7,6,9,7];
  List user = [7,8,7,9];

  double find_score(int index){
    double res = (dph[index] + perf[index] + user[index])/3;
    return res;
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
                      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                      child: img[index],
                    ),
                    title: Text("${games[index]}", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Column(
                      children: <Widget>[
                        FloatingActionButton.large( heroTag: "$index",child: Text("${find_score(index).toStringAsFixed(1)}/10", style: const TextStyle(fontWeight: FontWeight.bold),),onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MyScorePage(title: "${games[index]}"),));
                        })
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

class MyScorePage extends StatefulWidget {
  const MyScorePage({super.key, required this.title});

  final String title;

  @override
  State<MyScorePage> createState() => _MyScorePageState(title);
}

class _MyScorePageState extends State<MyScorePage> {
  String title;
  _MyScorePageState(this.title);
  List games = ["Atomic Heart", "Hogwarts Legacy", "Octopath II", "Kerbal Space Program II"];
  List img = ["assets/AH.jpg" , "assets/hgw.jpg", "assets/OT.jpg", "assets/KSP.jpg"];
  List dph = [5,5,8,10];
  List perf = [7,6,9,7];
  List user = [7,8,7,9];

  double find_score(int index){
    double res = (dph[index] + perf[index] + user[index])/3;
    return res;
  }

  int fullRun(String name){
    for(int i = 0; i < games.length; i++) {
      if(games[i]==name){
        return i;
      }
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
          theme: ThemeData(primarySwatch: Colors.orange),
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            appBar: AppBar(
              title: Text(title),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                      Container(
                          margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(color: Colors.black.withOpacity(0.25),
                                blurRadius: 5,
                                spreadRadius: 5,
                                offset: const Offset(2.0, 2.0),)
                            ],
                            borderRadius: const BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Image.asset("${img[fullRun(title)]}")),
                      Flexible(child: Container(
                        width: 25,
                        height: 25,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(color: Colors.black.withOpacity(0.25),
                              blurRadius: 5,
                              spreadRadius: 5,
                              offset: const Offset(2.0, 2.0),)
                          ],
                          color: Colors.orange.withOpacity(0.75),
                          borderRadius: const BorderRadius.all(Radius.circular(15)),
                        ),
                        child: const Text("SCORE", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),),
                      )),
                      Flexible(child: Container(
                        width: 350,
                        height: 350,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(color: Colors.black.withOpacity(0.75),
                              blurRadius: 5,
                              spreadRadius: 5,
                              offset: const Offset(2.0, 2.0),)
                          ],
                          color: Colors.orange.withOpacity(0.75),
                          shape: BoxShape.circle,
                          ),
                        child: Text("${find_score(fullRun(title)).toStringAsFixed(1)}/10", textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ),
                    Flexible(child: Container(
                      width: 25,
                      height: 25,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: Colors.black.withOpacity(0.25),
                            blurRadius: 5,
                            spreadRadius: 5,
                            offset: const Offset(2.0, 2.0),)
                        ],
                        color: Colors.orange.withOpacity(0.75),
                        borderRadius: const BorderRadius.all(Radius.circular(15)),
                      ),
                      child: const Text("Dollar Per Hour", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),),
                    )),
                    Flexible(child: Container(
                      width: 100,
                      height: 100,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: Colors.black.withOpacity(0.75),
                            blurRadius: 5,
                            spreadRadius: 5,
                            offset: const Offset(2.0, 2.0),)
                        ],
                        color: Colors.orange.withOpacity(0.75),
                        shape: BoxShape.circle,
                      ),
                      child: Text("${dph[fullRun(title)]}/10", textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold)),
                    )
                    ),
                    Flexible(child: Container(
                      width: 25,
                      height: 25,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: Colors.black.withOpacity(0.25),
                            blurRadius: 5,
                            spreadRadius: 5,
                            offset: const Offset(2.0, 2.0),)
                        ],
                        color: Colors.orange.withOpacity(0.75),
                        borderRadius: const BorderRadius.all(Radius.circular(15)),
                      ),
                      child: const Text("Performance", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),),
                    )),
                    Flexible(child: Container(
                      width: 100,
                      height: 100,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: Colors.black.withOpacity(0.75),
                            blurRadius: 5,
                            spreadRadius: 5,
                            offset: const Offset(2.0, 2.0),)
                        ],
                        color: Colors.orange.withOpacity(0.75),
                        shape: BoxShape.circle,
                      ),
                      child: Text("${perf[fullRun(title)]}/10", textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold)),
                    )
                    ),
                    Flexible(child: Container(
                      width: 25,
                      height: 25,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: Colors.black.withOpacity(0.25),
                            blurRadius: 5,
                            spreadRadius: 5,
                            offset: const Offset(2.0, 2.0),)
                        ],
                        color: Colors.orange.withOpacity(0.75),
                        borderRadius: const BorderRadius.all(Radius.circular(15)),
                      ),
                      child: const Text("User Score", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),),
                    )),
                    Flexible(child: Container(
                      width: 100,
                      height: 100,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: Colors.black.withOpacity(0.75),
                            blurRadius: 5,
                            spreadRadius: 5,
                            offset: const Offset(2.0, 2.0),)
                        ],
                        color: Colors.orange.withOpacity(0.75),
                        shape: BoxShape.circle,
                      ),
                      child: Text("${user[fullRun(title)]}/10", textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold)),
                    )
                    ),
                  ],
                )
            ),
          ));
    }
}


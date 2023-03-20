import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
  List games = [];
  List img = [];
  List dph = [];
  List perf = [];
  List user = [];

  @override
  void initState()
  {
    super.initState();
    _activateListeners();
    _activateListeners2();
    _activateListeners3();
  }

  Future<void> _activateListeners() async{
    DatabaseReference ref = FirebaseDatabase.instance.ref("Name");
    DatabaseEvent event = await ref.once();

    final map = event.snapshot.value as Map<dynamic, dynamic>;
    map.forEach((key, value) {
      games.add(value);
    });
    DatabaseReference ref2 = FirebaseDatabase.instance.ref("dph");
    DatabaseEvent event2 = await ref2.once();

    final map2 = event2.snapshot.value as Map<dynamic, dynamic>;
    map2.forEach((key, value) {
      dph.add(value);
    });
    return;
  }

  Future<void> _activateListeners2() async{
    DatabaseReference ref = FirebaseDatabase.instance.ref("perf");
    DatabaseEvent event = await ref.once();

    final map = event.snapshot.value as Map<dynamic, dynamic>;
    map.forEach((key, value) {
      perf.add(value);
    });
    DatabaseReference ref2 = FirebaseDatabase.instance.ref("user");
    DatabaseEvent event2 = await ref2.once();

    final map2 = event2.snapshot.value as Map<dynamic, dynamic>;
    map2.forEach((key, value) {
      user.add(value);
    });
    return;
  }

  Future<void> _activateListeners3() async{
    DatabaseReference ref = FirebaseDatabase.instance.ref("img");
    DatabaseEvent event = await ref.once();

    final map = event.snapshot.value as Map<dynamic, dynamic>;
    map.forEach((key, value) {
      img.add(value);
    });
  }


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
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  borderOnForeground: true,
                  elevation: 5,
                  margin: const EdgeInsets.fromLTRB(5,5,5,5),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                      child: Image.network(img[index]),
                    ),
                    title: Text("${games[index]}", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    subtitle: Column(
                      children: <Widget>[
                        FloatingActionButton.large( heroTag: "$index",shape: const StadiumBorder(side: BorderSide(color: Colors.black, width: 1)) ,child: Text("${find_score(index).toStringAsFixed(1)}/10",style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25), ),onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MyScorePage(title: "${games[index]}", games: games, dph: dph, perf: perf, user: user, img: img),));
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
  const MyScorePage({super.key, required this.title, required this.games, required this.dph, required this.perf, required this.user, required this.img});
  final String title;
  final List games;
  final List dph;
  final List perf;
  final List user;
  final List img;

  @override
  State<MyScorePage> createState() => _MyScorePageState(title, games, dph, perf, user, img);
}

class _MyScorePageState extends State<MyScorePage> {
  String title;
  List games;
  List dph;
  List perf;
  List user;
  List img;
  _MyScorePageState(this.title, this.games, this.dph, this.perf, this.user, this.img);


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
              leading: BackButton(onPressed: () => Navigator.of(context).pop(),),
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                      Container(
                          margin: EdgeInsets.only(left: 10, right: 10, top: 20),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2),
                            boxShadow: [
                              BoxShadow(color: Colors.black.withOpacity(0.25),
                                blurRadius: 5,
                                spreadRadius: 5,
                                offset: const Offset(2.0, 2.0),)
                            ],
                          ),
                          child: Image.network("${img[fullRun(title)]}")),
                      Flexible(child: Container(
                        width: 25,
                        height: 25,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 10, right: 10, top: 20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
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
                          border: Border.all(color: Colors.black, width: 1),
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
                        border: Border.all(color: Colors.black, width: 1),
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
                        border: Border.all(color: Colors.black, width: 1),
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
                        border: Border.all(color: Colors.black, width: 1),
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
                        border: Border.all(color: Colors.black, width: 1),
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
                        border: Border.all(color: Colors.black, width: 1),
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
                        border: Border.all(color: Colors.black, width: 1),
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


import 'package:flutter/material.dart';
import 'package:scrollable_bar/Candidate/Model/profile_model.dart';
import 'package:scrollable_bar/Candidate/Services/json_data.dart';
import 'package:scrollable_bar/Candidate/view/profile.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: ''),
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
  @override
  void initState() {
    // TODO: implement initState
    profile_fetcher();
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Map<String, int> map1 = {"Basic": 1, "Intermediate": 2, "Advanced": 3};
  List<Profile_model> profilelist = [];
  void profile_fetcher() {
    for (int i = 0; i < candidate_profilelist.length; i++) {
      Profile_model candidate_profile =
          Profile_model.fromJson(candidate_profilelist[i]);
      profilelist.add(candidate_profile);
    }

    profilelist.sort((a, b) {
      return (map1[a.level] ?? 0) > (map1[b.level] ?? 0) ? 1 : 0;
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.25,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: profilelist.length,
            padding: EdgeInsets.all(20),
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Profile(
                    name: profilelist[index].name,
                    level: profilelist[index].level,
                  ),
                  SizedBox(
                    width: 20,
                  )
                ],
              );
            },
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

import 'package:brba/widgets/gridCharacters.dart';
import 'package:brba/widgets/navigation.dart';
import 'package:flutter/material.dart';

class AllCharactersPage extends StatefulWidget {
  const AllCharactersPage({Key? key}) : super(key: key);

  @override
  _AllCharactersPageState createState() => _AllCharactersPageState();
}

class _AllCharactersPageState extends State<AllCharactersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black45,
        appBar: AppBar(
          title: Image.asset("assets/logo.png", scale: 6),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.green[900]),
        ),
        body: GridCharacters(),
        drawer: Navigation());
  }
}

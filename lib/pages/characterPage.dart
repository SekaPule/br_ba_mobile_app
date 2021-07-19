import 'package:brba/api/api.dart';
import 'package:brba/models/apiModel.dart';
import 'package:brba/second/bloc/second_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Character extends StatefulWidget {
  const Character({Key? key}) : super(key: key);

  @override
  _CharacterState createState() => _CharacterState();
}

class _CharacterState extends State<Character> {
  late Future<RandomCharacter> futureRandomCharacter;

  @override
  void initState() {
    super.initState();
    futureRandomCharacter = fetchRandomCharacter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Image.asset("assets/logo.png", scale: 6),
            centerTitle: true,
            textTheme: TextTheme(headline1: TextStyle(fontSize: 40)),
            iconTheme: IconThemeData(color: Colors.green[900])),
        body: BlocBuilder<SecondBloc, SecondState>(builder: (context, state) {
          if (state is SecondInitial) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.green[900],
              ),
            );
          }
          if (state is SecondLoaded) {
            return ListView(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  Card(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(state.futureCharacter.img),
                              fit: BoxFit.cover,
                            ),
                          ),
                          height: 490,
                          width: double.infinity,
                        ),
                        Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(state.futureCharacter.portrayed,
                                style: TextStyle(fontSize: 18)),
                            Text(state.futureCharacter.name,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w900)),
                          ],
                        ),
                        Divider(),
                        Row(
                          children: [
                            SizedBox(
                              width: 30,
                              height: 40,
                            ),
                            Icon(
                              Icons.cake,
                              size: 40,
                            ),
                            SizedBox(
                              width: 15,
                              height: 40,
                            ),
                            Text(state.futureCharacter.birthday.toString(),
                                style: TextStyle(fontSize: 16)),
                          ],
                        ),
                        Divider(),
                        Row(
                          children: [
                            SizedBox(
                              width: 30,
                              height: 40,
                            ),
                            Icon(
                              Icons.account_box,
                              size: 40,
                            ),
                            SizedBox(
                              width: 15,
                              height: 40,
                            ),
                            Text(state.futureCharacter.nickname,
                                style: TextStyle(fontSize: 16)),
                          ],
                        ),
                        Divider(),
                        Row(
                          children: [
                            SizedBox(
                              width: 30,
                              height: 40,
                            ),
                            Icon(
                              Icons.healing,
                              size: 40,
                            ),
                            SizedBox(
                              width: 15,
                              height: 40,
                            ),
                            Text(
                              state.futureCharacter.status.toString(),
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          children: [
                            SizedBox(
                              width: 30,
                              height: 40,
                            ),
                            Icon(
                              Icons.camera,
                              size: 40,
                            ),
                            SizedBox(
                              width: 15,
                              height: 40,
                            ),
                            Flexible(
                              child: Text(
                                  state.futureCharacter.category.toString(),
                                  style: TextStyle(fontSize: 16)),
                            ),
                          ],
                        ),
                        Divider(),
                        Column(
                          children: [
                            Text("Occupation:", style: TextStyle(fontSize: 18)),
                            Text(state.futureCharacter.occupation.toString(),
                                style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ],
                    ),
                  )
                ]);
          }
          return Center(
              child: CircularProgressIndicator(
            color: Colors.green[900],
          ));
        }));
  }
}

//   }
// }

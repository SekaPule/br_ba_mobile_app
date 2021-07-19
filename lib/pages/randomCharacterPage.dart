import 'package:brba/api/api.dart';
import 'package:brba/models/apiModel.dart';
import 'package:brba/widgets/navigation.dart';
import 'package:flutter/material.dart';

class RandomCharacterPage extends StatefulWidget {
  const RandomCharacterPage({Key? key}) : super(key: key);

  @override
  _RandomCharacterPageState createState() => _RandomCharacterPageState();
}

class _RandomCharacterPageState extends State<RandomCharacterPage> {
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
            iconTheme: IconThemeData(color: Colors.green[900])),
        body: Center(
          child: FutureBuilder<RandomCharacter>(
            future: futureRandomCharacter,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
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
                                  image: NetworkImage(snapshot.data!.img),
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
                                Text(snapshot.data!.portrayed,
                                    style: TextStyle(fontSize: 18)),
                                Text(snapshot.data!.name,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900)),
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
                                Text(snapshot.data!.birthday.toString(),
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
                                Text(snapshot.data!.nickname,
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
                                  snapshot.data!.status.toString(),
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
                                      snapshot.data!.category.toString(),
                                      style: TextStyle(fontSize: 16)),
                                )
                              ],
                            ),
                            Divider(),
                            Column(
                              children: [
                                Text("Occupation:",
                                    style: TextStyle(fontSize: 18)),
                                Text(snapshot.data!.occupation.toString(),
                                    style: TextStyle(fontSize: 16)),
                              ],
                            ),
                          ],
                        ),
                      )
                    ]);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator(color: Colors.green[900]);
            },
          ),
        ),
        drawer: Navigation(),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.green[900],
            onPressed: () {
              setState(() {
                futureRandomCharacter = fetchRandomCharacter();
              });
            },
            child: Icon(Icons.update)));
  }
}

import 'package:brba/first/bloc/first_bloc.dart';
import 'package:brba/pages/characterPage.dart';
import 'package:brba/second/bloc/second_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GridCharacters extends StatefulWidget {
  const GridCharacters({Key? key}) : super(key: key);

  @override
  _GridCharactersState createState() => _GridCharactersState();
}

class _GridCharactersState extends State<GridCharacters> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FirstBloc, FirstState>(builder: (context, state) {
      if (state is FirstInitial) {
        return Center(
          child: CircularProgressIndicator(
            color: Colors.green[900],
          ),
        );
      }
      if (state is FirstLoaded) {
        final SecondBloc _bloc = BlocProvider.of<SecondBloc>(context);
        return GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: state.allcharacters.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _bloc.add(LoadSecond(state.allcharacters[index]));
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Character()));
              },
              child: Container(
                margin: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(state.allcharacters[index].img),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 205,
                          color: Colors.black38,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(state.allcharacters[index].name,
                                  style: TextStyle(color: Colors.white70),
                                  textAlign: TextAlign.center),
                              Text(state.allcharacters[index].portrayed,
                                  style: TextStyle(color: Colors.white70),
                                  textAlign: TextAlign.center),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }
      return Center(
        child: CircularProgressIndicator(
          color: Colors.green[900],
        ),
      );
    });
  }
}

import 'package:brba/api/api.dart';
import 'package:brba/models/apiModel.dart';
import 'package:brba/widgets/navigation.dart';
import 'package:flutter/material.dart';

class QuotesPage extends StatefulWidget {
  const QuotesPage({Key? key}) : super(key: key);

  @override
  _QuotesPageState createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  late List<Quotes> _quotes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getQuotes();
  }

  Future<void> getQuotes() async {
    _quotes = await fetchQuotes();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset("assets/logo.png", scale: 6),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.green[900]),
        ),
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.green[900],
                ),
              )
            : ListView.builder(
                itemCount: _quotes.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        _quotes[index].quote,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w900),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.account_circle,
                            color: Colors.green[900],
                          ),
                          Text(
                            _quotes[index].author,
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ));
                },
              ),
        drawer: Navigation());
  }
}

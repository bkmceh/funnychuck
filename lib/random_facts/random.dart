import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class RandomFacts extends StatefulWidget {
  final String category;

  const RandomFacts(this.category, {Key? key}) : super(key: key);

  @override
  _RandomFactsState createState() => _RandomFactsState();
}

class _RandomFactsState extends State<RandomFacts> {
  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width - 170;
    final double _height = MediaQuery.of(context).size.width / 5;
    return Scaffold(
      backgroundColor: Colors.blue.shade400,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    alignment: Alignment.center,
                    width: 350,
                    height: 310,
                    child: SingleChildScrollView(child: _GetJoke()),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(width: 3)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {});
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.deepOrange),
                      minimumSize:
                          MaterialStateProperty.all(Size(_width, _height)),
                      side: MaterialStateProperty.all(
                        const BorderSide(
                          color: Colors.black,
                          width: 3,
                        ),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    child: const Text(
                      'MORE',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.brown),
                      minimumSize:
                          MaterialStateProperty.all(Size(_width, _height)),
                      side: MaterialStateProperty.all(
                        const BorderSide(
                          color: Colors.black,
                          width: 3,
                        ),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    child: const Text(
                      'BACK',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GetJoke extends StatelessWidget {
  const _GetJoke({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: _fetchJoke(),
        builder: (context, snapshot) {
          final data = snapshot.data;
          if (data == null) {
            return const CircularProgressIndicator();
          }
          return Text(
            data.toString(),
            style: const TextStyle(
              fontSize: 32,
            ),
            textAlign: TextAlign.center,
          );
        });
  }
}

const _baseUrl = 'https://api.chucknorris.io/jokes/random';

Future<String> _fetchJoke() async {
  final response = await get(Uri.parse('$_baseUrl'));
  Map<String, Object?> test = jsonDecode(response.body);
  print(test['value']);
  return test['value'].toString();
}

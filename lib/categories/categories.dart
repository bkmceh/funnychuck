import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../random_facts/random.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade400,
      body: SafeArea(
        child: _GetCategories(),
      ),
    );
  }
}

class _GetCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double _backWidth = MediaQuery.of(context).size.width - 170;
    final double _backHeight = MediaQuery.of(context).size.width / 5;
    final double _width = MediaQuery.of(context).size.width / 4;
    return FutureBuilder<List<String>>(
        future: _fetchCategories(),
        builder: (context, snapshot) {
          final data = snapshot.data;
          if (data == null) {
            return const Center(
                child: CircularProgressIndicator(
                    color: Colors.deepOrange, strokeWidth: 10.0));
          }
          return CustomScrollView(slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              // expandedHeight: _backHeight,
              collapsedHeight: _backHeight,
              shape: const ContinuousRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 3),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              pinned: true,
              centerTitle: true,
              backgroundColor: Colors.brown,
              title: const Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text(
                  'JOKE CATEGORIES',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: (index % 2 == 0) ? 18.0 : 9,
                      right: (index % 2 == 0) ? 9 : 18,
                      top: 18,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    RandomFacts(data[index]))));
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.deepOrange),
                        minimumSize:
                            MaterialStateProperty.all(Size(_width, _width)),
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
                      child: Text(
                        data[index].toUpperCase(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ),
                  );
                }, childCount: data.length)),
            SliverList(
              delegate: SliverChildBuilderDelegate((content, index) {
                return Padding(
                  padding: EdgeInsets.only(
                      top: 30, right: 85, left: 85, bottom: _backHeight),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.brown),
                      minimumSize: MaterialStateProperty.all(
                          Size(_backWidth, _backHeight)),
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
                );
              }, childCount: 1),
            )
          ]);
        });
  }
}

const _baseUrl = 'https://api.chucknorris.io/jokes/categories';

Future<List<String>> _fetchCategories() async {
  final response = await get(Uri.parse(_baseUrl));
  String answer = response.body.replaceAll('"', '');
  int length = answer.length;
  return List.from(answer.substring(1, length - 1).split(","));
}

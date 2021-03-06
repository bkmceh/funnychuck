import 'package:flutter/material.dart';
import 'package:funnychuck/about_project/project-info.dart';
import 'package:funnychuck/categories/categories.dart';
import 'package:funnychuck/random_facts/random.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width - 100;
    final double _buttonWidth = MediaQuery.of(context).size.width - 140;
    final double _height = MediaQuery.of(context).size.height / 9;
    return Scaffold(
      backgroundColor: Colors.blue.shade400,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: SizedBox(
                    child: Image.asset("assets/images/logo.png"),
                    width: _width,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const RandomFacts(""))));
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.deepOrange.shade700),
                      fixedSize: MaterialStateProperty.all(
                          Size(_buttonWidth, _height)),
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
                      'RANDOM FACTS',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const Categories())));
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.deepOrange.shade700),
                      fixedSize: MaterialStateProperty.all(
                          Size(_buttonWidth, _height)),
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
                      'CATEGORIES',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const ProjectInfo())));
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.brown),
                      fixedSize: MaterialStateProperty.all(
                          Size(_buttonWidth, _height)),
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
                      'ABOUT PROJECT',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                      textAlign: TextAlign.center,
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

import 'package:flutter/material.dart';
import 'package:funnychuck/random_facts/random.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width - 100;
    final double _buttonWidth = MediaQuery.of(context).size.width - 170;
    final double _height = MediaQuery.of(context).size.width / 5;
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
                              builder: ((context) => RandomFacts())));
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.deepOrange),
                      minimumSize:
                          MaterialStateProperty.all(Size(_buttonWidth, _height)),
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
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Colors.deepOrange),
                      minimumSize:
                      MaterialStateProperty.all(Size(_buttonWidth, _height)),
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
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Colors.brown),
                      minimumSize:
                      MaterialStateProperty.all(Size(_buttonWidth, _height)),
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

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectInfo extends StatelessWidget {
  const ProjectInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width - 170;
    final double _height = MediaQuery.of(context).size.width / 5;
    final double _windowWidth = MediaQuery.of(context).size.width - 80;
    final double _windowHeight = MediaQuery.of(context).size.height / 2;
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
                    width: _windowWidth,
                    height: _windowHeight,
                    child: const SingleChildScrollView(
                      child: Text(
                          "Made by student of Innopolis University in 2022 for flutter elective.\n"
                          "This application uses chucknorris.io API for showing funny Chuck Norris facts. Enjoy!\n"
                          "Telegram contact below",
                          style: TextStyle(fontSize: 32),
                          textAlign: TextAlign.center),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      _launchURL();
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
                      'TELEGRAM 📝',
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

const String _url = 'https://t.me/inforest';

void _launchURL() async {
  if (!await launch(_url)) throw 'Could not launch $_url';
}

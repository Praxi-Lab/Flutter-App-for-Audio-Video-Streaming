import 'package:flutter/material.dart';
import 'music.dart';
import 'video.dart';

main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => primeapp(),
        '/audio': (context) => musicPlayer(),
        '/video': (context) => videoPlayer(),
      },
    ));

class primeapp extends StatefulWidget {
  @override
  _primeappState createState() => _primeappState();
}

class _primeappState extends State<primeapp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("Choose player"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/audio'),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  color: Colors.blue[200],
                  gradient: LinearGradient(
                      colors: [Colors.blue[200], Colors.blue[400]]),
                ),
                height: 250,
                width: double.infinity,
                alignment: Alignment.center,
                child: Text("Audio"),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/video'),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                    color: Colors.blue[200],
                    gradient: LinearGradient(
                        colors: [Colors.blue[200], Colors.blue[400]])),
                height: 250,
                width: double.infinity,
                alignment: Alignment.center,
                child: Text("Video"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

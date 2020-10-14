import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class musicPlayer extends StatefulWidget {
  @override
  _musicPlayerState createState() => _musicPlayerState();
}

class _musicPlayerState extends State<musicPlayer> {
  AudioPlayer _audioPlayer = AudioPlayer();

  var url =
      "https://github.com/hemabhravee/Flutter-App-for-audio-video-streaming/blob/master/assets/talash.mp3";

  AudioPlayer net = AudioPlayer();

  bool isPlaying = false;
  String currentTime = "00:00";
  String completeTime = "00:00";
  bool songChosen = false;

  @override
  void initState() {
    super.initState();

    _audioPlayer.onAudioPositionChanged.listen((Duration duration) {
      setState(() {
        currentTime = duration.toString().split(".")[0];
      });
    });

    _audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        completeTime = duration.toString().split(".")[0];
      });
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context)),
          title: Text("Music Player"),
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          overflow: Overflow.visible,
          children: <Widget>[
            Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                width: double.infinity,
                height: double.infinity,
                child: Image.asset(
                  "assets/img.jpg",
                  fit: BoxFit.fill,
                )
                //Text("lol"),
                ),
            Container(
              margin: EdgeInsets.only(bottom: 25),
              alignment: Alignment.center,
              height: 75,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(30)),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      !isPlaying
                          ? IconButton(
                              icon: Icon(Icons.play_arrow),
                              onPressed: () {
                                if (songChosen == true) {
                                  _audioPlayer.resume();
                                  setState(() {
                                    isPlaying = true;
                                  });
                                }
                              })
                          : IconButton(
                              icon: Icon(Icons.pause),
                              onPressed: () {
                                _audioPlayer.pause();
                                setState(() {
                                  isPlaying = false;
                                });
                              }),
                      IconButton(
                          icon: Icon(Icons.stop),
                          onPressed: () {
                            _audioPlayer.stop();
                            setState(() {
                              isPlaying = false;
                              currentTime = "00:00";
                            });
                          }),
                      Text(currentTime),
                      Text("/"),
                      Text(completeTime),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 300,
                    color: Colors.black,
                    height: 2,
                    margin: EdgeInsets.only(bottom: 1),
                  )
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.blue,
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 100,
              ),
              IconButton(
                icon: Icon(Icons.audiotrack),
                onPressed: () async {
                  String filepath = await FilePicker.getFilePath();

                  int status = await _audioPlayer.play(filepath, isLocal: true);
                  
                  //status = 1 => it has run the file succesfully

                  if (status == 1) {
                    setState(() {
                      isPlaying = true;
                      songChosen = true;
                    });
                  }
                },
              ),
              SizedBox(
                width: 100,
              ),
              IconButton(
                  icon: Icon(Icons.cloud_download),
                  onPressed: () {
                    net.setUrl(url);
                    net.play(url, isLocal: false);
                    setState(() {
                      isPlaying = true;
                    });
                    //net.play();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

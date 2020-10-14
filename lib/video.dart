import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class videoPlayer extends StatefulWidget {
  @override
  _videoPlayerState createState() => _videoPlayerState();
}

class _videoPlayerState extends State<videoPlayer> {
  VideoPlayerController controller;
  Future<void> futureController;
  final myController = TextEditingController();
  String filepath;

  @override
  void initState() {
    controller = VideoPlayerController.asset("assets/video.mp4");
    //controller = VideoPlayerController.network(
    //    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4");
    futureController = controller.initialize();
    //creating the object for futureController from the controller

    controller.setLooping(true);
    controller.setVolume(25.0);
    super.initState();
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context)),
          title: Text("Video Player"),
        ),
        body: Column(
          children: <Widget>[
            // Text(myController.text),
            // TextField(
            //   controller: myController,
            // ),
            // RaisedButton(
            //   onPressed: () {
            //     print(myController.text);
            //   },
            //   child: Text("Submit"),
            // ),
            // Text("Lol"),
            FutureBuilder(
                future: futureController,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done)
                    //meaning that the video is active
                    return Container(
                        height: 600,
                        width: 500,
                        child: VideoPlayer(controller));
                  else
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                }),
            if (!controller.value.isPlaying)
               Center(
                  child: RaisedButton(
                      child: Icon(Icons.play_arrow),
                      onPressed: () {
                        setState(() {
                          controller.play();
                        });
                      }))
            else
               Center(
                  child: RaisedButton(
                      child: Icon(Icons.pause),
                      onPressed: () {
                        setState(() {
                          controller.pause();
                        });
                      })),
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
                onPressed: () {
                  //filepath = await FilePicker.getFilePath();

                  //setState(() {
                  //controller = VideoPlayerController.file(filepath);
                  //   futureController = controller.initialize();
                  //   //creating the object for futureController from the controller

                  //   controller.setLooping(true);
                  //   controller.setVolume(25.0);
                  // });
                },
              ),
              SizedBox(
                width: 100,
              ),
              IconButton(icon: Icon(Icons.cloud_download), onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

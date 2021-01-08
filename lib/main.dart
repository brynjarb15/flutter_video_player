import 'package:flutter/material.dart';
import 'package:video_player_360/video_player_360.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flow Meditation',
      home: VideoPlayerAround(),
    );
  }
}

class VideoPlayerAround extends StatefulWidget {
  @override
  _VideoPlayerAroundState createState() => _VideoPlayerAroundState();
}

class _VideoPlayerAroundState extends State<VideoPlayerAround> {
  Widget menu(Orientation orientation) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
                bottom: orientation == Orientation.portrait ? 120 : 50),
            child: Image.asset(
              'images/FlowSignature3.png',
              scale: 0.8,
            ),
          ),
          RaisedButton(
            color: Colors.purple[600],
            onPressed: () async {
              await VideoPlayer360.playVideoURL(
                  'https://drive.google.com/u/0/uc?id=19wWYnbwwCJeDcGf09YidQrb-bdhGf8uC&export=download');
            },
            child: Text('Click here to start',
                style: TextStyle(fontSize: 18, color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text('Flow Meditation'),
        ),
        //Get the orientation of the screen
        body: OrientationBuilder(builder: (context, orientation) {
          return menu(orientation);
        }),
      ),
    );
  }
}

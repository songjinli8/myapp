import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(VideoApp());

class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        //'http://218.98.55.139:9999/video/9f/d2/d29fcc015336573276be704564e2fa8a?c=web')
        //'https://www.runoob.com/try/demo_source/mov_bbb.mp4')
        //'http://192.168.209.6:8080')
        //'http://218.98.55.139:9999/video/9c/68/689c713d79953f5ce30f131bbeef4a55?c=web')
        //'http://180.101.138.139:9999/video/9c/68/689c713d79953f5ce30f131bbeef4a55?c=web')
        //'http://180.101.138.139:9999/video/78/18/18781f2e1c9de2b81eaec562a9243a46?c=web')
        'http://180.101.138.139:9999/video/fa/b9/b9fa89cc1ee498431eec123f7c565178?c=web')
        //'http://180.101.138.139:9999/video/ed/25/25ed424bbe73911191233fb055029304?c=web')
        //'http://180.101.138.140:9999/source/silian-s2e1.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });

    _controller.addListener((){
      if (_controller.value.hasError){
        print(_controller.value.errorDescription);
      }
      if (_controller.value.initialized) {
        print("initialized..........");
      }
      if (_controller.value.isBuffering) {
        print("buffer.........");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body: Center(
          child: _controller.value.initialized
              ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
              : Container(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}




/*
//const String VIDEO_URL = 'https://www.runoob.com/try/demo_source/mov_bbb.mp4';

const String VIDEO_URL = 'http://218.98.55.139:9999/video/9f/d2/d29fcc015336573276be704564e2fa8a?c=web';
//const String VIDEO_URL = 'http://218.98.55.139:9999/video/95/e5/e595e00645bf14bcb7635ad99f14a0ca.mp4';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('video_player'),
          ),
          body: HomeContent()),
    );
  }
}

class HomeContent extends StatefulWidget {
  HomeContent({Key key}) : super(key: key);

  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  VideoPlayerController _controller;
  Future _initializeVideoPlayerFuture;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(VIDEO_URL);
    _controller.setLooping(true);
    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            print(snapshot.connectionState);
            if (snapshot.hasError) print(snapshot.error);
            if (snapshot.connectionState == ConnectionState.done) {
              return AspectRatio(
                // aspectRatio: 16 / 9,
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        SizedBox(height: 30),
        RaisedButton(
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
          onPressed: () {
            setState(() {
              if (_controller.value.isPlaying) {
                _controller.pause();
              } else {
                // If the video is paused, play it.
                _controller.play();
              }
            });
          },
        )
      ],
    );
  }
}
 */
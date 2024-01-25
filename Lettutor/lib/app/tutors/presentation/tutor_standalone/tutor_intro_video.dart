
import 'package:flutter/material.dart';
import 'package:lettutor/core/constant.dart';
import 'package:video_player/video_player.dart';

class TutorIntroVideo extends StatefulWidget {
  const TutorIntroVideo({super.key, required this.tutorVideo});

  final String tutorVideo;

  @override
  State<TutorIntroVideo> createState() => _TutorIntroVideoState();
}

class _TutorIntroVideoState extends State<TutorIntroVideo> {

  late VideoPlayerController videoPlayerController;
  late Future<void> _initializeVideoPlayerFuture;


  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(widget.tutorVideo));

    _initializeVideoPlayerFuture = videoPlayerController.initialize();
  }


  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        return snapshot.connectionState == ConnectionState.done
            ? Stack(
          children: <Widget>[
            AspectRatio(
              aspectRatio: width < mobileWidth ? videoPlayerController.value.aspectRatio : videoPlayerController.value.aspectRatio * 5,
              child: VideoPlayer(videoPlayerController),
            ),
            // Add a play or pause button overlay
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                color: Colors.grey.withOpacity(0.5),
                alignment: Alignment.center,
                child: TextButton(
                  child: Icon(
                    videoPlayerController.value.isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // pause while video is playing, play while video is pausing
                    setState(() {
                      videoPlayerController.value.isPlaying
                          ? videoPlayerController.pause()
                          : videoPlayerController.play();
                    });
                  },
                ),
              ),
            )
          ],
        )
            : const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}


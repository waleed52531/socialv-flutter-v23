import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerComponent extends StatefulWidget {
  final String id;

  YoutubePlayerComponent({required this.id});

  @override
  State<YoutubePlayerComponent> createState() => _YoutubePlayerComponentState();
}

class _YoutubePlayerComponentState extends State<YoutubePlayerComponent> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: widget.id,
      flags: YoutubePlayerFlags(autoPlay: false, mute: false,disableDragSeek: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      actionsPadding: EdgeInsets.zero,
      showVideoProgressIndicator: false,
    ).cornerRadiusWithClipRRect(10);
  }
}

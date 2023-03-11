import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class IframeYoutubePlayer extends StatefulWidget {
  const IframeYoutubePlayer(
    this.initVideoUrl, {
    required this.body,
    this.isNeedInitFullScreen = false,
    Key? key,
  }) : super(key: key);

  final String initVideoUrl;
  final bool isNeedInitFullScreen;

  final Widget Function(
    BuildContext context,
    Widget widget,
    YoutubePlayerController controller,
  ) body;

  @override
  State<IframeYoutubePlayer> createState() => _IframeYoutubePlayerState();
}

class _IframeYoutubePlayerState extends State<IframeYoutubePlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      params: const YoutubePlayerParams(
        showControls: true,
        mute: false,
        showFullscreenButton: true,
        loop: false,
        captionLanguage: 'id',
        interfaceLanguage: 'id',
      ),
    )
      ..onInit = () {
        _controller.loadVideo(widget.initVideoUrl);
        if (widget.isNeedInitFullScreen) {
          _controller.enterFullScreen(lock: true);
        }
      }
      ..onFullscreenChange = (isFullScreen) {
        log('${isFullScreen ? 'Entered' : 'Exited'} Fullscreen.');
      };
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerScaffold(
      controller: _controller,
      builder: (context, player) {
        return widget.body(
          context,
          player,
          _controller,
        );
      },
    );
  }
}

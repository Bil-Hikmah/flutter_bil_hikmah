import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/text.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerField extends StatefulWidget {
  const YoutubePlayerField({Key? key}) : super(key: key);

  @override
  State<YoutubePlayerField> createState() => _YoutubePlayerFieldState();
}

class _YoutubePlayerFieldState extends State<YoutubePlayerField> {
  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late YoutubeMetaData _videoMetaData;

  late PlayerState _playerState;
  bool _muted = false;
  bool _isPlayerReady = false;

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: "nPt8bK2gbaU",
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: AppColors.primaryDark,
        topActions: <Widget>[
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              _controller.metadata.title,
              style: AppTextStyle.textExtraLarge.copyWith(
                color: AppColors.white,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
              size: 25.0,
            ),
            onPressed: () {
              // log('Settings Tapped!');
            },
          ),
        ],
      ),
      builder: (context, widget) => Container(),
    );
  }
}

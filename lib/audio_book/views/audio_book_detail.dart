import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:provider/provider.dart';

import '../../audio_book/provider/audio_book_provider.dart';
import '../../constants/colors.dart' as CustomColors;

class AudioBookDetail extends StatefulWidget {
  final int index;

  const AudioBookDetail({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  _AudioBookDetailState createState() => _AudioBookDetailState();
}

class _AudioBookDetailState extends State<AudioBookDetail> {
  late InfiniteScrollController _controller;
  int _selectedIndex = 0;

  late AudioPlayer _audioPlayer;
  AudioPlayerState _playerState = AudioPlayerState.STOPPED;
  bool _isStarting = false;
  Duration? _totalTime;
  Duration? _currentTime;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.index;
    _controller = InfiniteScrollController(initialItem: _selectedIndex);
    _audioPlayer = AudioPlayer();
    _audioPlayer.onPlayerStateChanged.listen(_playerStateChanged);
    _audioPlayer.onDurationChanged.listen(_playerDurationChanged);
    _audioPlayer.onAudioPositionChanged.listen(_playerCurrentPositionChanged);
    _audioPlayer.onPlayerCompletion.listen(_playerOnComplete);
  }

  _playerStateChanged(AudioPlayerState s) {
    _playerState = s;
    setState(() {});
  }

  _playerDurationChanged(Duration d) {
    _totalTime = d;
    setState(() {});
  }

  _playerCurrentPositionChanged(Duration d) {
    if (_isStarting) {
      if (d.inSeconds > 0.5) _isStarting = false;
    }
    _currentTime = d;
    setState(() {});
  }

  _playerOnComplete(event) {
    _playNext();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _audioPlayer.dispose();
  }

  _play() async {
    _isStarting = true;
    setState(() {});
    await _audioPlayer.play(
      context.read<AudioBookProvider>().model!.data[_selectedIndex].file,
    );
    setState(() {});
  }

  _pause() {
    _audioPlayer.pause();
  }

  _rePlay() {
    _audioPlayer.seek(Duration(seconds: 0));
    _play();
  }

  _playPre() {
    if (_selectedIndex > 0) {
      _controller.animateToItem(_selectedIndex - 1);
      _selectedIndex = _selectedIndex - 1;
    } else {
      _controller.animateToItem(
        context.read<AudioBookProvider>().model!.data.length - 1,
      );
      _selectedIndex = context.read<AudioBookProvider>().model!.data.length - 1;
    }
    _play();
  }

  _playNext() {
    if (_selectedIndex <
        context.read<AudioBookProvider>().model!.data.length - 1) {
      _controller.animateToItem(_selectedIndex + 1);
      _selectedIndex = _selectedIndex + 1;
    } else {
      _controller.animateToItem(0);
      _selectedIndex = 0;
    }
    _play();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final aBook = context.watch<AudioBookProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColors.PRIMARY_COLOR,
          foregroundColor: CustomColors.TEXT_WHITE,
          title: Text(
            'Bhagavad Geeta',
          ),
          actions: [
            IconButton(
              icon: Icon(
                CupertinoIcons.heart_fill,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                CupertinoIcons.ellipsis_vertical,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 16.0,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '${_selectedIndex + 1} of ${aBook.model!.data.length}',
                maxLines: 1,
                style: TextStyle(
                  fontSize: 12.0,
                  color: CustomColors.TEXT_BLACK,
                ),
              ),
            ),
            SizedBox(
              height: width * 0.7,
              child: InfiniteCarousel.builder(
                controller: _controller,
                itemCount: aBook.model!.data.length,
                itemExtent: width * 0.7,
                loop: true,
                center: true,
                onIndexChanged: (index) {
                  print(index);
                  if (_selectedIndex != index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                    if (_playerState != AudioPlayerState.STOPPED) _play();
                  }
                },
                itemBuilder: (context, itemIndex, realIndex) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(36.0),
                      child: GestureDetector(
                        onTap: () {
                          _controller.animateToItem(realIndex);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: CustomColors.TEXT_WHITE,
                            borderRadius: BorderRadius.circular(36.0),
                            boxShadow: kElevationToShadow[2],
                            image: DecorationImage(
                              image: NetworkImage(
                                aBook.model!.data[_selectedIndex].thumbnail,
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    aBook.model!.data[_selectedIndex].title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: CustomColors.TEXT_RED,
                    ),
                  ),
                  Text(
                    aBook.model!.data[_selectedIndex].excerpt,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: CustomColors.TEXT_BLACK,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 24.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Text(
                            _printDuration(_currentTime),
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 10.0,
                              color: CustomColors.TEXT_BLACK,
                            ),
                          ),
                          Expanded(
                            child: SizedBox(),
                          ),
                          Text(
                            _printDuration(_totalTime),
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 10.0,
                              color: CustomColors.TEXT_BLACK,
                            ),
                          ),
                        ],
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4.0),
                        child: LinearProgressIndicator(
                          value: _currentTime != null
                              ? (_currentTime!.inMilliseconds /
                                  _totalTime!.inMilliseconds)
                              : 0,
                          backgroundColor: CustomColors.GREY,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            CustomColors.PRIMARY_COLOR.withOpacity(0.7),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        _rePlay();
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 28.0,
                        child: Center(
                          child: Icon(
                            CupertinoIcons.arrow_2_squarepath,
                            color: CustomColors.TEXT_BLACK,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: _playPre,
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 28.0,
                        child: Center(
                          child: Icon(
                            CupertinoIcons.backward_end,
                            color: CustomColors.TEXT_BLACK,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                    _isStarting
                        ? CircularProgressIndicator.adaptive()
                        : InkWell(
                            onTap: () {
                              if (_playerState != AudioPlayerState.PLAYING)
                                _play();
                              else
                                _pause();
                            },
                            child: CircleAvatar(
                              backgroundColor: CustomColors.PRIMARY_COLOR,
                              radius: 24.0,
                              child: Center(
                                child: Icon(
                                  _playerState != AudioPlayerState.PLAYING
                                      ? CupertinoIcons.play_arrow_solid
                                      : CupertinoIcons.pause_solid,
                                  color: CustomColors.TEXT_WHITE,
                                  size: 28.0,
                                ),
                              ),
                            ),
                          ),
                    InkWell(
                      onTap: _playNext,
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 28.0,
                        child: Center(
                          child: Icon(
                            CupertinoIcons.forward_end,
                            color: CustomColors.TEXT_BLACK,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _selectedIndex = Random().nextInt(
                          aBook.model!.data.length,
                        );
                        _play();
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 28.0,
                        child: Center(
                          child: Icon(
                            CupertinoIcons.alt,
                            color: CustomColors.TEXT_BLACK,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 48.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _printDuration(Duration? duration) {
    if (duration == null) {
      return '0.00';
    }
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
}

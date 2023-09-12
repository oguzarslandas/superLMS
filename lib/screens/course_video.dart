import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lms_education/common/topBar.dart';
import 'package:lms_education/global/global.dart';
import 'package:lms_education/screens/chewie.dart';
import 'package:lms_education/theme/box_icons_icons.dart';
import 'package:lms_education/theme/colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:readmore/readmore.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../common/sectionHeader.dart';

class CourseVideoPage extends StatefulWidget {
  CourseVideoPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _YoutubePlayerDemoState createState() => _YoutubePlayerDemoState();
}

class _YoutubePlayerDemoState extends State<CourseVideoPage> {
  late bool local;
  late VideoPlayerController _controller;

  static const List<double> _examplePlaybackRates = <double>[
    0.25,
    0.5,
    1.0,
    1.5,
    2.0,
  ];

  @override
  void initState() {
    _controller = VideoPlayerController.network('https://'
        'player.vimeo.com/progressive_redirect/playback/738271412/rendition/'
        '1080p/file.mp4?loc=external&signature=b4ac532ca6f446de3a53ba9e29a5d'
        '7e54f3bca0acb5ae61528a44d75222a0ef8')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        Duration ia = _controller.value.duration;
        CourseTotalVideoTime = ia.abs().inSeconds;
        print(ia.abs().inSeconds);
        print(ia);
        setState(() {});
      });
    init();
    super.initState();
    local = true;
  }

  void init() async {
    /// toplam video uzunluğu
    await _controller.initialize();
    //  controller.value.caption.start.inSeconds.toString();
  }

  @override
  void dispose() {
    _controller.dispose();
    CourseVideoPosition = _controller.value.position.inSeconds;
    print(_controller.value.position.inSeconds);

    print(_controller.value.position.inSeconds);
    CoursevideoPercent = ((CourseVideoPosition / CourseTotalVideoTime) * 100);
    print(CoursevideoPercent.round());
    CoursevideoPercent2 = (CoursevideoPercent / 100).toString();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: colors.primarycolor,
      body: SafeArea(
        child: Column(
        //  crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildVideosWidget(context),
            _buildArrrows(),
            _buildHeadline(),
            _buildCategoryWidget(),
            local ? _buildVideoList() : _buildCertificate(),
            local ? _buildProgressBar() : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon:
        const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
        onPressed: () => Navigator.of(context).pop(),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.all(10),
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(
              BoxIcons.bx_share_alt,
              size: 20,
            ),
            label: const Text('Paylaş'),
            style: ElevatedButton.styleFrom(
              primary: colors.buttonColor,
            ),
          ),
        )
      ],
      backgroundColor: const Color(0xFFFAFAFA),
      title: const Text(
        'Eğitim',
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Red Hat Display',
        ),
      ),
    );
  }

  _buildEnrollButton() {
    return Container(
      //  color: Colors.white10,
      //  height: MediaQuery.of(context).size.height * 0.10,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Row(
        //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Sertifika Yükselt',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                    fontFamily: 'Red Hat Display'
                ),
              ),
              style: ElevatedButton.styleFrom(
                  primary: colors.buttonColor,
                padding: const EdgeInsets.all(15)
              ),
            ),
          )
        ],
      ),
    );
  }

  bool isVideoTopic = false;

  _buildVideoTopic(BuildContext context) {
    return Container(
        color: colors.primarycolor,
        //    height: MediaQuery.of(context).size.height * 0.30,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isVideoTopic = !isVideoTopic;
                });
              },
              child: Card(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 11),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: const [
                            Icon(Icons.keyboard_arrow_down_rounded),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Başlamadan Önce',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Red Hat Display'),
                            ),
                          ],
                        ),
                      ),
                      CircularPercentIndicator(
                        radius: 45.0,
                        lineWidth: 3.0,
                        animation: true,
                        animationDuration: 1200,
                        percent: double.parse(CoursevideoPercent2),
                        center: Text('%' + CoursevideoPercent.round().toString(), style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Red Hat Display'),),
                        progressColor: colors.trueColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            isVideoTopic
                ? _buildVideos(context) : const SizedBox.shrink(),
            Card(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 11),
                child: Row(
                  children: const [
                    Icon(Icons.keyboard_arrow_down_rounded),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Giriş',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Red Hat Display'),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 11),
                child: Row(
                  children: const [
                    Icon(Icons.keyboard_arrow_down_rounded),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Kotlin Temelleri',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Red Hat Display'),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 11),
                child: Row(
                  children: const [
                    Icon(Icons.keyboard_arrow_down_rounded),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Neler Gerekli?',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Red Hat Display'),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 11),
                child: Row(
                  children: const [
                    Icon(Icons.keyboard_arrow_down_rounded),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Kotlin Temelleri',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Red Hat Display'),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 11),
                child: Row(
                  children: const [
                    Icon(Icons.keyboard_arrow_down_rounded),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Kotlin Temelleri',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Red Hat Display'),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 11),
                child: Row(
                  children: const [
                    Icon(Icons.keyboard_arrow_down_rounded),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Kotlin Temelleri',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Red Hat Display'),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 11),
                child: Row(
                  children: const [
                    Icon(Icons.keyboard_arrow_down_rounded),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Kotlin Temelleri',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Red Hat Display'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  _buildVideos(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: 5,
          itemBuilder: (context, index) {
            return  ListTile(
              leading: const Icon(
                BoxIcons.bx_play_circle,
                color: colors.trueColor,
              ),
              title: const Text(
                '1. Android Studio Kurulumu',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Red Hat Display',
                ),
              ),
              trailing: Icon(
                BoxIcons.bx_download,
                size: 20,
                color: colors.buttonColor,
              ),
            );
          }),
    );
  }

  _buildVideosWidget(BuildContext context) {
    return Container(
      color: Colors.black,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.30,
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: SizedBox(
        child: AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              VideoPlayer(_controller),
              ClosedCaption(text: _controller.value.caption.text),
              _buildvideoControl(context),
              VideoProgressIndicator(_controller, allowScrubbing: true,
                padding: const EdgeInsets.symmetric(vertical: 5),
                colors: const VideoProgressColors(
                  playedColor: colors.borderColor,
                  bufferedColor: colors.falseColor,
                  backgroundColor: Colors.white54,
                ),),
            ],
          ),
        ),
      ),
    );
  }

  _buildArrrows() {
    return Container(
      color: colors.primarycolor,
      height: MediaQuery.of(context).size.height * 0.05,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              print('geri');
            },
            child: Row(
              children: const [Icon(BoxIcons.bx_left_arrow, size: 18,), Text('Önceki', style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Red Hat Display'),)],
            ),
          ),
          GestureDetector(
            onTap: () {
              print('ileri');
            },
            child: Row(
              children: const [
                Text('Sonraki', style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Red Hat Display'),),
                Icon(BoxIcons.bx_right_arrow, size: 18,),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildHeadline() {
    return Container(
        color: colors.primarycolor,
        width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height * 0.05,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text(
              'Kotlin ile Mobil Uygulamaya Giriş',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Red Hat Display'),
            ),
          ],
        ));
  }

  _buildCertificate() {
    return Container(
        //  color: Colors.white10,
        height: MediaQuery.of(context).size.height * 0.40,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: colors.borderColor),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/sertifika.jpg'),
                      fit: BoxFit.cover
                    )
                  ),
                )),
            _buildEnrollButton(),
          ],
        ));
  }

  _buildCategoryWidget() {
    return Positioned(
      top: 0,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                //     height: MediaQuery.of(context).size.height * 0.07,
                color: colors.primarycolor,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CupertinoButton(
                        onPressed: () {
                          setState(() {
                            local = true;
                          });
                        },
                        child: const Text(
                          "Konular",
                          style: TextStyle(
                              color: colors.topicColor,
                              fontSize: 16,
                              fontFamily: 'Red Hat Display',
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      CupertinoButton(
                        onPressed: () {
                          setState(() {
                            local = false;
                          });
                        },
                        child: const Text(
                          "Sertifika",
                          style: TextStyle(
                              color: colors.topicColor,
                              fontSize: 16,
                              fontFamily: 'Red Hat Display',
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ]),
              )
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: AnimatedContainer(
              margin: local
                  ? EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.16 - 60)
                  : EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.50),
              width: MediaQuery.of(context).size.width * 0.50,
              height: 4,
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                  color: colors.borderColor,
                  borderRadius: BorderRadius.circular(500)),
            ),
          )
        ],
      ),
    );
  }

  _buildProgressBar() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      decoration: BoxDecoration(
        color: colors.progresColor,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('ilerleme Durumu', style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Red Hat Display'),),
              Text('%' + CoursevideoPercent.round().toString(), style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Red Hat Display'),),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 3),
          //  width: 300,
            height: 15,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: LinearProgressIndicator(
                value: double.parse(CoursevideoPercent2),
                valueColor: const AlwaysStoppedAnimation<Color>(colors.borderColor),
                backgroundColor: Colors.white54,
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildVideoList() {
    return Expanded(
      child: Container(
        //  color: Colors.white10,
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            ///           _buildArrrows(),
            ///           _buildEnrollButton(),
            ///           _buildVideoExplain(),
            ///           _buildVideoIncludes(),
            _buildVideoTopic(context),
          ],
        ),
      ),
    );
  }

  _buildvideoControl(BuildContext context) {
     return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          reverseDuration: const Duration(milliseconds: 200),
          child: _controller.value.isPlaying
              ? const SizedBox.shrink()
              : Container(
            color: Colors.black26,
            child: const Center(
              child: Icon(
                BoxIcons.bx_play,
                color: colors.borderColor,
                size: 80.0,
                semanticLabel: 'Play',
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isPercent();
              CourseVideoPosition = _controller.value.position.inSeconds;
              print(_controller.value.position.inSeconds);
              CoursevideoPercent = ((CourseVideoPosition / CourseTotalVideoTime) * 100);
              print(CoursevideoPercent.round());
              CoursevideoPercent2 = (CoursevideoPercent / 100).toString();
              _controller.value.isPlaying ? _controller.pause() : _controller.play();
            });
          },
        ),
        /*    Align(
          alignment: Alignment.topLeft,
          child: PopupMenuButton<Duration>(
            initialValue: controller.value.captionOffset,
            tooltip: 'Caption Offset',
            onSelected: (Duration delay) {
              controller.setCaptionOffset(delay);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<Duration>>[
                for (final Duration offsetDuration in _exampleCaptionOffsets)
                  PopupMenuItem<Duration>(
                    value: offsetDuration,
                    child: Text('${offsetDuration.inMilliseconds}ms', style: TextStyle(color: Colors.purple),),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // Using less vertical padding as the text is also longer
                // horizontally, so it feels like it would need more spacing
                // horizontally (matching the aspect ratio of the video).
                vertical: 12,
                horizontal: 16,
              ),
              child: Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Text('${controller.value.captionOffset.inMilliseconds}ms', style: TextStyle(color: Colors.purple),)),
            ),
          ),
        ),*/
        Align(
          alignment: Alignment.topRight,
          child: PopupMenuButton<double>(
            initialValue: _controller.value.playbackSpeed,
            tooltip: 'Playback speed',
            onSelected: (double speed) {
              _controller.setPlaybackSpeed(speed);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<double>>[
                for (final double speed in _examplePlaybackRates)
                  PopupMenuItem<double>(
                    value: speed,
                    child: Text('${speed}x', style: const TextStyle(color: colors.borderColor),),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // Using less vertical padding as the text is also longer
                // horizontally, so it feels like it would need more spacing
                // horizontally (matching the aspect ratio of the video).
                vertical: 12,
                horizontal: 16,
              ),
              child: _controller.value.isPlaying
                  ? Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Text('${_controller.value.playbackSpeed}x', style: const TextStyle(color: colors.borderColor),)) :  const SizedBox.shrink(),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              // Using less vertical padding as the text is also longer
              // horizontally, so it feels like it would need more spacing
              // horizontally (matching the aspect ratio of the video).
              vertical: 12,
              horizontal: 16,
            ),
            child:ValueListenableBuilder(
              valueListenable: _controller,
              builder: (context, VideoPlayerValue value, child) {
                //Do Something with the value.
                format(Duration d) => d.toString().split('.').first.padLeft(8, "0");
                return Text(format(value.position) + '/' + format(value.duration) , style: const TextStyle(color: Colors.white),);
              },
            ),
          ),
        ),
      ],
    );
  }

  void isPercent() {
    setState(() {
      print(_controller.value.position.inSeconds);
      CoursevideoPercent = ((CourseVideoPosition / CourseTotalVideoTime) * 100);
      print(CoursevideoPercent.round());
      CoursevideoPercent2 = (CoursevideoPercent / 100).toString();
    });
  }
}
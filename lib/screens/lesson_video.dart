import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lms_education/global/global.dart';
import 'package:lms_education/screens/chewie.dart';
import 'package:lms_education/theme/box_icons_icons.dart';
import 'package:lms_education/theme/colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:readmore/readmore.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../common/sectionHeader.dart';

class LessonVideoPage extends StatefulWidget {
  LessonVideoPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _YoutubePlayerDemoState createState() => _YoutubePlayerDemoState();
}

class _YoutubePlayerDemoState extends State<LessonVideoPage> {
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
        TotalVideoTime = ia.abs().inSeconds;
        print(ia.abs().inSeconds);
        print(ia);
        setState(() {});
      });
    init();
    super.initState();
    _setOrientation([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void init() async {
    /// toplam video uzunluğu
    await _controller.initialize();
    //  controller.value.caption.start.inSeconds.toString();
  }


  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    VideoPosition = _controller.value.position.inSeconds;
    print(_controller.value.position.inSeconds);

    print(_controller.value.position.inSeconds);
    videoPercent = ((VideoPosition / TotalVideoTime) * 100);
    print(videoPercent.round());
    videoPercent2 = (videoPercent / 100).toString();

    _setOrientation([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  _setOrientation(List<DeviceOrientation> orientations) {
    SystemChrome.setPreferredOrientations(orientations);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            _buildVideosWidget(context),
            _buildVideoList(),
          ],
        ),
      ),
    );
  }

  void isPercent() {
    setState(() {
      print(_controller.value.position.inSeconds);
      videoPercent = ((VideoPosition / TotalVideoTime) * 100);
      print(videoPercent.round());
      videoPercent2 = (videoPercent / 100).toString();
    });
  }

  _buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
        onPressed: () => Navigator.of(context).pop(),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.all(10),
          child: ElevatedButton.icon(onPressed: () {

          },
            icon: const Icon(BoxIcons.bx_share_alt, size: 20,),
            label: const Text('Paylaş'),
            style: ElevatedButton.styleFrom(
              primary: colors.secondcolor,
            ),
          ),
        )
      ],
      backgroundColor: colors.primarycolor,
      title: const Text('Eğitim Detayı', style: TextStyle(
        color: Colors.black,
        fontFamily: 'Red Hat Display',
      ),),
    );
  }

  _buildEnrollButton() {
    return Container(
      //  color: Colors.white10,
  //    height: MediaQuery.of(context).size.height * 0.05,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
    //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/coursevideo');
            },
                child: const Text('Hemen Kayıt Ol', style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
         //         fontFamily: 'Red Hat Display'
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
  //    color: Colors.black,
  //    height: MediaQuery.of(context).size.height * 0.30,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Kurs Konuları', style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              fontFamily: 'Red Hat Display'
          ),
          ),
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
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 11),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: const [
                          Icon(Icons.keyboard_arrow_down_rounded),
                          SizedBox(
                            width: 5,
                          ),
                          Text('Başlamadan Önce', style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Red Hat Display'
                          ),
                          ),
                        ],
                      ),
                    ),
                    CircularPercentIndicator(
                      radius: 45.0,
                      lineWidth: 3.0,
                      animation: true,
                      animationDuration: 1200,
                      percent: double.parse(videoPercent2),
                      center: Text('%' + videoPercent.round().toString(), style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Red Hat Display'
                      ),),
                      progressColor: colors.trueColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
       isVideoTopic ?
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const Icon(BoxIcons.bx_play_circle, color: colors.trueColor,),
                      title: const Text('1. Android Studio Kurulumu', style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Red Hat Display',
                      ),),
                      trailing: Icon(BoxIcons.bx_download, size: 20, color: colors.buttonColor,),
                    );
                  }
              ),
            ) : Container(),
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 11),
              child: Row(
                children: const [
                  Icon(Icons.keyboard_arrow_down_rounded),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Giriş', style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Red Hat Display'
                  ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 11),
              child: Row(
                children: const [
                  Icon(Icons.keyboard_arrow_down_rounded),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Kotlin Temelleri', style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Red Hat Display'
                  ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 11),
              child: Row(
                children: const [
                  Icon(Icons.keyboard_arrow_down_rounded),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Neler Gerekli?', style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Red Hat Display'
                  ),
                  ),
                ],
              ),
            ),
          )
        ],
      )
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
            child: Center(
              child: Icon(
                BoxIcons.bx_play,
                color: colors.buttonColor,
                size: 80.0,
                semanticLabel: 'Play',
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              VideoPosition = _controller.value.position.inSeconds;
              print(_controller.value.position.inSeconds);
              videoPercent = ((VideoPosition / TotalVideoTime) * 100);
              print(videoPercent.round());
              videoPercent2 = (videoPercent / 100).toString();
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
                    child: Text('${speed}x', style: TextStyle(color: colors.buttonColor),),
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
                  child: Text('${_controller.value.playbackSpeed}x', style: TextStyle(color: colors.buttonColor),)) :  const SizedBox.shrink(),
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
              colors: const VideoProgressColors(
                bufferedColor: colors.borderColor,
                playedColor: colors.borderColor,
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildVideoExplain() {
    return Container(
      //  color: Colors.white10,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Kotlin ile Mobil Uygulamaya Giriş', style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: 'Red Hat Display'
          ),
          ),
          const SizedBox(
            height: 5,
          ),
          ReadMoreText('Android için Mobil Uygulama yazmayı sıfırdan ileri seviyeye kadar öğrenmek istiyorsanız bu kurs tam size göre '
              'Android geliştirmeyi son teknoloji ile öğreneceksiniz: Android + Java + Kotlin'
              'Google Android geliştirme için Java haricinde Kotlini de destekleyeceğini açıkladı.'
              'Daha da ötesi Kotlini birinci dil tercihi olarak belirtti. Dört dörtlük bir yazılımcı '
              'olmak istiyorsanız iki dili de öğrenmek için doğru yerdesiniz.', style: const TextStyle(
            fontSize: 14,
            color: Colors.black54,
            fontWeight: FontWeight.w400,
          ),
            trimLines: 2,
            colorClickableText: colors.buttonColor,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'daha fazla',
            trimExpandedText: 'daha az',
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text('4.7', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: colors.rateColor),),
              SizedBox(width: 5,),
              Icon(BoxIcons.bxs_star, size: 12, color: colors.rateColor),
              Icon(BoxIcons.bxs_star, size: 12, color: colors.rateColor,),
              Icon(BoxIcons.bxs_star, size: 12, color: colors.rateColor),
              Icon(BoxIcons.bxs_star, size: 12, color: colors.rateColor,),
              Icon(BoxIcons.bxs_star_half, size: 12, color: colors.rateColor,),
              SizedBox(width: 5,),
              Text('(1.259)', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.black54),),
            ],
          )
        ],
      ),
    );
  }

  _buildVideoIncludes() {
    return Container(
      //  color: Colors.white10,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Kurs İçerikleri', style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              fontFamily: 'Red Hat Display'
          ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
        //    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(BoxIcons.bx_video_recording, size: 22, color: colors.buttonColor,),
                        const SizedBox(
                          width: 3,
                        ),
                        const Text('48 saat video',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(BoxIcons.bx_revision, size: 22, color: colors.buttonColor),
                        const SizedBox(
                          width: 3,
                        ),
                        const Text('Ömür Boyu Erişim',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(BoxIcons.bx_archive_in, size: 22, color: colors.buttonColor,),
                        const SizedBox(
                          width: 3,
                        ),
                        const Text('İndirme',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(BoxIcons.bx_file, size: 22, color: colors.buttonColor),
                        const SizedBox(
                          width: 3,
                        ),
                        const Text('106 Döküman',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(BoxIcons.bx_bulb, size: 22, color: colors.buttonColor,),
                        const SizedBox(
                          width: 3,
                        ),
                        const Text('12 Alıştırma',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(BoxIcons.bx_certification, size: 22, color: colors.buttonColor,),
                        const SizedBox(
                          width: 3,
                        ),
                        const Text('Sertifika',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
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
            //     _buildArrrows(),
            _buildEnrollButton(),
            _buildVideoExplain(),
            _buildVideoIncludes(),
            _buildVideoTopic(context),
          ],
        ),
      ),
    );
  }
}

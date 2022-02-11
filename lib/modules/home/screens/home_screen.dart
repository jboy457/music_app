import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/constants/colors.dart';
import 'package:music_app/constants/fonts.dart';
import 'package:music_app/constants/icons.dart';
import 'package:music_app/constants/images.dart';
import 'package:music_app/modules/home/models/artist.dart';
import 'package:music_app/modules/home/models/song.dart';
import 'package:music_app/widgets/avatar_widget.dart';
import 'package:music_app/widgets/nav_icon.dart';
import 'package:music_app/widgets/song_card.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../widgets/artist_card.dart';
import '../../../widgets//action.dart';
import '../../../widgets/lyrics_panel.dart';
import '../../../widgets/song_mini_detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PanelController _panelController = PanelController();
  Color panelColor = Colors.transparent;
  List<BoxShadow> panelShadow = <BoxShadow>[
    BoxShadow(
        blurRadius: 8.0,
        offset: const Offset(2, -7),
        color: const Color.fromRGBO(0, 0, 0, 0.25).withOpacity(0.1)),
  ];

  int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final List<Artist> artistList = Artists.artistsList();
    final List<Song> songList = Songs.songList();
    final List<Color> colorList = [
      AppColors.purple,
      AppColors.green,
      AppColors.purple
    ];
    EdgeInsets leftMargin(constraint) {
      return EdgeInsets.only(
        left: constraint.maxWidth > 450
            ? constraint.maxWidth * 0.03
            : constraint.maxWidth * 0.05,
        top: constraint.maxHeight * 0.04,
      );
    }

    double _sigmaX = 10;
    double _sigmaY = 10;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: LayoutBuilder(builder: (context, constraint) {
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: constraint.maxWidth > 450
                              ? constraint.maxWidth * 0.03
                              : constraint.maxWidth * 0.05,
                          vertical: constraint.maxHeight * 0.02,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Avatar(
                              radius: 28,
                              iconHeight: 45,
                              iconWidth: 45,
                            ),
                            NavIcon(
                                icon: SvgPicture.asset(AppIcons.search),
                                onPressed: () {}),
                          ],
                        ),
                      ),
                      Container(
                        margin: leftMargin(constraint),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: constraint.maxWidth > 450
                                  ? constraint.maxWidth * 0.95
                                  : constraint.maxWidth * 0.6,
                              child: Text('Find the best music for you',
                                  style: AppFonts.fontStyle(
                                    size: 28,
                                    weight: FontWeight.w900,
                                    color: AppColors.grey,
                                  )),
                            ),
                            if (constraint.maxWidth < 450)
                              Image.asset(
                                AppImages.pointHand,
                                width: constraint.maxWidth * 0.3,
                              )
                          ],
                        ),
                      ),
                      Container(
                        margin: leftMargin(constraint),
                        width: constraint.maxWidth * 0.95,
                        height: constraint.maxHeight < 500
                            ? constraint.maxHeight * 0.25
                            : constraint.maxHeight * 0.11,
                        child: ListView.builder(
                          itemCount: artistList.length,
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.all(0),
                          itemBuilder: (ctx, index) {
                            return ArtistCard(
                                height: constraint.maxWidth > 450
                                    ? constraint.maxHeight * 0.2
                                    : constraint.maxHeight * 0.1,
                                width: constraint.maxWidth > 450
                                    ? constraint.maxWidth * 0.30
                                    : constraint.maxWidth * 0.55,
                                color: colorList[index],
                                artist: artistList[index]);
                          },
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: leftMargin(constraint),
                        child: Text(
                          'Discover',
                          style: AppFonts.fontStyle(
                              size: 23,
                              weight: FontWeight.w800,
                              color: AppColors.grey),
                        ),
                      ),
                      Container(
                        margin: leftMargin(constraint),
                        width: constraint.maxWidth * 0.95,
                        height: constraint.maxHeight < 500
                            ? constraint.maxHeight * 0.4
                            : constraint.maxHeight * 0.23,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: songList.length,
                          itemBuilder: (context, index) {
                            return SongCard(
                              onPressed: () {},
                              song: songList[index],
                              width: constraint.maxWidth > 450
                                  ? constraint.maxWidth * 0.28
                                  : constraint.maxWidth * 0.43,
                              height: constraint.maxHeight * 0.3,
                            );
                          },
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: leftMargin(constraint),
                        child: Text(
                          'New Release',
                          style: AppFonts.fontStyle(
                              size: 23,
                              weight: FontWeight.w800,
                              color: AppColors.grey),
                        ),
                      ),
                      Container(
                        margin: leftMargin(constraint),
                        width: constraint.maxWidth * 0.95,
                        height: constraint.maxHeight < 500
                            ? constraint.maxHeight * 0.4
                            : constraint.maxHeight * 0.23,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: songList.length,
                          itemBuilder: (context, index) {
                            final reversedSongList = songList.reversed.toList();
                            return SongCard(
                              song: reversedSongList[index],
                              width: constraint.maxWidth > 450
                                  ? constraint.maxWidth * 0.28
                                  : constraint.maxWidth * 0.43,
                              height: constraint.maxHeight * 0.3,
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
                SlidingUpPanel(
                  controller: _panelController,
                  color: Colors.white.withOpacity(0.2),
                  boxShadow: panelShadow,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(26.0),
                    topRight: Radius.circular(26.0),
                  ),
                  maxHeight: constraint.maxHeight,
                  minHeight: constraint.maxHeight * 0.27,
                  panel: Stack(
                    children: [
                      Container(
                        color: panelColor,
                        child: Column(children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: constraint.maxWidth > 450
                                  ? constraint.maxWidth * 0.03
                                  : constraint.maxWidth * 0.05,
                              vertical: constraint.maxHeight * 0.02,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                NavIcon(
                                    icon: const Icon(
                                      Icons.arrow_back,
                                      color: AppColors.grey,
                                    ),
                                    onPressed: () {
                                      _panelController.close();
                                    }),
                                Center(
                                  child: Text(
                                    'Now Playing',
                                    style: AppFonts.fontStyle(
                                      color: AppColors.grey,
                                      weight: FontWeight.w800,
                                      size: 25,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 46,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: constraint.maxHeight * 0.05,
                          ),
                          CarouselSlider(
                            items: songList
                                .map(
                                  (song) => Container(
                                    width: constraint.maxWidth * 0.6,
                                    padding: const EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          song.thumbnail!,
                                        ),
                                      ),
                                    ),
                                    child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: _currentIndex ==
                                              songList.indexOf(song)
                                          ? const CircleAvatar(
                                              radius: 30,
                                              backgroundColor: Colors.white,
                                              child: Icon(
                                                Icons.favorite,
                                                color: Colors.red,
                                                size: 30,
                                              ),
                                            )
                                          : null,
                                    ),
                                  ),
                                )
                                .toList(),
                            options: CarouselOptions(
                              height: constraint.maxHeight * 0.35,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _currentIndex = index;
                                });
                              },
                              autoPlay: false,
                              enlargeCenterPage: true,
                              viewportFraction: 0.65,
                              initialPage: 2,
                            ),
                          ),
                          Container(
                              height: constraint.maxHeight * 0.45,
                              padding: EdgeInsets.symmetric(
                                horizontal: constraint.maxWidth > 450
                                    ? constraint.maxWidth * 0.03
                                    : constraint.maxWidth * 0.06,
                                vertical: constraint.maxHeight * 0.04,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        songList[_currentIndex].name!,
                                        style: AppFonts.fontStyle(
                                          color: AppColors.grey,
                                          weight: FontWeight.w800,
                                          size: 23,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        songList[_currentIndex].genre!,
                                        style: AppFonts.fontStyle(
                                          color: AppColors.grey,
                                          weight: FontWeight.w400,
                                          size: 17,
                                        ),
                                      ),
                                    ],
                                  ),
                                  LinearPercentIndicator(
                                    padding: const EdgeInsets.all(0),
                                    lineHeight: 4,
                                    barRadius: const Radius.circular(20),
                                    backgroundColor:
                                        AppColors.lightgrey.withOpacity(0.1),
                                    percent: 0.5,
                                    progressColor: AppColors.purple,
                                    fillColor: Colors.white,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '0:36',
                                        style: AppFonts.fontStyle(
                                          color: AppColors.purple,
                                          weight: FontWeight.w600,
                                          size: 12,
                                        ),
                                      ),
                                      PlayAction(
                                        width: constraint.maxWidth * 0.7,
                                      ),
                                      Text(
                                        '3:36',
                                        style: AppFonts.fontStyle(
                                          color: AppColors.lightgrey,
                                          weight: FontWeight.w600,
                                          size: 12,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )),
                        ]),
                      ),
                      LyricsPanel(
                        sigmaX: _sigmaX,
                        sigmaY: _sigmaY,
                        height: constraint.maxHeight,
                        width: constraint.maxWidth,
                      )
                    ],
                  ),
                  onPanelClosed: () {
                    setState(() {
                      panelColor = Colors.transparent;
                      panelShadow = <BoxShadow>[
                        BoxShadow(
                            blurRadius: 8.0,
                            offset: const Offset(2, -7),
                            color: const Color.fromRGBO(0, 0, 0, 0.25)
                                .withOpacity(0.1)),
                      ];
                    });
                  },
                  onPanelOpened: () {
                    setState(() {
                      panelColor = AppColors.backgroundColor;
                      panelShadow = [];
                    });
                  },
                  collapsed: SongMiniPreview(
                    sigmaX: _sigmaX,
                    sigmaY: _sigmaY,
                    height: constraint.maxHeight,
                    width: constraint.maxWidth,
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}

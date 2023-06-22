import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ujicoba4/database.dart';

class MusicPlayer extends StatefulWidget {
  final Song song;
  MusicPlayer(this.song);

  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

double currentSlider = 0;
//pengaturan tampilan
class _MusicPlayerState extends State<MusicPlayer> {
  bool isFavorite = false; //mengubah icon favorit
  bool isPlaying = false; //mengubah icon play

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /* Hero memberi efek transisi animasi antara dua tampilan yang
        berbeda pada dua halaman yang berbeda*/
        Hero(
          tag: "image",
          child: Container(
            height: MediaQuery.of(context).size.height, //gambar latar belakang akan mengisi seluruh layar
            width: MediaQuery.of(context).size.width, //gambar latar belakang akan mengisi seluruh layar
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.song.image), fit: BoxFit.cover)),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              Padding(
                padding: EdgeInsets.only(right: 8, left: 15),
                child: Icon(Icons.search, size: 30),
              )
            ],
          ),
          body: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 50, left: 20, right: 20),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  blurRadius: 14,
                  spreadRadius: 16,
                  color: Colors.black.withOpacity(0.2),
                )
              ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                  child: Container(
                    height: 280,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                            width: 1.5, color: Colors.white.withOpacity(0.2))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                          EdgeInsets.only(left: 20, right: 20, top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                widget.song.name,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                              FavoriteIcon(),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            widget.song.singer,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 2),
                                trackShape: RectangularSliderTrackShape(),
                                trackHeight: 6),
                            child: Slider(
                              value: currentSlider,
                              max: widget.song.duration.toDouble(),
                              min: 0,
                              inactiveColor: Colors.white70,
                              activeColor: Colors.blueGrey,
                              onChanged: (val) {
                                currentSlider = val;
                                setState(() {});
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                Duration(seconds: currentSlider.toInt())
                                    .toString()
                                    .split('.')[0]
                                    .substring(2),
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                Duration(seconds: widget.song.duration.toInt())
                                    .toString()
                                    .split('.')[0]
                                    .substring(2),
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.skip_previous_outlined,
                                color: Colors.white, size: 40),
                            PauseIcon(),
                            Icon(Icons.skip_next_outlined,
                                color: Colors.white, size: 40)
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.replay_outlined,
                                  color: Colors.white, size: 35),
                              Icon(Icons.shuffle, color: Colors.white, size: 35)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class FavoriteIcon extends StatefulWidget {
  @override
  _FavoriteIconState createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : Colors.white,
        size: 32,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}

class PauseIcon extends StatefulWidget {
  @override
  _PauseIconState createState() => _PauseIconState();
}

class _PauseIconState extends State<PauseIcon> {
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isPlaying ? Icons.pause : Icons.play_arrow,
        color: Colors.white,
        size: 35,
      ),
      onPressed: () {
        setState(() {
          isPlaying = !isPlaying;
        });
      },
    );
  }
}

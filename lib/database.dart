import 'package:flutter/material.dart';

class Song {
  final String name;
  final String singer;
  final String image;
  final int duration;
  final Color color;
  Song(
      {required this.name,
        required this.singer,
        required this.image,
        required this.duration,
        required this.color});
}
//mostPopular digunakan untuk pemanggilan oleh screen lain
List<Song> mostPopular = [
  Song(
      name: "Euphoria",
      image: "assets/song1.jpg",
      singer: "BTS",
      duration: 208,
      color: Colors.black),
  Song(
      name: "Not You",
      image: "assets/song2.jpg",
      singer: "Alan Walker",
      duration: 252,
      color: Colors.black),
  Song(
      name: "numb",
      image: "assets/song3.jpg",
      singer: "Marshmello",
      duration: 532,
      color: Colors.black),
  Song(
      name: "pretty savage",
      image: "assets/song4.jpg",
      singer: "blackpink",
      duration: 264,
      color: Colors.black)
];

List<Song> newRelease = [
  Song(
      name: "Not You",
      image: "assets/song2.jpg",
      singer: "Alan Walker",
      duration: 252,
      color: Colors.black),
  Song(
      name: "Euphoria",
      image: "assets/song1.jpg",
      singer: "BTS",
      duration: 208,
      color: Colors.black),
  Song(
      name: "pretty savage",
      image: "assets/song4.jpg",
      singer: "blakpink",
      duration: 264,
      color: Colors.black),
  Song(
      name: "numb",
      image: "assets/song3.jpg",
      singer: "Marshmello",
      duration: 532,
      color: Colors.black),
];

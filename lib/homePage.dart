import 'package:flutter/material.dart';
import 'package:ujicoba4/database.dart';
import 'package:ujicoba4/likeSong.dart';
import 'package:ujicoba4/musicPlayer.dart';
import 'package:ujicoba4/settings.dart';
import 'package:ujicoba4/login.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
// memperbarui tampilan widget
class _HomePageState extends State<HomePage> {
  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF091227),
      appBar: AppBar(
        backgroundColor: Color(0xFF091227),
        elevation: 0,
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 3),
            icon: Icon(
              Icons.favorite_sharp,
              size: 30,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LikeSongPage(likedSongs: [],)),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(right: 7),
            child: Icon(
              Icons.search,
              size: 35,
            ),
          ),
        ],
      ),

      //membuat sidebar
      drawer: Drawer(
        child: Container(
          color: Color(0xFF091227),
          child: ListView(
            padding: EdgeInsets.zero, //mengatur agar tidak ada jarak
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFF091227),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.close),
                      color: Colors.white,
                      iconSize: 35,
                      onPressed: () {
                        Navigator.of(context).pop(); //kembali ke tampilan sebelumnya
                      },
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 24,
                ),
                title: Row(
                  children: [
                    SizedBox(width: 2),
                    Text(
                      'Home',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 24,
                ),
                title: Row(
                  children: [
                    SizedBox(width: 2),
                    Text(
                      'Liked Song',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LikeSongPage(likedSongs: [],)),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 24,
                ),
                title: Row(
                  children: [
                    SizedBox(width: 2),
                    Text(
                      'Settings',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsPage()),
                  );
                },
              ),

              //membuat button untuk logout di dalam sidebar
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                child: Text(
                  'Log Out',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      body: Stack(
        children: [
          SingleChildScrollView( //agar bisa di scroll
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, //digunakan untuk menyusun padding scr horizontal
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Recommended",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "for you",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  height: 300,
                  child: TrackWidget(notifyParent: refresh),
                ),
                CircleTrackWidget(
                  title: "My Playlist",
                  songs: mostPopular,
                  subtitle: "346 songs",
                  notifyParent: refresh,
                ),
                SizedBox(
                  height: 300,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: PlayerHome(currentSong),
          ),
        ],
      ),
    );
  }
}

//menampilkan music yang akan diputar, dibagian bawah layar
Song currentSong = Song(
  name: "title",
  singer: "singer",
  image: "assets/song0.jpg",
  duration: 100,
  color: Colors.black,
);
double currentSlider = 0;

class PlayerHome extends StatefulWidget {
  final Song song;
  PlayerHome(this.song);

  @override
  _PlayerHomeState createState() => _PlayerHomeState();
}

class _PlayerHomeState extends State<PlayerHome> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, _, __) => MusicPlayer(widget.song),
          ),
        );
      },
      child: Container(
        height: 130,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Color(0xFF03143B),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Hero(
                      tag: "image",
                      child: CircleAvatar(
                        backgroundImage: AssetImage(widget.song.image),
                        radius: 30,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.song.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.song.singer,
                          style: TextStyle(
                            color: Colors.white54,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.skip_previous_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.pause,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.skip_next_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  Duration(seconds: currentSlider.toInt())
                      .toString()
                      .split('.')[0]
                      .substring(2),
                  style: TextStyle(color: Colors.white),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 120,
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 4),
                      trackShape: RectangularSliderTrackShape(),
                      trackHeight: 4,
                    ),
                    child: Slider(
                      value: currentSlider,
                      max: widget.song.duration.toDouble(),
                      min: 0,
                      inactiveColor: Colors.grey[500],
                      activeColor: Colors.white,
                      onChanged: (val) {
                        setState(() {
                          currentSlider = val;
                        });
                      },
                    ),
                  ),
                ),
                Text(
                  Duration(seconds: widget.song.duration)
                      .toString()
                      .split('.')[0]
                      .substring(2),
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TrackWidget extends StatelessWidget {
  final Function() notifyParent;

  TrackWidget({required this.notifyParent});
//code mostPopular merupakan codingan yang dibuat untuk memamnggil database
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: mostPopular.length, //menentukan jumlah item dalam daftar
      shrinkWrap: true, //ListView harus menyesuaikan ukurannya sesuai dengan jumlah item dalam daftar
      scrollDirection: Axis.horizontal, //mengatur arah guliran ListView menjadi horizontal
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector( //menambahkan fungsi onTap ke setiap item dalam daftar
          onTap: () {
            currentSong = mostPopular[index]; //panggil ke database
            currentSlider = 0;
            notifyParent();
          },
          child: Container(
            margin: EdgeInsets.all(10),
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: mostPopular[index].color,
                  blurRadius: 1,
                  spreadRadius: 0.3,
                ),
              ],
              image: DecorationImage(
                image: AssetImage(mostPopular[index].image),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mostPopular[index].name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    mostPopular[index].singer,
                    style: TextStyle(
                      color: Colors.white54,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
/* Digunakan untuk membuat tampilan
lingkaran dengan judul, daftar lagu, dan subjudul */
class CircleTrackWidget extends StatelessWidget {
  final String title;
  final List<Song> songs;
  final String subtitle;
  final Function() notifyParent;

  CircleTrackWidget({
    required this.title,
    required this.songs,
    required this.subtitle,
    required this.notifyParent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, top: 10),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, bottom: 20),
            child: Text(
              subtitle,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          Container(
            height: 120,
            child: ListView.builder(
              itemCount: songs.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    currentSong = songs[index];
                    currentSlider = 0;
                    notifyParent();
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: songs[index].color,
                                blurRadius: 1,
                                spreadRadius: 0.3,
                              ),
                            ],
                            image: DecorationImage(
                              image: AssetImage(songs[index].image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          songs[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

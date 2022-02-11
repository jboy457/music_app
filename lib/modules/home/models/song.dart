import 'package:music_app/constants/images.dart';

class Song {
  final String? name;
  final String? genre;
  final String? thumbnail;

  Song({this.name, this.genre, this.thumbnail});
}

class Songs {
  static List<Song> songList() {
    return [
      Song(
          genre: 'Dance',
          name: 'Out of My Mine',
          thumbnail: AppImages.thumbnail4),
      Song(
          genre: 'Electronic',
          name: 'Freak In Me',
          thumbnail: AppImages.thumbnail3),
      Song(genre: 'Dance', name: 'Lover Boy', thumbnail: AppImages.thumbnail2),
      Song(
          genre: 'Dance',
          name: 'Out of My Mine',
          thumbnail: AppImages.thumbnail6),
      Song(
          genre: 'Electronic',
          name: 'Freak In Me',
          thumbnail: AppImages.thumbnail5),
      Song(genre: 'Dance', name: 'Lover Boy', thumbnail: AppImages.thumbnail1),
    ];
  }
}

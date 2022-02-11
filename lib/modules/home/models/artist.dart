import 'package:music_app/constants/images.dart';

class Artist {
  final int? id;
  final String? name;
  final String? song;
  final String? imageUrl;

  Artist({this.id, this.name, this.song, this.imageUrl});
}

class Artists {
  static List<Artist> artistsList() {
    return [
      Artist(
        id: 1,
        name: 'Ayesha Ruhin',
        song: 'Some Feeling',
        imageUrl: AppImages.avatar1,
      ),
      Artist(
        id: 2,
        name: 'Jane Cooper',
        song: 'I Didn\'t Know',
        imageUrl: AppImages.avatar2,
      ),
      Artist(
        id: 3,
        name: 'Ayesha Ruhin',
        song: 'Some Feeling',
        imageUrl: AppImages.avatar1,
      ),
    ];
  }
}
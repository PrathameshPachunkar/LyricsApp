class lyricsmodel{
  late String trackname ;
  late int trackid;
  late String artist;
  lyricsmodel({required this.trackname, required this.trackid, required this.artist});
}
class trackmodel{
  late int rating;
  late String trackname ;
  late int trackid;
  late String artist;
  late String albumname;

  trackmodel(
      {required this.rating, required this.trackname, required this.trackid, required this.artist, required this.albumname});
}

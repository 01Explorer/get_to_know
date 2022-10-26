class Track {
  final List<String>? artists;
  final double? duration;
  final String? name;
  final String? spotifyUrl;

  Track({this.spotifyUrl, this.artists, this.duration, this.name});

  factory Track.fromJson(Map<String, dynamic> response, List<String> artists) {
    return Track(
      artists: artists,
      duration: response['duration_ms'] / 60000,
      name: response['name'],
      spotifyUrl: response['external_urls']['spotify'],
    );
  }
}

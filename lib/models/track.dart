class Track {
  final List<String>? artists;
  final double? duration;
  final String? name;

  Track({this.artists, this.duration, this.name});

  factory Track.fromJson(Map<String, dynamic> response) {
    return Track(
      artists: [(response['artists']['name'])],
      duration: response['duration_ms'] / 60000,
      name: response['name'],
    );
  }
}

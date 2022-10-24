class Album {
  final String? imagePath;
  final String? name;
  final String? releaseDate;
  final int? totalTracks;
  final String? albumId;

  Album({
    this.albumId,
    this.imagePath,
    this.name,
    this.releaseDate,
    this.totalTracks,
  });

  factory Album.fromJson(Map<String, dynamic> response) {
    return Album(
      albumId: response['id'],
      name: response['name'],
      releaseDate: response['release_date'],
      totalTracks: response['total_tracks'],
      imagePath: response['images'][0]['url'],
    );
  }
}

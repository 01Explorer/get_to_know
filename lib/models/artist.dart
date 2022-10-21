class Artist {
  final String? name;
  final String? spotifyId;
  final int? followers;
  final List<dynamic>? genres;
  final String? imagePath;
  final int? popularity;

  Artist(
    this.name,
    this.spotifyId, {
    this.followers,
    this.genres,
    this.imagePath,
    this.popularity,
  });
}

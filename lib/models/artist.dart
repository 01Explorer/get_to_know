class Artist {
  final String? name;
  final String? spotifyId;
  final int? followers;
  final List<dynamic>? genres;
  final String? imagePath;
  final int? popularity;

  Artist({
    this.name,
    this.spotifyId,
    this.followers,
    this.genres,
    this.imagePath,
    this.popularity,
  });

  factory Artist.fromJson(Map<String, dynamic> response) {
    return Artist(
      name: response['artists']['items'][0]['name'],
      spotifyId: response['artists']['items'][0]['id'],
      followers: response['artists']['items'][0]['followers']['total'],
      genres: response['artists']['items'][0]['genres'],
      imagePath: response['artists']['items'][0]['images'][0]['url'],
      popularity: response['artists']['items'][0]['popularity'],
    );
  }
}

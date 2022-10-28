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

  factory Artist.fromLocalJson(Map<String, dynamic> response) {
    try {
      response['images'][0]['url'];
    } catch (e) {
      return Artist(
        name: response['name'],
        spotifyId: response['id'],
        followers: response['followers']['total'],
        genres: response['genres'],
        popularity: response['popularity'],
      );
    }
    return Artist(
      name: response['name'],
      spotifyId: response['id'],
      followers: response['followers']['total'],
      genres: response['genres'],
      imagePath: response['images'][0]['url'],
      popularity: response['popularity'],
    );
  }
}

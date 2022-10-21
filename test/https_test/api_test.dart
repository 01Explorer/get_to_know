import 'package:flutter_test/flutter_test.dart';
import 'package:get_to_know/http/webclient.dart';
import 'package:get_to_know/http/webclients/search_webclient.dart';

void main() {
  test('Api Get Access call', () async => expect(getAccess(), isNotNull));

  test(
    'Token Should be received when created SearchWebClient',
    () async {
      final SearchWebClient search = await SearchWebClient.createAsync();
      expect(search.accessToken, isNotNull);
    },
  );

  test(
    'Search for artist should return the ID',
    () async {
      final SearchWebClient search = await SearchWebClient.createAsync();
      expect(await search.lookForArtistInfo('Arctic Monkeys'), isNotNull);
    },
  );

  test(
    'Search for albums should return a list',
    () async {
      final SearchWebClient search = await SearchWebClient.createAsync();
      await search.lookForAlbums('7Ln80lUS6He07XvHI8qqHH');
      expect(search.albums, isNotNull);
    },
  );
}

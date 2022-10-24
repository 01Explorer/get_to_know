import 'dart:convert';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:http/http.dart';

final InterceptedClient client = InterceptedClient.build(
    interceptors: [], requestTimeout: const Duration(seconds: 15));

var initialURL = Uri.https('accounts.spotify.com', '/api/token');
var searchUrl = Uri.https('api.spotify.com', '/v1/search');
var artistUrl = Uri.https('api.spotify.com', '/v1/artists');
var albumsUrl = Uri.https('api.spotify.com', '/v1/albums');

const String _clientID = '321e004aaa6a49bf9fc9677060b24fc4';
const String _clientSecret = 'e1b7c00bc2f14f50814f6b4184242530';

Future<String> getAccess() async {
  final Response response = await client.post(
    initialURL,
    headers: {'Content-Type': 'application/x-www-form-urlencoded'},
    body:
        'grant_type=client_credentials&client_id=$_clientID&client_secret=$_clientSecret',
  );
  return jsonDecode(response.body)['access_token'];
}

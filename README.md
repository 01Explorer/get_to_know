# Get To Know 🎵🎶

Get to know is a project which was based in the third Sprint Challenge from the Compass.Uol Flutter journey. In this specific sprint our goal was to develop a solution/application using an API to consume and see Data. Hence, Get to know was developed aiming to allow users to search and see their favorite artists, musics and albums based on Spotify Open API. 

## Project Specification

### API
To handle te ability to search for artists, music and albums, the project uses the [Spotify Open API](https://developer.spotify.com/documentation/web-api/) to make searchs and return information based on what the user wants to see. To ensure that the connection between the app and the api is working properly, I used http_interceptor to keep checking on the calls and to make all the needed calls for all features the [dart http library](https://pub.dev/packages/http).
 
### Structure
Since the project's focus was the API, I structured the project using the [MVC pattern](https://www.freecodecamp.org/news/the-model-view-controller-pattern-mvc-architecture-and-frameworks-explained/) which, while offers a great organization method, is easy to implement and maintain.

### Dependency Injection
  Following one of SOLID principles, in the project I use the [GetIt](https://pub.dev/packages/get_it) library to make all the needed dependency injection in an easier way.

## Project Demo

<img src="get_to_know_gif.gif" height="480">

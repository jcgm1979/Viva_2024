import 'dart:developer';

abstract class PlaylistRepository {
  Future<List<Map<String, String>>> fetchInitialPlaylist(PlaylistType type,
      {int length = 3});
  Future<Map<String, String>> fetchAnotherSong(
    PlaylistType type,
  );
}

enum PlaylistType { serverOne, serverTwo }

class DemoPlaylist extends PlaylistRepository {
  @override
  Future<List<Map<String, String>>> fetchInitialPlaylist(PlaylistType type,
      {int length = 3}) async {
    return List.generate(length, (index) {
      switch (type) {
        case PlaylistType.serverOne:
          return _serverviva();
        case PlaylistType.serverTwo:
          return _servervivaTwo();
      }
    });
  }

  @override
  Future<Map<String, String>> fetchAnotherSong(
    PlaylistType type,
  ) async {
    switch (type) {
      case PlaylistType.serverOne:
        log('serverOne');
        return _serverviva();
      case PlaylistType.serverTwo:
        log('serverTwo');
        return _servervivaTwo();
    }
  }

  Map<String, String> _serverviva() {
    return {
      'url': 'https://tupanel.info:8780/' //Nuevo URL viva//
    };
  }

  //Server nuevo
  Map<String, String> _servervivaTwo() {
    return {
      'url': 'https://tupanel.info:9950/' //Nuevo URL viva//
    };
  }
}

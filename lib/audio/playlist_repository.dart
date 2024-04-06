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
    return _serverviva();
  }

  @override
  Future<Map<String, String>> fetchAnotherSong(
    PlaylistType type,
  ) async {
    return _servervivaTwo();
  }

  //Server nuevo
  Map<String, String> _servervivaTwo() {
    return {
      'url': 'https://tupanel.info:9950/' //Nuevo URL viva//
    };
  }
}

List<Map<String, String>> _serverviva() {
  return [
    {
      'id': '1',
      'title': 'Principal',
      'url': 'https://tupanel.info:8780/',
    },
    {
      'id': '2',
      'title': 'Somos Libres',
      'url': 'https://tupanel.info:9950/' //Nuevo URL viva//
    }
  ];
}

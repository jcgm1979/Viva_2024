abstract class PlaylistRepository {
  Future<List<Map<String, String>>> fetchInitialPlaylist();
  Future<Map<String, String>> fetchAnotherSong();
}

class DemoPlaylist extends PlaylistRepository {
  @override
  Future<List<Map<String, String>>> fetchInitialPlaylist(
      {int length = 3}) async {
    return List.generate(length, (index) => _serverviva());
  }

  @override
  Future<Map<String, String>> fetchAnotherSong() async {
    return _serverviva();
  }

  Map<String, String> _serverviva() {
    return {
      'url': 'https://tupanel.info:8780/' //Nuevo URL viva//
    };
  }
}

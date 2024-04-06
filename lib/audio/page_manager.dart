
import 'package:audio_service/audio_service.dart';
//TODO: FILE ACTUALIZADO.
import 'play_button_notifier.dart';
import 'playlist_repository.dart';
import 'service_locator.dart';

class PageManager {
  final playButtonNotifier = PlayButtonNotifier();
  final playButtonPageNotifier = PlayButtonPageNotifier();
  final _audioHandler = getIt<AudioHandler>();

  // Events: Calls coming from the UI
  void init() async {
    await _loadPlaylist();

    _listenToPlaybackState();
  }

  Future<void> _loadPlaylist() async {
    final songRepository = getIt<PlaylistRepository>();
    final playlist = await songRepository.fetchInitialPlaylist();
    final mediaItems = playlist
        .map((song) => MediaItem(
              id: song['id'] ?? '',
              title: song['title'] ?? '',
              extras: {'url': song['url']},
            ))
        .toList();
    _audioHandler.addQueueItems(mediaItems);
  }

  void _listenToPlaybackState() {
    _audioHandler.playbackState.listen((playbackState) {
      final isPlaying = playbackState.playing;
      final processingState = playbackState.processingState;
      if (processingState == AudioProcessingState.loading ||
          processingState == AudioProcessingState.buffering) {
        playButtonNotifier.value = ButtonState.loading;
      } else if (!isPlaying) {
        playButtonNotifier.value = ButtonState.paused;
      } else if (processingState != AudioProcessingState.completed) {
        playButtonNotifier.value = ButtonState.playing;
      } else if (processingState == AudioProcessingState.ready) {
        _audioHandler.seek(Duration.zero);
        _audioHandler.play();
      }
    });
  }

  void play() => _audioHandler.play();
  void pause() => _audioHandler.pause();
  void playFromUrl(int id) {
    final mediaItem = _audioHandler.queue.value.firstWhere(
      (element) => element.id == id.toString(),
    );
    _audioHandler.playFromUri(
      Uri.parse(mediaItem.extras!['url'] as String),
      mediaItem.extras,
    );
  }

  void remove() {
    final lastIndex = _audioHandler.queue.value.length - 1;
    if (lastIndex < 0) return;
    _audioHandler.removeQueueItemAt(lastIndex);
  }

  void dispose() {
    _audioHandler.customAction('dispose');
  }

  void stop() {
    _audioHandler.stop();
  }
}

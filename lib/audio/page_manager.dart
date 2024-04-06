import 'package:audio_service/audio_service.dart';

import 'play_button_notifier.dart';
import 'playlist_repository.dart';
import 'service_locator.dart';

class PageManager {
  final playButtonNotifier = PlayButtonNotifier();
  final _audioHandler = getIt<AudioHandler>();

  // Events: Calls coming from the UI
  void init(PlaylistType type) async {
    await _loadPlaylist(type);

    _listenToPlaybackState();
  }

  Future<void> _loadPlaylist(PlaylistType type) async {
    final songRepository = getIt<PlaylistRepository>();
    final playlist = await songRepository.fetchInitialPlaylist(
      type,
    );
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
  void playFromUrl(String url) => _audioHandler.playFromUri(Uri.parse(url));

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

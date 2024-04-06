import 'package:flutter/material.dart';

import 'page_manager.dart';
import 'play_button_notifier.dart';
import 'service_locator.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({this.url, Key? key}) : super(key: key);
  final String? url;
  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return ValueListenableBuilder<ButtonState>(
      valueListenable: pageManager.playButtonNotifier,
      builder: (_, value, __) {
        switch (value) {
          case ButtonState.loading:
            return Container(
              margin: const EdgeInsets.all(8.0),
              width: 32.0,
              height: 32.0,
              child: const CircularProgressIndicator(
                color: Colors.orange,
              ),
            );
          case ButtonState.paused:
            return IconButton(
                //color: Colors.white,
                color: Colors.black,
                icon: Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                          color: Colors.black,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(Icons.play_arrow_rounded)),
                iconSize: 30.0,
                onPressed: () {
                  if (url != null) {
                    pageManager.playFromUrl(url!);
                  } else {
                    pageManager.play();
                  }
                });
          case ButtonState.playing:
            return SizedBox(
              child: IconButton(
                //color: Colors.white,
                color: Colors.black,
                icon: Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                          color: Colors.black,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(Icons.stop_rounded)),
                iconSize: 30.0,
                onPressed: pageManager.stop,
              ),
            );
        }
      },
    );
  }
}

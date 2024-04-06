import 'package:flutter/material.dart';

import 'page_manager.dart';
import 'play_button_notifier.dart';
import 'service_locator.dart';
//TODO: FILE ACTUALIZADO.
class PlayButton extends StatelessWidget {
  const PlayButton(this.page, {this.id, Key? key}) : super(key: key);
  final ButtonPage page;
  final int? id;
  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();

    return ValueListenableBuilder<ButtonState>(
      valueListenable: pageManager.playButtonNotifier,
      builder: (_, value, __) {
        if (pageManager.playButtonPageNotifier.value != page) {
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
                if (id != null) {
                  pageManager.playButtonPageNotifier.value = page;
                  pageManager.playFromUrl(id!);
                } else {
                  pageManager.play();
                }
              });
        }
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
                  if (id != null) {
                    pageManager.playFromUrl(id!);
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

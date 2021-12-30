import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro/store/pomodoro_store.dart';
import 'package:provider/provider.dart';

class Timer extends StatelessWidget {
  const Timer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    return Observer(builder: (_) {
      return Container(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                store.isBreak() ? 'Hora do descanso' : 'Hora do trabalho',
                style: GoogleFonts.alata(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '${store.minutes.toString().padLeft(2, '0')}:${store.seconds.toString().padLeft(2, '0')}',
                style: GoogleFonts.alata(
                  fontSize: 100,
                  color: Colors.white,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (store.isRunning)
                    IconButton(
                      onPressed: store.stop,
                      icon: const Icon(
                        Icons.pause_circle_outlined,
                        size: 30,
                      ),
                      color: Colors.white,
                    ),
                  if (!store.isRunning)
                    IconButton(
                      onPressed: store.start,
                      icon: const Icon(
                        Icons.play_circle_outline_rounded,
                        size: 30,
                      ),
                      color: Colors.white,
                    ),
                  const SizedBox(width: 20),
                  IconButton(
                    onPressed: store.reset,
                    icon: const Icon(
                      Icons.restart_alt,
                      size: 30,
                    ),
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ));
    });
  }
}

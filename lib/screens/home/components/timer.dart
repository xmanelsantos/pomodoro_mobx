import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Timer extends StatelessWidget {
  const Timer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.green[400],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hora do trabalho',
              style: GoogleFonts.alata(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '00:00',
              style: GoogleFonts.alata(
                fontSize: 100,
                color: Colors.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.play_circle_outline_rounded,
                    size: 30,
                  ),
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.stop_circle_outlined,
                    size: 30,
                  ),
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () {},
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
  }
}

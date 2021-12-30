import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro/constants.dart';
import 'package:pomodoro/store/pomodoro_store.dart';
import 'package:provider/provider.dart';

class InputTimer extends StatelessWidget {
  final String title;
  final int time;
  final Function() onPressedRemove;
  final Function() onPressedAdd;

  const InputTimer({
    Key? key,
    required this.title,
    required this.time,
    required this.onPressedRemove,
    required this.onPressedAdd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final store = Provider.of<PomodoroStore>(context);
    return Observer(builder: (context) {
      return Container(
        height: size.height * 0.2,
        padding: const EdgeInsets.all(kDefaultPadding / 2),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: store.workType == WorkType.BREAK
              ? Colors.green[400]
              : Colors.red[400],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(kDefaultPadding / 2),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Colors.white,
              ),
              child: Text(title,
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  )),
            ),
            Row(
              children: [
                IconButton(
                    color: Colors.white,
                    onPressed: onPressedRemove,
                    icon: const Icon(Icons.remove_circle_outline)),
                SizedBox(
                  width: 20,
                  child: Center(
                    child: Text(
                      time.toString(),
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                IconButton(
                    color: Colors.white,
                    onPressed: onPressedAdd,
                    icon: const Icon(Icons.add_circle_outline)),
              ],
            ),
            Text(
              'min',
              style: GoogleFonts.montserrat(
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
    });
  }
}

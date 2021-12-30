import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro/constants.dart';
import 'package:pomodoro/screens/home/components/input_timer.dart';
import 'package:pomodoro/screens/home/components/timer.dart';
import 'package:pomodoro/store/pomodoro_store.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    return Observer(builder: (_) {
      return Scaffold(
        backgroundColor: store.workType == WorkType.BREAK
            ? Colors.green[400]
            : Colors.red[400],
        appBar: _appBar(),
        body: _body(context),
      );
    });
  }

  Column _body(context) {
    final store = Provider.of<PomodoroStore>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Expanded(flex: 3, child: Timer()),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(kDefaultPadding * 3),
            decoration: const BoxDecoration(
              color: kBgLightColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 10),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InputTimer(
                  title: 'Trabalho',
                  time: store.workTime,
                  onPressedAdd: store.addWorkTime,
                  onPressedRemove: store.removeWorkTime,
                ),
                InputTimer(
                  title: 'Descanso',
                  time: store.breakTime,
                  onPressedAdd: store.addBreakTime,
                  onPressedRemove: store.removeBreakTime,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text(
        'Pomodoro',
        style: GoogleFonts.ebGaramond(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.w700,
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    );
  }
}

import 'dart:async';

import 'package:mobx/mobx.dart';

part 'pomodoro_store.g.dart';

class PomodoroStore = _PomodoroStoreBase with _$PomodoroStore;

enum WorkType { WORK, BREAK }

abstract class _PomodoroStoreBase with Store {
  @observable
  WorkType workType = WorkType.BREAK;

  Timer? _timer;

  @observable
  bool isRunning = false;

  @observable
  int workTime = 2;

  @observable
  int breakTime = 1;

  @observable
  int minutes = 2;

  @observable
  int seconds = 0;

  @action
  void addWorkTime() {
    workTime++;
  }

  @action
  void removeWorkTime() {
    workTime--;
  }

  @action
  void addBreakTime() {
    breakTime++;
  }

  @action
  void removeBreakTime() {
    breakTime--;
  }

  @action
  void start() {
    isRunning = true;
    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (minutes == 0 && seconds == 0) {
        _changeWorkType();
      } else if (seconds == 0) {
        seconds = 59;
        minutes--;
      } else {
        seconds--;
      }
    });
  }

  @action
  void stop() {
    isRunning = false;
    _timer?.cancel();
  }

  @action
  void reset() {
    isRunning = false;
  }

  @action
  bool isWork() {
    return workType == WorkType.WORK;
  }

  @action
  bool isBreak() {
    return workType == WorkType.BREAK;
  }

  void _changeWorkType() {
    if (workType == WorkType.WORK) {
      workType = WorkType.BREAK;
      minutes = breakTime;
    } else {
      workType = WorkType.WORK;
      minutes = workTime;
    }
    seconds = 0;
  }
}

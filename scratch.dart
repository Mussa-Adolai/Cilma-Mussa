// ignore_for_file: prefer_const_constructors, avoid_print

import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String? task3result = await task2();
  task3(task3result);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future task2() async {
  Duration threeSeconds = Duration(seconds: 3);
  //sleep(threeSeconds); //synchronous
  String? result;
  await Future.delayed(threeSeconds, () {
    //Asynchronous
    result = 'task 2 data ';
    print('Task 2 complete');
  });
  return result!;
}

task3(task2Data) {
  String result = 'task 3 data';
  print('Task 3 complete with $task2Data');
}

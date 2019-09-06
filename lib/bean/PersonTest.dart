import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:bizhan_study/bean/Person.dart';

Future<String> one() => new Future.value("from one");

Future<String> two() => new Future.error("error from two");

Future<String> three() => new Future.value("from three");

Future<String> four() => new Future.value("from four");

void main() {
  one() // Future completes with "from one".
      .then((_) => two()) // Future completes with two()'s error.
      .then((_) => three()) // Future completes with two()'s error.
      .then((_) => four()) // Future completes with two()'s error.
      .then((value) =>
          processValue(value)) // Future completes with two()'s error.
      .catchError((e) {
    print("Got error: ${e.error}"); // Finally, callback fires.
    return 42; // Future completes with 42.
  }).then((value) {
    print("The value is $value");
  });
}

processValue(String value) {
  int a = int.parse(value) + int.parse("w1&*~!");
  return a;
}

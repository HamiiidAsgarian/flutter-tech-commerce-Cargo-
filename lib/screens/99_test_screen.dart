// import 'dart:async';

main() async {
  // print(fun1());

  // print(fun2());
  await Duration(seconds: 5);

  await fun2();
}

fun1() {
  // Duration a = new Duration(seconds: 5);
  // print("1");
  return ("1");
}

Future fun2() async {
  await Duration(seconds: 5);
  // print("2");
  print("22");
  return ("2");
}

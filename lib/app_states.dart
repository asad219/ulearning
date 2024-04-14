class AppStates {
  int counter;
  String name;
  AppStates({required this.counter, required this.name});
}

class InitStates extends AppStates {
  InitStates() : super(counter: 0, name: '');
}

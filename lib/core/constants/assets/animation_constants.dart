class AnimationConstants {
  static AnimationConstants? _instace;
  static AnimationConstants get instance {
    _instace ??= _instace = AnimationConstants._init();
    return _instace!;
  }

  String get splashAnimation => getJson('nasa_splash');

  String getJson(String value) => 'assets/animations/$value.json';

  AnimationConstants._init();
}

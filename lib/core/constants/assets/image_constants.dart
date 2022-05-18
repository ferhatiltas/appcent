class ImageConstants {
  static ImageConstants? _instance;
  static ImageConstants get instance {
    _instance ??= _instance = ImageConstants._init();
    return _instance!;
  }
  ImageConstants._init();
  String toJpg(value) => 'assets/images/$value.jpg';
}

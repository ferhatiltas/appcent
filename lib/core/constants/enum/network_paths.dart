enum NetworkPaths { CURIOSITY, OPPORTUNITY, SPIRIT, ROVERS }

extension NetworkPathExtension on NetworkPaths {
  String get rawValue {
    switch (this) {
      case NetworkPaths.CURIOSITY:
        return '/curiosity/photos';
      case NetworkPaths.OPPORTUNITY:
        return '/opportunity/photos';
      case NetworkPaths.SPIRIT:
        return '/spirit/photos';
      case NetworkPaths.ROVERS:
        return '/mars-photos/api/v1/rovers';
    }
  }
}
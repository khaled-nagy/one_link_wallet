
enum SnackbarType { success, warning, error, notification }

enum AppNavigationType { product, category, url, none }

extension NavigationTypeFromString on String {
  AppNavigationType toNavigationType() => AppNavigationType.values.firstWhere(
        (element) => element.name == this,
        orElse: () => AppNavigationType.none,
      );
}













enum ImageInfoType { aspectRatio, height, width }

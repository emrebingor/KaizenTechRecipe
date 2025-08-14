enum TabType { ingredients, instructions }

extension TabTypeExtension on TabType {
  String get getName {
    switch (this) {
      case TabType.ingredients:
        return 'İçerikler';
      case TabType.instructions:
        return 'Talimatlar';
    }
  }
}
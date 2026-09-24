enum LanguageType {
  en;

  static LanguageType valueOf(String? value) {
    return LanguageType.values.firstWhere(
      (e) => e.name == value,
      orElse: () => LanguageType.en,
    );
  }

  String get title {
    switch (this) {
      case LanguageType.en:
        return 'English';
    }
  }
}

enum AppFont {
  dmSans('DMSans');

  const AppFont(this.family);

  final String family;
}

enum AppImage {
  backArrow('assets/drawables/ic_arrow.svg'),
  arrowRight('assets/drawables/ic_arrow_right.svg'),
  hidePassword('assets/drawables/ic_hide_pwd.svg'),
  showPassword('assets/drawables/ic_show_pwd.svg'),
  noConnection('assets/drawables/img_no_connection.svg');

  const AppImage(this.path);

  final String path;
}

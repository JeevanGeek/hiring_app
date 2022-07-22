class Services {
  static String getAvatar(String? name) {
    return 'https://ui-avatars.com/api/?name=$name&background=random&color=random&bold=true&size=512';
  }

  static String get getId => DateTime.now().microsecondsSinceEpoch.toString();
}

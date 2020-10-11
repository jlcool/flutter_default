class StringUtil {
  static bool isNullOrEmpty(String content) =>
      content == null || content.isEmpty || content == "";
  static ellipsis(String content, {int size = 50}) {
    if (content != null && content.isNotEmpty && content.length > size) {
      return content.substring(0, size) + "...";
    }
    return content??'';
  }

  static double toDouble(String number, {double def = 0}) {
    try {
      if (!isNullOrEmpty(number)) {
        return double.parse(number);
      }
    } catch (err) {}
    return def;
  }
    static int toInt(String number, {int def = 0}) {
    try {
      if (!isNullOrEmpty(number)) {
        return int.parse(number);
      }
    } catch (err) {}
    return def;
  }
}

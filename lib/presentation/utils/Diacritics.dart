class DiacrititcsHelper {
  static String remove(String str) {
    String diacritics =
        'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
    String replaceDiacritics =
        'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz';

    for (int i = 0; i < diacritics.length; i++) {
      str = str.replaceAll(diacritics[i], replaceDiacritics[i]);
    }

    return str;
  }
}

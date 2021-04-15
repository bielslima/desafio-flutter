class IdFromUrlHelper {
  static execute(String url) {
    return url.replaceAll(new RegExp('([A-Za-z\/.:])'), '');
  }
}

import 'dart:io';

class NetworkStatus {
  static Future<bool> execute() async {
    bool isConnected;

    try {
      final List<InternetAddress> result =
          await InternetAddress.lookup('swapi.dev');

      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isConnected = true;
      } else {
        isConnected = false;
      }
    } catch (e) {
      isConnected = false;
    }

    return isConnected;
  }
}

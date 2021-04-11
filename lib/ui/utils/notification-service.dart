import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

class NotificationService {
  static void _showNotification(String message,
      {bool error = false,
      Color? backgroundColor,
      Duration? duration,
      bool autoDismiss = true}) {
    showSimpleNotification(
      Text(message),
      background: error ? Colors.red : backgroundColor,
      leading: error ? Icon(Icons.info_outline) : null,
      duration: duration ?? Duration(seconds: 3),
      autoDismiss: autoDismiss,
    );
  }

  static void showToastError(String message, {Duration? duration}) {
    _showNotification(message,
        error: true, duration: duration ?? Duration(seconds: 3));
  }

  static void showToastAlert(String message, {Duration? duration}) {
    _showNotification(message,
        error: false,
        duration: duration ?? Duration(seconds: 3),
        backgroundColor: Colors.amber[600]);
  }

  static void showToastSuccess(String message, {Duration? duration}) {
    _showNotification(message,
        error: false,
        duration: duration ?? Duration(seconds: 3),
        backgroundColor: Colors.teal);
  }
}

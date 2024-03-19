import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_template/provider/navigator/navigator_key_provider.dart';

part 'toast.g.dart';

enum ToastType { success, error, neutral }

@riverpod
Toast toast(ToastRef ref) => Toast(ref);

class Toast {
  Toast(this.ref);
  final Ref ref;

  void showToastMessage({required String message, ToastType? type}) {
    final navigatorKey = ref.watch(navigatorKeyProvider);
    final toast = FToast();
    toast.init(navigatorKey.currentContext!);

    Color color;

    switch (type) {
      case ToastType.success:
        color = Colors.green;
        break;
      case ToastType.error:
        color = Colors.red;
        break;
      case ToastType.neutral:
        color = Colors.blue;
        break;
      default:
        color = Colors.blue;
    }

    toast.removeQueuedCustomToasts();

    toast.showToast(
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: color,
          ),
          child: Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
      toastDuration: const Duration(seconds: 3),
      fadeDuration: const Duration(milliseconds: 160),
      positionedToastBuilder: (context, child) {
        return Positioned(
          top: 16,
          right: 16,
          left: 16,
          child: child,
        );
      },
    );
  }
}

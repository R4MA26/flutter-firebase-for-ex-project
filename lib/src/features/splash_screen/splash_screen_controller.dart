import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_firebase/src/utils/deley.dart';

class SplashController extends StateNotifier<void> {
  SplashController() : super(null);

  Future<void> startTime() async {
    await delay(milliseconds: 2500);
  }
}

final splashControllerProvider =
    StateNotifierProvider.autoDispose<SplashController, void>((ref) {
  return SplashController();
});

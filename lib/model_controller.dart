import 'dart:ui';

import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:webview_flutter/webview_flutter.dart';
class ModelController extends GetxController {
  stt.SpeechToText? _speech;
  var isListening = false.obs;
  var recognizedText = ''.obs;

  var controller = WebViewController();
  var loadingPercentage = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // checkPermissions();
    initialiseWebView();
  }

  initialiseWebView() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(NavigationDelegate())
      ..loadRequest(
          Uri.parse('https://app.vectary.com/p/5su50TqFnqB75ZHwCQPb5n'));
  }
}

//   Future<void> initializeSpeechToText() async {
//     if (_speech == null) {
//       _speech = stt.SpeechToText();
//       await _speech!.initialize();
//     }
//   }
//
//   void startListening() async {
//     await initializeSpeechToText(); // Ensure speech recognition is initialized
//     if (_speech!.isAvailable && !_speech!.isListening) {
//       isListening.value = true;
//       _speech!.listen(
//         onResult: (result) => recognizedText.value = result.recognizedWords,
//       );
//     }
//   }
//
//   void stopListening() {
//     if (_speech != null && _speech!.isListening) {
//       _speech!.stop();
//       isListening.value = false;
//
//     }
//   }
// }
// checkPermissions() async {
//   Map<Permission, PermissionStatus> statuses = await [
//     Permission.microphone,
//   ].request();
//   if (statuses.values.every((status) => status.isGranted)) {
//     return;
//   } else {
//     checkPermissions();
//   }
//
//
// }
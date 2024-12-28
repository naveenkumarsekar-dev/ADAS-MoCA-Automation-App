import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'core/app_export.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase
  await Firebase.initializeApp();
  
  // Initialize App Check
  await FirebaseAppCheck.instance.activate(
    // webProvider: ReCaptchaV3Provider('your-recaptcha-v3-site-key'), // Replace with your actual reCAPTCHA site key
    // androidProvider: PlayIntegrityProvider(), // For Android
    // iosProvider: DeviceCheckProvider(), // Uncomment and use if targeting iOS
  );

  // // Ensure App Check is working by getting the token
  // String? token;
  // try {
  //   token = await FirebaseAppCheck.instance.getToken(true);
  //   print("App Check token: $token");
  // } catch (e) {
  //   print("Error getting App Check token: $e");
  // }

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  /// Please update theme as per your need if required.
  ThemeHelper().changeTheme('primary');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: theme,
          title: 'adas_app_develop2',
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.homePageScreen,
          routes: AppRoutes.routes,
        );
      },
    );
  }
}

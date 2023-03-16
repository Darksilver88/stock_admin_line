import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAo8qixnlQZ2R4FSC5IS1bNHMt-q-R23wA",
            authDomain: "v-product-dev.firebaseapp.com",
            projectId: "v-product-dev",
            storageBucket: "v-product-dev.appspot.com",
            messagingSenderId: "465562133299",
            appId: "1:465562133299:web:addd5c6ff812bba6261446",
            measurementId: "G-2HW7XYD6E6"));
  } else {
    await Firebase.initializeApp();
  }
}

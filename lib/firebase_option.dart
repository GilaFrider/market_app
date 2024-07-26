import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions{
  static FirebaseOptions get currentPlatform{
    return android;
  }
  static  const  FirebaseOptions android = FirebaseOptions(
      apiKey: "AIzaSyDOr3kK3lpGKneNNFfkK-dZwvnm2sxzsDo",
      appId: "1:565380248891:android:dbf48937edd68cce9db31e",
      messagingSenderId: "565380248891",
      projectId: "coffee-d19f4",
      storageBucket: "coffee-d19f4.appspot.com",
    );
}
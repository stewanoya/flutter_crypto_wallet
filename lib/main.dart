import 'package:crypto_wallet_firebase/ui/authentication.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  // needed if we want to wait for Firebase initializeApp... not sure why though.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Crypto Wallet',
      home: Authentication(),
    );
  }
}

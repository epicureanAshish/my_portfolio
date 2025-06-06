
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

import 'firebase_options.dart';

final getIt = GetIt.instance;


Future<void> init() async {

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  getIt.registerFactory(()=>FirebaseFirestore.instance);

}
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_atw/presentation/viewmodels/login_viewmodel.dart';
import 'package:task_atw/presentation/views/login/login_view.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginCubit(),
      child: const MaterialApp(        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}
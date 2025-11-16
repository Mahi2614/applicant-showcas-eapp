import 'package:assetwize/core/themes/app_theme.dart';
import 'package:assetwize/presentation/cubit/favourite_cubit.dart';
import 'package:assetwize/presentation/main_wrapper.dart';
import 'package:assetwize/data/repository/favorite_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyA4DQWqB0v5vcEvssPQcgz5dSnWSxgSEW8",
      appId: "1:891771576875:android:22b91585eaeba52649c06e",
      messagingSenderId: "891771576875",
      projectId: "fir-demo-5e3d9",
    ),
  );
  runApp(const AssetWizeApp());
}

class AssetWizeApp extends StatelessWidget {
  const AssetWizeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = FavoriteCubit(FavoritesRepository());
        cubit.loadFavorites();
        return cubit;
      },
      child: MaterialApp(
        title: 'AssetWize',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: MainWrapper(),
      ),
    );
  }
}

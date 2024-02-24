import 'package:discover/auth/auth_view_model.dart';
import 'package:discover/models/cart_model.dart';
import 'package:discover/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => CartModel()),
      ],
      child: const MaterialApp(
        home: Home(),
      ),
    ),
  );
}

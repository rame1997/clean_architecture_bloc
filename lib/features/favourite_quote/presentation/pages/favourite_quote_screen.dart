import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FavouriteQuoteSccreen extends StatefulWidget {
  const FavouriteQuoteSccreen({super.key});

  @override
  State<FavouriteQuoteSccreen> createState() => _FavouriteQuoteSccreenState();
}

class _FavouriteQuoteSccreenState extends State<FavouriteQuoteSccreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text('FavouriteQuote')),
    );
  }
}

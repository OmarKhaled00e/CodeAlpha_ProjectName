 import 'package:flutter/material.dart';

void buildErrorBar(BuildContext context, String massage) {
     ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(massage)));
  }

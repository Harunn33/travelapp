import 'package:flutter/material.dart';

DecorationImage customImage({required String path}) {
  return DecorationImage(
    fit: BoxFit.cover,
    image: AssetImage("assets/images/$path"),
  );
}

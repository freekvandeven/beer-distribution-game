import 'package:flutter/material.dart';

@immutable
class Agent {
  const Agent({
    required this.name,
    required this.code,
  });

  final String name;
  final String code;
}

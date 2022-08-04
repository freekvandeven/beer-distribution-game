import 'package:flutter/material.dart';

@immutable
class ConnectionInfo {
  const ConnectionInfo({
    required this.ip,
    required this.port,
  });
  final String ip;
  final int port;
}

import 'package:flutter/material.dart';

class ConditionalBuilder extends StatelessWidget {
  const ConditionalBuilder({
    super.key,
    required this.condition,
    required this.builder,
    required this.fallback,
  });
  final bool condition;
  final Widget builder;
  final Widget fallback;
  @override
  Widget build(BuildContext context) {
    return condition == true ? builder : fallback;
  }
}

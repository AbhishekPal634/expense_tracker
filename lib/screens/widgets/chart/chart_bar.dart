import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({required this.fill, super.key});

  final double fill;

  @override
  Widget build(BuildContext context) {  
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
        child: FractionallySizedBox(
          heightFactor: fill,
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class MyAlertDialogWidget{
  final String title;
  final String content;
  VoidCallback? onClicked;

  MyAlertDialogWidget({
    required this.title,
    required this.content,
    this.onClicked
  });

  Future showCustomDialog(BuildContext context) => showModal(
    configuration: FadeScaleTransitionConfiguration(
      transitionDuration: const Duration(milliseconds: 500),
      reverseTransitionDuration: const Duration(milliseconds: 500)
    ),
    context: context, 
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: onClicked,
          child: Text('OK', style: TextStyle(color: Colors.purple[700]))
        )
      ],
    )
  );
  
}
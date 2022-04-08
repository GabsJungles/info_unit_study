import 'package:flutter/material.dart';

class ButtonBack extends StatefulWidget {
  const ButtonBack({Key? key}) : super(key: key);

  @override
  State<ButtonBack> createState() => _ButtonBackState();
}

class _ButtonBackState extends State<ButtonBack> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
          icon: const Icon(Icons.settings_backup_restore_rounded),
          iconSize: 50,
          color: Colors.white,
          onPressed: () {
                          });
                        }
                      
  }


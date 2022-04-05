import 'package:flutter/cupertino.dart';

class User{
  final String? id;
  final String nome;
  final String email;
  final String curso;
  final int periodo;
  final NetworkImage avatarImage;

  User({
  required this.id, 
  required this.nome, 
  required this.email, 
  required this.curso, 
  required this.periodo,
  required this.avatarImage,
  });
}

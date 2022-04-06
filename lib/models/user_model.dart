import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class User{
  final String? id;
  final String nome;
  final String apelido;
  final String email;
  final DropdownButton curso;
  final DropdownButton periodo;
  final NetworkImage avatarImage;

  User({
  required this.id, 
  required this.nome, 
  required this.apelido,
  required this.email, 
  required this.curso, 
  required this.periodo,
  required this.avatarImage,
  });
}

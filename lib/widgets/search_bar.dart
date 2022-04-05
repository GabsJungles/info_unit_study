import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({ Key? key }) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20,20,20,0),
      width: 200,
      height: 40,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          suffixIcon: Icon(Icons.analytics),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20)
          )
        ),
      ),
    );
  }
}
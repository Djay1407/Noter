import "package:flutter/material.dart";
import './App_screens/scr01.dart';
import './App_screens/scr02.dart';
// navigation change
void main()
{
  runApp(
    noteApp()
  ); 
}
class noteApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: "NOTER",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: NoteList(),
    );
  }

}
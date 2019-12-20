import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main(){
  runApp(MaterialApp(
    home:Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _toDoList = [];

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  /**
   * Future _getFile função assicrona
   * pega o diretório onde irá ser armazenado os dados
   */
  Future<File> _getFile() async{
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  /**
   * Future _save
   * Função para salvar os dados
   * retorna um arquivo
   */
  Future<File> _saveData() async{
    String data = json.encode(_toDoList);
    final file = await _getFile();
    return file.writeAsString(data);
  }

  /**
   * Future _readData
   * Função para ler os dados
   */
  Future<String> _readData() async{
    try{
      final file = await _getFile();

      return file.readAsString();
    }catch(e){
      return null;
    }
  }
}
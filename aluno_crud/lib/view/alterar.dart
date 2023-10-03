// ignore_for_file: prefer_const_literals_to_create_immutables, unnecessary_new
// ignore_for_file: prefer_const_constructors, sort_child_properties_last, non_constant_identifier_names, avoid_types_as_parameter_names
import 'package:flutter/material.dart';

import '../model/Aluno.dart';
import '../repository/aluno_repository.dart';

class MyAlterar extends StatefulWidget {
  Aluno aluno;
  int indice;

  MyAlterar(this.aluno, this.indice);

  @override
  State<MyAlterar> createState() => _MyAlterarState();
}

class _MyAlterarState extends State<MyAlterar> {
  TextEditingController campoNome = TextEditingController();
  TextEditingController campoRa = TextEditingController();
  final List listaAlunos = AlunoRepository.getListaAlunos;

  @override
  Widget build(BuildContext context) {
    inicializa();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Alteração de Alunos",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue.shade900,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network(
                    "https://www.sti3.com.br/wp-content/uploads/2021/06/cadastro-de-clientes-3-1024x512.jpg"),
                TextField(
                  controller: campoNome,
                  decoration: InputDecoration(
                      labelText: "Nome",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 12,
                ),
                TextField(
                  controller: campoRa,
                  decoration: InputDecoration(
                      labelText: "Ra",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //alterar
                    TextButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Colors.blue.shade900)),
                        onPressed: () {
                          int ra = int.parse(campoRa.text);
                          String nome = campoNome.text;
                          Aluno a = new Aluno(nome, ra);
                          listaAlunos[widget.indice] = a;
                          showDialog(
                              context: context,
                              builder: (BuildContext) {
                                return AlertDialog(
                                  content: Text("Aluno alterado com sucesso"),
                                  actions: [
                                    IconButton(
                                      icon: Icon(Icons.check),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.pushNamed(context, '/lista');
                                      },
                                    )
                                  ],
                                );
                              });
                        },
                        child: Text("Alterar", style: TextStyle(color: Colors.white),)),
                    //voltar
                    TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Colors.blue.shade900)),
                      onPressed: () {
                        Navigator.pushNamed(context, '/lista');
                      },
                      child: Text("Voltar", style: TextStyle(color: Colors.white),),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void inicializa() {
    campoRa.text = widget.aluno.ra.toString();
    campoNome.text = widget.aluno.nome.toString();
  }

  void mostrarMsgSucesso() {}
}

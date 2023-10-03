// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../model/Aluno.dart';
import '../repository/aluno_repository.dart';

class MyCadastro extends StatefulWidget {
  const MyCadastro({super.key});

  @override
  State<MyCadastro> createState() => _MyCadastroState();
}

class _MyCadastroState extends State<MyCadastro> {
  int ra = 0;
  String nome = " ";
  String warning = " ";
  final _formKey = GlobalKey<FormState>();
  TextEditingController campoRa = TextEditingController();
  TextEditingController campoNome = TextEditingController();
  AlunoRepository listaAl = AlunoRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("Cadastro de alunos",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue.shade900,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/lista');
            },
            icon: Icon(Icons.list),
            color: Colors.white,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
              padding: EdgeInsets.all(10),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network(
                        "https://www.clientarcrm.com.br/wp-content/uploads/2021/03/banner-cadastro-de-clientes.png"),
                    TextFormField(
                      controller: campoNome,
                      decoration: InputDecoration(
                          labelText: "Nome",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Digite um valor";
                        }else{
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: campoRa,
                      decoration: InputDecoration(
                          labelText: "Ra",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Digite um valor";
                        }else if(value.length != 6){
                          return "RA deve ter exatamente 6 dígitos";
                        }else{
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(warning),
                    ElevatedButton(
                      onPressed: () {
                        if(_formKey.currentState!.validate()){
                          ra = int.parse(campoRa.text);
                          nome = campoNome.text;
                          Aluno al = Aluno(nome, ra);
                          listaAl.adicionar(al);
                          listaAl.imprimir();
                          setState(() {
                            campoNome.clear();
                            campoRa.clear();
                          });
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Colors.blue.shade900)),
                      child: Text("Cadastrar", style: TextStyle(color: Colors.white),),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}

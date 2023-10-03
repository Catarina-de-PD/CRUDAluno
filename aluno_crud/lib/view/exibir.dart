// ignore_for_file: prefer_const_constructors, sort_child_properties_last, non_constant_identifier_names, avoid_types_as_parameter_names, prefer_const_literals_to_create_immutables, dead_code


import 'package:flutter/material.dart';
import '../repository/aluno_repository.dart';
import 'alterar.dart';

class MyLista extends StatefulWidget {
  const MyLista({super.key});

  @override
  State<MyLista> createState() => _MyListaState();
}

class _MyListaState extends State<MyLista> {
  String nomeBusca = "";
  final List listaAlunos = AlunoRepository.getListaAlunos;
  List listaBusca = [];

  @override
  void initState(){
    listaBusca = List.from(listaAlunos);
    super.initState();
  }

  void atualizaLista(String nome){
    listaBusca = List.from(listaAlunos); 
    setState(() {
      listaBusca = listaAlunos.where((element) => (
        element.nome.toLowerCase().startsWith(nome.toLowerCase()))).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text("Lista de Alunos",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              )),
          backgroundColor: Colors.blue.shade900,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                child: TextField(
                  style: TextStyle(color: Colors.black87),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    label: Text("Nome"), 
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)
                    )
                  ),
                  onChanged: (String nome) {
                    nomeBusca = nome;
                    atualizaLista(nomeBusca);
                  },
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.all(4),
                separatorBuilder: (context, index) => Divider(
                  thickness: 2,
                ),
                itemCount: listaBusca.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(listaBusca[index].nome[0],
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      backgroundColor: Colors.blue.shade900,
                    ),
                    title: Text(listaBusca[index].nome),
                    subtitle: Text(listaBusca[index].ra.toString()),
                    trailing: SizedBox(
                      width: 70,
                      child: Row(
                        children: [
                          //editar
                          Expanded(
                              child: IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return MyAlterar(listaAlunos[index], index);
                                },
                              ));
                            },
                          )),
                          //deletar
                          Expanded(
                            child: IconButton(
                              icon: Icon(Icons.delete_outline_outlined),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext) {
                                      return AlertDialog(
                                        content: Text("Deseja deletar aluno?"),
                                        actions: [
                                          IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  AlunoRepository().remover(
                                                      listaAlunos[index]);
                                                });
                                                Navigator.pop(context);
                                                Navigator.pushNamed(context, '/lista');
                                              },
                                              icon: Icon(Icons.check)),
                                          IconButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: Icon(Icons.cancel_outlined))
                                        ],
                                      );
                                    });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue.shade900)
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                child: Text("Voltar", style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ));
  }
}

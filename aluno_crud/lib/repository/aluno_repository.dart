// ignore_for_file: unnecessary_this, avoid_print

import '../model/Aluno.dart';

class AlunoRepository{
  static List<Aluno> _listaAlunos = [
    Aluno("Catarina", 201171),
    Aluno("Ricardo", 201605),
    Aluno("Parra", 201286),
    Aluno("Tania Basso", 102585),
    Aluno("Mika", 201295),
    Aluno("Bianca", 202578),
  ];

  static get getListaAlunos => _listaAlunos;

  set listaAlunos(value) => _listaAlunos = value;

  void adicionar(Aluno al){
    _listaAlunos.add(al);
  }

  void imprimir(){
    for(var i=0; i<_listaAlunos.length; i++){
      print("RA: ${_listaAlunos[i].ra}, Nome: ${_listaAlunos[i].nome},");
    }
    print("===========================");
  }

  void remover(Aluno al){
    _listaAlunos.remove(al);
  }
}
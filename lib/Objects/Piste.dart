//import 'dart:math';

class Piste {
  String nom;
  int id;
  double duree;

  Piste(String nom, int id, double duree) {
    this.nom = nom;
    this.id = id;
    this.duree = duree;
  }

  String getNom() {
    return nom;
  }

  int getId() {
    return id;
  }

  double getDuree() {
    return duree;
  }
}

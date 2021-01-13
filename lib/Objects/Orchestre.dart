import 'dart:math';

class Orchestre {
  String nom;
  String code;
  List clients;

  String get getNom {
    return nom;
  }

  String get getCode {
    return code;
  }

  Orchestre(String nom, String code) {
    this.nom = nom;
    this.code = code;
  }

  Orchestre.create(String nom) {
    this.nom = nom;
    this.code = generateCode();
  }

  Orchestre.fromCode(String code) {
    this.code = code;
    this.nom = "OrchesteTestJoin";
  }

  Orchestre.empty() {
    this.nom = null;
    this.code = null;
  }

  String generateCode() {
    String code = "";
    var rng = new Random();
    for (var i = 0; i < 6; i++) {
      code += String.fromCharCode(65 + rng.nextInt(26));
    }
    return code;
  }

  bool codeIsCorrest(String valueTest) {
    bool retour = false;
    if (this.code == valueTest) {
      retour = true;
    }
    return retour;
  }
}

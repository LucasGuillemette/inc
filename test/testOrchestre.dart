import 'package:project2a_inc/Objects/Orchestre.dart';

void main(List<String> args) {
  var orch = new Orchestre.create("MonOrchestre");
  print(orch.getNom);
  print(orch.getCode);
  if (orch.codeIsCorrest(orch.getCode)) {
    print("code bon !");
  } else {
    print("mauvais code !");
  }
}

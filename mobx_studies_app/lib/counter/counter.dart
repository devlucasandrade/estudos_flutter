import 'package:mobx/mobx.dart';

//Incluir gerador de arquivo
part 'counter.g.dart';

//Classe que será utilizada pelo resto da codebase
class Counter = _Counter with _$Counter;

//Store class
abstract class _Counter with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  @action
  void decrement() {
    value--;
  }
}

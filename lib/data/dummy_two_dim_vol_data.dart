class DummyTwoDimVolData {
  final List<List<String>> _dimenList = [
    [], //あ行
    ["23", "14"], //か行
    ["16"], //さ行
    ["23", "42"], //た行
    ["72"], //な行
    ["27", "36", "74"], // は行
    [], //ま行
    [], //や行
    [], //ら行
    [], //わ行
    [], //A行
    [], //B行
    [], //C行
    [], //D行
    [], //E行
    [], //F行
    [], //G行
    [], //H行
    [], //I行
    [], //J行
    [], //K行
    [], //L行
    [], //M行
    [], //N行
    ["99"], //O行
    [], //P行
    [], //Q行
    [], //R行
    [], //S行
    [], //T行
    [], //U行
    [], //V行
    [], //W行
    [], //X行
    [], //Y行
    [], //Z行
  ];

  List<List<String>> getTwoDimVolList() {
    return this._dimenList;
  }

  void setTwoDimVolList(int index, String data){
    this._dimenList[index].add(data);
  }
}

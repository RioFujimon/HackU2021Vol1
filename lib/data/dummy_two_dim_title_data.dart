class DummyTwoDimTitleData {
  final List<List<String>> _dimenList = [
    [], //あ行
    ["鬼滅の刃", "五等分の花嫁"], //か行
    ["呪術廻戦"], //さ行
    ["東京リベンジャーズ", "ドラゴンボール"], //た行
    ["ナルト"], //な行
    ["鋼の錬金術師", "ハンターハンター", "BLEACH"], // は行
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
    ["ONE PIECE"], //O行
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

  List<List<String>> getTwoDimTitleList() {
    return this._dimenList;
  }
  void setTwoDimTitleList(int index, String data){
    this._dimenList[index].add(data);
  }

}

class DummyTwoDimAuthorData {
  final List<List<String>> _dimenList = [
    [], //あ行
    ['吾峠呼世晴', '春場ねぎ'], //か行
    ['芥見下々'], //さ行
    ['和久井健', '鳥山 明'], //た行
    ['岸本 斉史'], //な行
    ['荒川弘', '冨樫 義博', '久保 帯人'], // は行
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
    ['尾田栄一郎'], //O行
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

  List<List<String>> getTwoDimAuthorList() {
    return this._dimenList;
  }

  void setTwoDimAuthorList(int index, String data){
    this._dimenList[index].add(data);
  }

}

class DummyTwoDimImageData {
  final List<List<String>> _dimenList = [
    [], //あ行
    ["DemonSlayer_blur.jpg", "Quintessential_blur.jpeg"], //か行
    ["Crunchyroll_blur.jpg"], //さ行
    ["TokyoRevengers_blur.jpg", "DragonBall_blur.jpeg"], //た行
    ["Naruto_blur.jpeg"], //な行
    [
      "FullMetalAlchemist_blur.jpeg",
      "HunterHunter_blur.jpeg",
      "Bleach_blur.jpeg"
    ], // は行
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
    ["OnePiece_blur.jpg"], //O行
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

  List<List<String>> getTwoDimImageList() {
    return this._dimenList;
  }
  void setTwoDimImageList(int index, String data){
    this._dimenList[index].add(data);
  }
}

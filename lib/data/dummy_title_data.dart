class DummyTitleData {
  final List<String> _titles = [
    '呪術回戦',
    'ONE PIECE',
    '鬼滅の刃',
    'ナルト',
    '五等分の花嫁',
    '東京リベンジャーズ',
    'BLEACH',
    'HUNTER HUNTER',
    'ドラゴンボール',
    '鋼の錬金術師',
  ];

  List<String> getDummyTitles() {
    return this._titles;
  }
  void setTitles(String data){
    this._titles.add(data);
    print("add"+data);
    print(this._titles[(this._titles.length - 1)]);
    print("after add " + this._titles.length.toString());
  }
  
  set titles(String data){
    _titles.add(data);
  }
}

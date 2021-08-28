class DummyAuthorData {
  final List<String> _authors = [
    '芥見下々',
    '尾田栄一郎',
    '吾峠呼世晴',
    '岸本 斉史',
    '春場ねぎ',
    '和久井健',
    '久保 帯人',
    '冨樫 義博',
    '鳥山 明',
    '荒川弘',
  ];

  List<String> getAuthorsData() {
    return this._authors;
  }

  void setData(String data){
    _authors.add(data);
  }

}

import 'package:flutter/material.dart';
import 'package:hacku2021_vol1/data/dummy_author_data.dart';
import 'package:hacku2021_vol1/data/dummy_image_path_data.dart';
import 'package:hacku2021_vol1/data/dummy_title_data.dart';
import 'package:hacku2021_vol1/data/dummy_two_dim_author_data.dart';
import 'package:hacku2021_vol1/data/dummy_two_dim_image_data.dart';
import 'package:hacku2021_vol1/data/dummy_two_dim_title_data.dart';
import 'package:hacku2021_vol1/widgets/horizontal_list_view.dart';
import 'screens/register_book_screen.dart';
import 'widgets/yellow_dot_index_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'data/kana_and_alpha_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(title: 'マイページ！'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> imagesPath = DummyImagePathData().getImagesPath();
  List<String> titles = DummyTitleData().getDummyTitles();
  List<String> authors = DummyAuthorData().getAuthorsData();
  List<String> kanaAndAlphaList = KadaAndAlphaListData().getKanaAndAlphaData();

  final TextEditingController _searchController = new TextEditingController();

  Future<String> getImageFromCamera() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    return pickedFile!.path;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white70,
          title: Text(
            widget.title,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          actions: [
            IconButton(
              color: Colors.blue,
              onPressed: () async {
                print('漫画の追加');
                var imagePathFromCamera = await getImageFromCamera();
                print("imagePathFromCamera：" + imagePathFromCamera);
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterBookScreen(
                      imagePathFromCamera: imagePathFromCamera,
                    ),
                  ),
                );
              },
              icon: Icon(
                Icons.add_circle_outline_outlined,
                size: 40,
              ),
            )
          ],
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Text(
                  '漫画一覧',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.white70,
                  ),
                ),
                TextField(
                  controller: _searchController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey.shade900,
                    ),
                    hintText: '検索',
                  ),
                  onEditingComplete: () {
                    print(_searchController.text);
                  },
                ),
                Flexible(
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: Column(
                          children: [
                            YellowDotIndexBar(
                              titleOfIndex: kanaAndAlphaList[index],
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: HorizontalListView(
                                index: index,
                                twoDimTitleList:
                                    DummyTwoDimTitleData().getTwoDimTitleList(),
                                twoDimAuthorList: DummyTwoDimAuthorData()
                                    .getTwoDimAuthorList(),
                                twoDimImageList:
                                    DummyTwoDimImageData().getTwoDimImageList(),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: kanaAndAlphaList.length,
                  ),
                ),
                // GridView.count(
                //   crossAxisCount: 2,
                //   crossAxisSpacing: 10,
                //   mainAxisSpacing: 10,
                //   scrollDirection: Axis.vertical,
                //   children: List<Widget>.generate(
                //     titles.length,
                //     generator,
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget generator(int index) {
  //   return GestureDetector(
  //     child: GridTile(
  //       child: Container(
  //         decoration: BoxDecoration(
  //           color: Colors.white,
  //           borderRadius: BorderRadius.circular(10),
  //           border: Border.all(
  //             color: Colors.black,
  //             width: 1,
  //           ),
  //         ),
  //         child: Center(
  //           child: Column(
  //             children: [
  //               Text(
  //                 titles[index],
  //                 textAlign: TextAlign.center,
  //                 style: TextStyle(
  //                   fontSize: 18,
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               ),
  //               SizedBox(
  //                 height: 140,
  //                 width: 140,
  //                 child: Image(
  //                   image: AssetImage('images/' + imagesPath[index]),
  //                 ),
  //               )
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //     onTap: () {
  //       print(titles[index] + 'を選択');
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => BookDetailsScreen(
  //             bookTitle: titles[index],
  //             imagePath: 'images/' + this.imagesPath[index],
  //             author: authors[index],
  //             latestIssue: '16',
  //             bookPrice: '500',
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}

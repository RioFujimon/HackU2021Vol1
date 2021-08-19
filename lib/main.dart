import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hacku2021_vol1/Screens/register_book_screen.dart';

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
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(title: 'MyPage'),
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
  List<String> imagesPath = [
    'Crunchyroll.jpg',
    'OnePiece.jpg',
    'DemonSlayer.jpg',
    'Naruto.jpeg',
    'Quintessential.jpeg',
    'TokyoRevengers.jpg',
    'Bleach.jpeg',
    'HunterHunter.jpeg',
    'DragonBall.jpeg',
    'FullMetalAlchemist.jpeg',
  ];

  List<String> titles = [
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
          title: Text(
            widget.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
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
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              scrollDirection: Axis.vertical,
              children: List<Widget>.generate(
                titles.length,
                generator,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget generator(int index) {
    return GestureDetector(
      child: GridTile(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.black,
              width: 1,
            ),
          ),
          child: Center(
            child: Column(
              children: [
                Text(
                  titles[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 140,
                  width: 140,
                  child: Image(
                    image: AssetImage('images/' + imagesPath[index]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        print(titles[index] + 'を選択');
      },
    );
  }
}

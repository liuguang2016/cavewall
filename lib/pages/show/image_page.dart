import 'package:flutter/material.dart';
import 'package:transformer_page_view/transformer_page_view.dart';
import 'package:flutter/cupertino.dart';

class ImagePage extends StatefulWidget {
  ImagePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ImagePageState createState() => new _ImagePageState();
}

List<String> images = [
  "assets/images/1.jpg",
  "assets/images/2.jpg",
  "assets/images/3.jpg",
  "assets/images/4.png",
  "assets/images/5.jpg",
  "assets/images/6.jpg"
];

List<String> text0 = ["春归何处。寂寞无行路", "春无踪迹谁知。除非问取黄鹂", "山色江声相与清，卷帘待得月华生","flutter","淘宝大型应用架构中的微前端方案","新起点"];
List<String> text1 = ["若有人知春去处。唤取归来同住", "百啭无人能解，因风飞过蔷薇", "可怜一曲并船笛，说尽故人离别情。","何处不相逢","谁不是呢","本文是前端早早聊第 39 场"];

class ImageTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new TransformerPageView(
      loop: false,
      viewportFraction: 0.8,
      itemCount: images.length,
      scrollDirection:Axis.vertical,
      transformer: new PageTransformerBuilder(
        builder: (Widget child, TransformInfo info) {
          return new Padding(
            padding: new EdgeInsets.all(0.0),
            child: new Material(
              elevation: 4.0,
              textStyle: new TextStyle(color: Colors.black),
              child: new Stack(
                // fit: StackFit.expand,
                children: <Widget>[
                  Center(
                    child: ParallaxImage.asset(
                      images[info.index],
                      position: info.position,
                    ),
                  ),
                  new DecoratedBox(
                    decoration: new BoxDecoration(
                      gradient: new LinearGradient(
                        begin: FractionalOffset.bottomCenter,
                        end: FractionalOffset.topCenter,
                        colors: [
                          const Color(0xFF000000),
                          const Color(0x33FFC0CB),
                        ],
                      ),
                    ),
                  ),
                  new Positioned(
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new ParallaxContainer(
                          child: new Text(
                            text0[info.index],
                            style: new TextStyle(fontSize: 15.0),
                          ),
                          position: info.position,
                          translationFactor: 300.0,
                        ),
                        new SizedBox(
                          height: 8.0,
                        ),
                        new ParallaxContainer(
                          child: new Text(
                            text1[info.index],
                            style: new TextStyle(fontSize: 18.0),
                          ),
                          position: info.position,
                          translationFactor: 200.0,
                        ),
                      ],
                    ),
                    left: 10.0,
                    right: 10.0,
                    bottom: 10.0,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ImagePageState extends State<ImagePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: false,
        child: new ImageTest(),
      ),
    );
  }
}

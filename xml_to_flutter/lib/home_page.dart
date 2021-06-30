import 'package:flutter/material.dart';
import 'package:xml/xml.dart' as xml;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future getStyle(BuildContext context) async {
    // load xml file from assets folder
    String xmlString = await DefaultAssetBundle.of(context)
        .loadString("assets/theme/theme.xml");
    // parsing string to xml document
    var xmlDocument = xml.XmlDocument.parse(xmlString);
    var xmlToStrings = xmlDocument.toXmlString(pretty: true, indent: '\t');
    print("frist print statement " + xmlToStrings);
    final xmlText = xmlDocument.descendants
        .where(
            (element) => element is xml.XmlText && !element.text.trim().isEmpty)
        .join('\n');
    print("Second print statement " + xmlText);
    var style = xmlDocument.findAllElements('style').forEach((element) {
      // get single style by style id
      //element.attributes.first.value.contains('2');
      if (element.attributes.first.value.contains('2')) {
        // print style attributes
        print(element);
        print(
            element.getElement('tkHr').getElement('bgCircle').attributes.first);
        print(
            element.getElement('tkHr').getElement('bgCircle').attributes.last);

        print(element
            .getElement('tkHr')
            .getElement('bgCircle')
            .getElement('fill')
            .getElement('gradient'));

        print(element
            .getElement('tkHr')
            .getElement('bgCircle')
            .getElement('fill')
            .getElement('gradient')
            .attributes);
      }
    });

    // var singleStyle = xmlDocument
    //     .findElements('style')
    //     .where((element) => element.attributes.first.value.contains('1'));

    // print(singleStyle);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: MaterialButton(
              color: Colors.red,
              padding: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              minWidth: 1.0,
              height: 50,
              onPressed: () {
                getStyle(context);
              },
              child: Text(
                "Read Xml File",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontFamily: "RobotoCondensed",
                    color: Colors.white),
              )),
        ),
      ),
    );
  }
}


//  Future<List<ThemeModel>> getStyle(BuildContext context) async {
//   String xmlString =
//       await DefaultAssetBundle.of(context).loadString("assets/theme/theme.xml");
//   var raw = xml.XmlDocument.parse(xmlString);
//   var element = raw.findAllElements("style");

//   return element.map((item) {
//     return ThemeModel(styleID: item.findElements('id').first.text);
//   }).toList();
// }

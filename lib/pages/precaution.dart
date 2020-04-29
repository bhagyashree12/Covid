import 'package:flutter/material.dart';

class Percaution extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Precaution"),
        backgroundColor: Colors.blue[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      body: ListView.builder(
          itemCount: finalList.length,
          itemBuilder: (context, index) {
            return Card(
                child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: ListTile(
                title: Text(finalList[index].text),
                leading: Image(image: AssetImage(finalList[index].src)
                ),
              ),
            ));
          }),
    );
  }
}

final List<Data> finalList = listimage();

class Data {
  String text;
  String src;

  Data({this.text, this.src});
}

List<Data> listimage() {
  var list = List<Data>();
  list.add(
      Data(text: "Wash your hands frequently", src: "assests/clean_hands.JPG"));
  list.add(Data(
      text: "Maintain social distancing", src: "assests/social_distance.JPG"));
  list.add(Data(
      text: "Avoid touching eyes, nose and mouth",
      src: "assests/dont_touch_face.JPG"));
  list.add(Data(
      text: "Practice respiratory hygiene",
      src: "assests/praticse_respiratory.JPG"));
  list.add(Data(
      text:
          "If you have fever, cough and difficulty breathing, seek medical care early",
      src: "assests/fever.JPG"));

  return list;
}

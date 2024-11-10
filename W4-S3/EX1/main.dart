import 'package:flutter/material.dart';

class SelectableButton extends StatefulWidget {

  const SelectableButton(
      {super.key});

  @override
  State<SelectableButton> createState() => _SelectableButtonState();
}

class _SelectableButtonState extends State<SelectableButton> {
  
  bool isSelected = false;

  void applySelect() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  Color get buttonColor => isSelected ? (Colors.blue[600] ?? Colors.blue) : (Colors.blue[50] ?? Colors.blue);
  String get text => isSelected? "Selected" : "Not selected";
  Color get textColor => isSelected ? Colors.white: Colors.black;

  @override
  Widget build(BuildContext context) {
    return Center(
          child: SizedBox(
            width: 400,
            height: 100,
            child: ElevatedButton(
                onPressed: applySelect,
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor, 
                ),
                child: Center(
                  child: Text(text,style: TextStyle(color:textColor )),
                )),
          ),
        );
  }
}

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom buttons"),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: SelectableButton()
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: SelectableButton()
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: SelectableButton()
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: SelectableButton()
            ),
          ],
        ) 
      ),
    ));
// SelectableButton(),
//             SelectableButton(),
//             SelectableButton()
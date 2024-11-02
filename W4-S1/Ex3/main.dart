import 'package:flutter/material.dart';

enum ButtonColor { primary, secondary, disabled }
enum IconPosition { left , right }


class CustomButton extends StatelessWidget {
  final ButtonColor buttonColor;
  final IconData icon;
  final String text;
  final IconPosition iconPosition;

  const CustomButton(
      {super.key,
      required this.buttonColor,
      required this.icon,
      required this.text,
      this.iconPosition = IconPosition.left
      });

  @override
  Widget build(BuildContext context) {
    final color;

    switch (buttonColor) {
      case ButtonColor.primary:
        color = Colors.blue;
        break;
      case ButtonColor.secondary:
        color = Colors.green;
        break;
      case ButtonColor.disabled:
        color = Colors.grey;
        break;
    }

    return Container(
        padding:EdgeInsets.all(10),
        margin: EdgeInsets.all(20),
        width: 500,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          if (iconPosition == IconPosition.left)...[
            Icon(icon, size: 20),
            SizedBox(width: 8), // Add some spacing between icon and text
            Text(text, style: TextStyle(color: Colors.grey[200], fontSize: 18)),
           ] else...[
            Text(text, style: TextStyle(color: Colors.grey[200], fontSize: 18)),
            SizedBox(width: 8), // Add some spacing between text and icon
            Icon(icon, size: 20),
           ],
        ],
        ));
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Custom Buttons"),
          )
        ),
        body: Center(
          child: Column(
            children: [
              CustomButton(
                buttonColor: ButtonColor.primary,
                icon: Icons.check,
                text: "Submit",
              ),
              CustomButton(
                buttonColor: ButtonColor.secondary,
                icon: Icons.watch_later_outlined,
                text: "Time",
                iconPosition: IconPosition.right,
              ),
              CustomButton(
                buttonColor: ButtonColor.disabled,
                icon: Icons.account_tree, 
                text: "Account",
                iconPosition: IconPosition.right,
              )
            ],
          ),
        )
      ),
  ));
}

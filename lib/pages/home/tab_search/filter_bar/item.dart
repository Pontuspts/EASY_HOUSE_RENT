import 'package:flutter/material.dart';

//item choose desgin
class Item extends StatelessWidget {
  final String? title;
  final bool? isActive;
  final Function(BuildContext)? onTap;

  const Item({Key? key, this.title, this.isActive, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //When isActive is true, the text color of the list item is green, otherwise it is black.
    var color = (isActive ?? false) ? Colors.green : Colors.black87;

    return GestureDetector(
      //GestureDetector, used to listen to click events and call the onTap callback function when triggered
      onTap: () {
        if (onTap != null) onTap!(context);
      },
      child: Row(
        children: [
          Text(title!, style: TextStyle(color: color)),
          Icon(Icons.arrow_drop_down, size: 20, color: color)
        ],
      ),
    );
  }
}

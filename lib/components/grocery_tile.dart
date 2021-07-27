import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../models/models.dart';

class GroceryTile extends StatelessWidget {
  final GroceryItem item;

  final Function(bool) onComplete;

  final TextDecoration textDecoration;

  GroceryTile({Key key, this.item, this.onComplete})
      : textDecoration =
            item.isComplete ? TextDecoration.lineThrough : TextDecoration.none,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 5.0,
                color: item.color,
              ),
              SizedBox(width: 16.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: GoogleFonts.lato(
                        decoration: textDecoration,
                        fontSize: 21.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4.0),
                  buildDate(),
                  SizedBox(height: 4.0),
                  buildImportance()
                ],
              )
            ],
          ),
          Row(
            children: [
              Text(
                item.quantity.toString(),
                style: GoogleFonts.lato(
                    decoration: textDecoration, fontSize: 21.0),
              ),
              buildCheckbox()
            ],
          )
        ],
      ),
    );
  }

  Widget buildImportance() {
    if (item.importance == Importance.low) {
      return Text('Low', style: GoogleFonts.lato(decoration: textDecoration));
    } else if (item.importance == Importance.medium) {
      return Text('Medium',
          style: GoogleFonts.lato(
              decoration: textDecoration, fontWeight: FontWeight.w800));
    } else if (item.importance == Importance.high) {
      return Text('High',
          style: GoogleFonts.lato(
              color: Colors.red,
              decoration: textDecoration,
              fontWeight: FontWeight.w900));
    } else {
      throw Exception('This importance type does not exist');
    }
  }

  Widget buildDate() {
    final dateFormatter = DateFormat('MMMM dd hh:mm a');
    final dateString = dateFormatter.format(item.date);
    return Text(dateString, style: TextStyle(decoration: textDecoration));
  }

  Widget buildCheckbox() {
    return Checkbox(value: item.isComplete, onChanged: onComplete);
  }
}

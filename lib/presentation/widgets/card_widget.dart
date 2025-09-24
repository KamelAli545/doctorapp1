import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  final String cardName;
  final String assetPath;
  final bool isSelected;
  final VoidCallback onTap;

  const CardWidget({super.key,
    required this.cardName,
    required this.assetPath,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Row(
        children: [
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(6),
            ),
            child: Image.asset(widget.assetPath),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Text(
              widget.cardName,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
          ),
          Icon(
            widget.isSelected? Icons.circle : Icons.circle_outlined,
            color: Color.fromRGBO(36, 124, 255, 1),
          ),
        ],
      ),
    );
  }
}

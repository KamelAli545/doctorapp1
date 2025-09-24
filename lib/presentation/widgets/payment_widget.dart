import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentWidget extends StatefulWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  const PaymentWidget({super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<PaymentWidget> createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Row(
        children: [
          Icon(
            widget.isSelected ? Icons.circle : Icons.circle_outlined,
            color: Color.fromRGBO(36, 124, 255, 1),
          ),
          SizedBox(width: 10),
          Text(
            widget.title,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}

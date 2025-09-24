import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppointmentWidget extends StatefulWidget {
  final IconData icon;
  final Color iconBgColor;
  final String text;
  final int index;
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  const AppointmentWidget({
    super.key,
    required this.icon,
    required this.iconBgColor,
    required this.text,
    required this.index,
    required this.color,
    required this.isSelected,
    required this.onTap,
  });
  @override
  State<AppointmentWidget> createState() => _AppointmentWidgetState();
}

class _AppointmentWidgetState extends State<AppointmentWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: InkWell(
        onTap: widget.onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: widget.iconBgColor,
              child: Icon(widget.icon, color: widget.color),
            ),
            SizedBox(width: 30),
            Expanded(
              child: Text(
                widget.text,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: Color.fromRGBO(36, 36, 36, 1),
                ),
              ),
            ),
            SizedBox(width: 10),
            Icon(
              widget.isSelected ? Icons.circle : Icons.circle_outlined,
              color: Color.fromRGBO(36, 124, 255, 1),
            ),
          ],
        ),
      ),
    );
  }
}

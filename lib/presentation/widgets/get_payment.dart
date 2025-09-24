import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GetPayment extends StatelessWidget {
  int? selectedPayment;
  int? selectedCard;

   GetPayment({super.key,required this.selectedPayment,required this.selectedCard});
  String getPaymentMethod() {
    switch (selectedPayment) {
      case 0: // Credit Card
        switch (selectedCard) {
          case 0:
            return "Master Card";
          case 1:
            return "American Express";
          case 2:
            return "Capital One";
          case 3:
            return "Barclays";
          default:
            return "Credit Card (Unknown)";
        }
      case 1:
        return "Bank Transfer";
      case 2:
        return "PayPal";
      default:
        return "Not Selected";
    }
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330,
      height: 88,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Payment Information",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.payment, color: Colors.blue),
              const SizedBox(width: 8),
              Text(
                getPaymentMethod(),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Container(
                width: 80,
                height: 38,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(48),
                  border: Border.all(color: const Color.fromRGBO(36, 124, 255, 1)),
                ),
                child: const Center(
                  child: Text(
                    "Change",
                    style: TextStyle(
                      color: Color.fromRGBO(36, 124, 255, 1),
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );  }
}

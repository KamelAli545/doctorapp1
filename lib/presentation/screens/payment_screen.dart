import 'package:untitled/data/doctor_model.dart';
import 'package:untitled/presentation/screens/summary_page.dart';
import 'package:untitled/presentation/widgets/card_widget.dart';
import 'package:untitled/presentation/widgets/payment_widget.dart';
import 'package:untitled/presentation/widgets/upper_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  final DateTime? selectedDate;
  final String? selectedTime;
  final int? selectedAppointmentType;
  final DoctorModel doctor;
  final String imagePath;
  const PaymentScreen({super.key,
    this.selectedDate,
    this.selectedTime,
    this.selectedAppointmentType,
    required this.doctor,
    required this.imagePath,

  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
int selectedPayment=-1;
int selectedCard=-1;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:UpperBar(title: "Book Appointment"),
      ),
      body: SingleChildScrollView(
        child: Column(
            children: [
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: Center(
                  child: SizedBox(
                    width: 500,
                    height: 90,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Color.fromRGBO(34, 197, 94, 1),
                              child: Center(
                                child: Text("1",
                                  style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1)),),
                              ),
                            ),
                            SizedBox(height: 9,),
                            Center(
                                child: Text("Date & Time",
                                  style: TextStyle(color: Color.fromRGBO(34, 197, 94, 1),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400),))
                          ],
                        ),
                        SizedBox(width: 20,),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 35.0),
                          child: Container(
                            width: 50,
                            height: 3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey
                            ),
                          ),
                        ),
                        SizedBox(width: 20,),
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Color.fromRGBO(36 , 124, 255, 1),
                              child: Center(
                                child: Text("2",
                                  style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1)),),
                              ),
                            ),
                            SizedBox(height: 9,),
                            Center(
                                child: Text("Payment",
                                  style: TextStyle(color: Colors.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400),))
                          ],
                        ),
                        SizedBox(width: 20,),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 35.0),
                          child: Container(
                            width: 50,
                            height: 3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey
                            ),
                          ),
                        ),
                        SizedBox(width: 20,),
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Color.fromRGBO(224, 224, 224, 1),
                              child: Center(
                                child: Text("3",
                                  style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1)),),
                              ),
                            ),
                            SizedBox(height: 9,),
                            Center(
                                child: Text("Summary",
                                  style: TextStyle(color: Colors.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400),))
                          ],
                        ),
        
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Payment Option",
                    style:TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                    ) ,),
                    SizedBox(height: 20,),
                    PaymentWidget(
                        title: "Credit Card",
                        isSelected: selectedPayment==0,
                        onTap: ()=>setState(() =>selectedPayment=0),),
                    SizedBox(height: 30,),
                    if (selectedPayment==0)...[
                      CardWidget(
                          cardName: "Master Card",
                          assetPath: "assets/logos/mastercard.png",
                          isSelected: selectedCard == 0,
                          onTap: () => setState(() => selectedCard = 0)),
                      Divider(),
                      CardWidget(
                          cardName: "American Express",
                          assetPath: "assets/logos/American-Express-Logo-PNG-Photo-Image.png",
                          isSelected: selectedCard == 1,
                          onTap: () => setState(() => selectedCard = 1)),
                      Divider(),
                      CardWidget(
                          cardName: "Capital One",
                          assetPath: "assets/logos/capital_one logo.png",
                          isSelected: selectedCard == 2,
                          onTap: () => setState(() => selectedCard = 2)),
                      Divider(),
                      CardWidget(
                          cardName: "Barclays",
                          assetPath: "assets/logos/Group 1000004781.png",
                          isSelected: selectedCard == 3,
                          onTap: () => setState(() => selectedCard = 3)),
                      SizedBox(height: 30,),
                    ],
                    PaymentWidget(
                      title: "Bank Transfer",
                      isSelected: selectedPayment==1,
                      onTap: ()=>setState(() =>selectedPayment=1),),
                    SizedBox(height: 30,),
                    PaymentWidget(
                      title: "PayPal",
                      isSelected: selectedPayment==2,
                      onTap: ()=>setState(() =>selectedPayment=2),),
                  ],
                ),
              ),
            ]
        ),
      ),
      bottomNavigationBar:Padding(
        padding: const EdgeInsets.all(16.0),
        child: InkWell(
          onTap: (){
            print("Payment: $selectedPayment, Card Used: $selectedCard");
            if (selectedPayment==-1||(selectedPayment==0&&selectedCard==-1)){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please select payment option and card if applicable")),
              );
              return;
            }
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SummaryPage(
              selectedDate: widget.selectedDate,
              selectedTime: widget.selectedTime,
              selectedAppointmentType: widget.selectedAppointmentType,
              selectedPayment: selectedPayment,
              selectedCard: selectedCard,
              doctor: widget.doctor,
              imagePath: widget.imagePath,
            )));
          },
          child: Container(
            width: 327,
            height: 52,
            decoration: BoxDecoration(
                color: Color.fromRGBO(36, 124, 255, 1),
                borderRadius: BorderRadius.circular(16)),
            child: Center(
              child: Text("Continue",
                  style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }
}

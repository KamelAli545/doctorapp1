import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/data/appointment.dart';
import 'package:untitled/logic/appointment/post/cubit.dart';
import 'package:untitled/logic/appointment/post/state.dart';
import 'package:untitled/presentation/screens/booking_details.dart';
import 'package:untitled/presentation/widgets/get_payment.dart';
import 'package:untitled/presentation/widgets/recom_widget.dart';
import 'package:untitled/presentation/widgets/upper_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/data/doctor_model.dart';
import 'package:intl/intl.dart';

class SummaryPage extends StatefulWidget {
  final DateTime? selectedDate;
  final String? selectedTime;
  final int? selectedAppointmentType;
  final int? selectedPayment;
  final int? selectedCard;
  final DoctorModel doctor;
  final String imagePath;

  const SummaryPage({
    super.key,
    this.selectedDate,
    this.selectedTime,
    this.selectedAppointmentType,
    this.selectedPayment,
    this.selectedCard,
    required this.doctor,
    required this.imagePath,
  });

  @override
  State<SummaryPage> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  /// تعديل هنا ✅
  DateTime combineDateTime24(DateTime date, String time) {
    final inputFormat = DateFormat("hh:mm a"); // 12-hour format with AM/PM
    final parsedTime = inputFormat.parse(time);

    return DateTime(
      date.year,
      date.month,
      date.day,
      parsedTime.hour,
      parsedTime.minute,
    );
  }

  Future<Map<String, dynamic>> _getCurrentUser() async {
    // هنا حط الـ logic بتاعك عشان تجيب بيانات الـ user
    // مثلاً من SharedPreferences أو من API
    return {
      "id": 1,
      "name": "Eslam",
      "email": "eslammoh369@gmail.com",
      "phone": "01000000000",
      "gender": "male"
    };
  }

  @override
  Widget build(BuildContext context) {
    final int subtotal = widget.doctor.appointPrice;
    final int tax = (subtotal * 0.05).toInt();
    final int total = subtotal + tax;
    final doctor = widget.doctor;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            UpperBar(title: "Book Appointment"),
            const SizedBox(height: 10),
            // --- Steps Bar ---
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
                          const CircleAvatar(
                            backgroundColor: Color.fromRGBO(34, 197, 94, 1),
                            child: Center(
                              child: Text("1",
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                          const SizedBox(height: 9),
                          const Text("Date & Time",
                              style: TextStyle(
                                  color: Color.fromRGBO(34, 197, 94, 1),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400))
                        ],
                      ),
                      const SizedBox(width: 20),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 35.0),
                        child: Container(
                          width: 50,
                          height: 3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        children: [
                          const CircleAvatar(
                            backgroundColor: Color.fromRGBO(34, 197, 94, 1),
                            child: Center(
                              child: Text("2",
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                          const SizedBox(height: 9),
                          const Text("Payment",
                              style: TextStyle(
                                  color: Color.fromRGBO(34, 197, 94, 1),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400))
                        ],
                      ),
                      const SizedBox(width: 20),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 35.0),
                        child: Container(
                          width: 50,
                          height: 3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        children: [
                          const CircleAvatar(
                            backgroundColor: Color.fromRGBO(224, 224, 224, 1),
                            child: Center(
                              child: Text("3",
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                          const SizedBox(height: 9),
                          const Text("Summary",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // --- Booking Info ---
            SizedBox(
              width: 327,
              height: 201,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Booking Information",
                      style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 30.0),
                        child: CircleAvatar(
                          backgroundColor: Color.fromRGBO(234, 242, 255, 1),
                          child: Icon(Icons.calendar_month_outlined,
                              color: Color.fromRGBO(36, 124, 255, 1)),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Date & Time",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600)),
                          const SizedBox(height: 6),
                          Text(
                            widget.selectedDate != null
                                ? "${widget.selectedDate!.day}/${widget.selectedDate!.month}/${widget.selectedDate!.year}"
                                : "Not Selected",
                            style: const TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12),
                          ),
                          const SizedBox(height: 6),
                          Text(widget.selectedTime ?? "Not Selected",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 12)),
                        ],
                      )
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: CircleAvatar(
                          backgroundColor: Color.fromRGBO(233, 250, 239, 1),
                          child: Icon(Icons.receipt,
                              color: Color.fromRGBO(34, 197, 94, 1)),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Appointment Type",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600)),
                          const SizedBox(height: 6),
                          Text(
                            widget.selectedAppointmentType != null
                                ? (widget.selectedAppointmentType == 0
                                ? "In Person"
                                : widget.selectedAppointmentType == 1
                                ? "Video Call"
                                : widget.selectedAppointmentType == 2
                                ? "Phone Call"
                                : "unknown")
                                : "Not Selected",
                            style: const TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Divider(),
                ],
              ),
            ),
            // --- Doctor Info ---
            const Padding(
              padding: EdgeInsets.only(right: 160.0),
              child: Text("Doctor Information",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
            ),
            const SizedBox(height: 10),
            RecomWidget(
              imagePath: widget.imagePath,
              rate: doctor.rating.toString(),
              description: doctor.description,
              hostpial: doctor.description ?? "Unknown Hospital",
              name: doctor.name,
              reviews: "${doctor.reviewsCount} reviews",
            ),
            GetPayment(
                selectedPayment: widget.selectedPayment,
                selectedCard: widget.selectedCard),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Payment Info",
                      style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Subtotal",
                          style: TextStyle(
                              color: Color.fromRGBO(117, 117, 117, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.w400)),
                      Text("\$$subtotal",
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Tax",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400)),
                      Text('\$$tax',
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Payment Total",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  Text("\$$total",
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // --- Book Now Button with Bloc ---
            BlocProvider(
              create: (context) => AppointmentPostCubit(),
              child: BlocConsumer<AppointmentPostCubit, AppointmentPostStates>(
                listener: (context, state) {
                  if (state is AppointmentPostSuccessState) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BookingDetails(
                              selectedDate: widget.selectedDate,
                              selectedTime: widget.selectedTime,
                              selectedAppointmentType:
                              widget.selectedAppointmentType,
                              selectedPayment: widget.selectedPayment,
                              selectedCard: widget.selectedCard,
                              doctor: widget.doctor,
                              imagePath: widget.imagePath,
                            )));
                  } else if (state is AppointmentPostErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.errorMessage)));
                  }
                },
                builder: (context, state) {
                  if (state is AppointmentPostLoadingState) {
                    return const Center(
                        child:
                        CircularProgressIndicator(color: Colors.blue));
                  }
                  return InkWell(
                    onTap: () async {
                      final userData = await _getCurrentUser();

                      final startDateTime = combineDateTime24(
                        widget.selectedDate!,
                        widget.selectedTime!,
                      );

                      final appointment = AppointmentModel(
                        id: 0,
                        doctor: widget.doctor,
                        patient: UserModel(
                          id: userData["id"],
                          name: userData["name"],
                          email: userData["email"],
                          phone: userData["phone"],
                          gender: userData["gender"],
                        ),
                        appointmentTime: startDateTime,
                        notes: "eslam",
                        status: AppointmentStatus.pending,
                        appointmentPrice: widget.doctor.appointPrice,
                      );

                      context.read<AppointmentPostCubit>().createAppointment(
                        appointment: appointment,
                      );
                    },
                    child: Container(
                      width: 327,
                      height: 52,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(36, 124, 255, 1),
                          borderRadius: BorderRadius.circular(16)),
                      child: const Center(
                        child: Text("Book Now",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
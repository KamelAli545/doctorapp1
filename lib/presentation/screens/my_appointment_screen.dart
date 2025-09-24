import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/data/appointment.dart';
import 'package:untitled/logic/appointment/get/cubit.dart';
import 'package:untitled/logic/appointment/get/state.dart';
import 'package:untitled/data/doctor_model.dart';
import 'package:untitled/logic/appointment/post/cubit.dart';
import 'package:untitled/logic/appointment/post/state.dart';
import 'package:untitled/presentation/widgets/my_appointment_widget.dart';
import 'package:untitled/presentation/widgets/appointment_completed.dart';
import 'package:untitled/presentation/widgets/appointment_cancelled.dart';
import 'package:untitled/presentation/widgets/home_widget.dart';
import 'package:untitled/presentation/widgets/recom_widget.dart';
import 'package:untitled/presentation/widgets/upper_bar.dart';
import 'package:untitled/presentation/screens/search_screen.dart';
import 'package:intl/intl.dart';
import 'package:untitled/data/appointment.dart';

class MyAppointmentScreen extends StatefulWidget {
  final String? selectedDate;
  final String? selectedTime;
  const MyAppointmentScreen({super.key, this.selectedDate, this.selectedTime});

  @override
  State<MyAppointmentScreen> createState() => _MyAppointmentScreenState();
}

class _MyAppointmentScreenState extends State<MyAppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
     create: (_) => AppointmentGetCubit()..getAppointments(),
            child: DefaultTabController(
              length: 3,
              child: Scaffold(
                bottomNavigationBar: HomeWidget(),
                backgroundColor: Colors.white,
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  elevation: 0,
                  backgroundColor: Colors.white,
                  title: UpperBar(
                    title: "My Appointments",
                    trailing: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchScreen()),
                        );
                      },
                      child: const Icon(Icons.search),
                    ),
                  ),
                  centerTitle: true,
                ),
                body: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: const TabBar(
                        isScrollable: false,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorColor: Color.fromRGBO(36, 124, 255, 1),
                        indicatorWeight: 3,
                        labelColor: Color.fromRGBO(36, 124, 255, 1),
                        unselectedLabelColor: Color.fromRGBO(158, 158, 158, 1),
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 14),
                        tabs: [
                          Tab(text: "Upcoming"),
                          Tab(text: "Completed"),
                          Tab(text: "Cancelled"),
                        ],
                      ),
                    ),
                    Expanded(
                      child: BlocBuilder<AppointmentGetCubit, AppointmentGetStates>(
                        builder: (context, state) {
                          if (state is AppointmentGetLoadingState) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: Colors.blue,
                              ),
                            );
                          } else if (state is AppointmentGetErrorState) {
                            return Center(child: Text(state.errorMessage));
                          } else if (state is AppointmentGetSuccessState) {
                            final appointments = state.appointments;

                            final upcomingAppointments = appointments
                                .where(
                                  (a) =>
                              a.status == AppointmentStatus.pending ||
                                  a.status == AppointmentStatus.upcoming,
                            )
                                .toList();

                            final completedAppointments = appointments
                                .where(
                                  (a) =>
                              a.status == AppointmentStatus.completed,
                            )
                                .toList();

                            final cancelledAppointments = appointments
                                .where(
                                  (a) =>
                              a.status == AppointmentStatus.cancelled,
                            )
                                .toList();

                            return TabBarView(
                              children: [
                                AppointmentList(
                                    appointments: upcomingAppointments),
                                AppointmentList(
                                    appointments: completedAppointments),
                                AppointmentList(
                                    appointments: cancelledAppointments),
                              ],
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
  class AppointmentList extends StatelessWidget {
  final List<AppointmentModel> appointments;

   AppointmentList({super.key, required this.appointments});

  String formatDate(DateTime dateTime) {
    return DateFormat("EEEE, MMMM d, y h:mm a", "en_US").format(dateTime);
  }
  final List<String> doctorImages = [
    "assets/images/Randy.png",
    "assets/images/Susan.png",
    "assets/images/Image (4).png",
    "assets/images/Image (5).png",
  ];
  @override
  Widget build(BuildContext context) {
    if (appointments.isEmpty) {
      return const Center(child: Text("No appointments found"));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: appointments.length,
      itemBuilder: (context, index) {
        final appointment = appointments[index];
        final doc = appointment.doctor;
        final imagePath = doctorImages[index % doctorImages.length];
        return MyAppointmentWidget(
          doctor: doc,
            name: doc.name,
            description: doc.description,
            hostpial: doc.specialization!.name,
            imagePath:imagePath);

      },
    );

  }
}

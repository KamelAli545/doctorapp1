import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/logic/dr_spec/cubit.dart';
import 'package:untitled/presentation/widgets/dr_spe.dart';
import 'package:untitled/presentation/widgets/upper_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorSpecialityScreen extends StatefulWidget {
  const DoctorSpecialityScreen({super.key});

  @override
  State<DoctorSpecialityScreen> createState() => _DoctorSpecialityScreenState();
}

class _DoctorSpecialityScreenState extends State<DoctorSpecialityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:
      UpperBar(title: "Doctor Speciality"),
          ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 80,),
            BlocProvider(
              create: (context) => DrSpecialityCubit()..getSpecializations(),
              child: DrSpe(),
            ),
          ],

        ),
      ),
    );
  }
}

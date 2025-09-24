import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/logic/dr_spec/cubit.dart';
import 'package:untitled/logic/dr_spec/state.dart';

class DrSpe extends StatefulWidget {

   DrSpe({super.key,});

  @override
  State<DrSpe> createState() => _DrSpeState();
}

class _DrSpeState extends State<DrSpe> {
  final List<String> specialitytype = [
     "assets/images/Man Doctor Europe 1.png",
      "assets/images/Frame.png",
    "assets/images/Kidneys 1.png",
 "assets/images/Dent.png",
"assets/images/Intestine.png",
"assets/images/Histo.png",
 "assets/images/Hepat.png",
"assets/images/cardiologist.png",
"assets/images/Brain 1.png",
 "assets/images/pulmonary.png",
 "assets/images/Optometry.png",

  ];  int selectIndex=0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrSpecialityCubit,DrSpecialtiyState>(
      builder: (context, state) {
        if (state is DrSpecialtiyLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is DrSpecialtiyErrorState) {
          return Center(child: Text(state.em),);
        } else if (state is DrSpecialtiySuccessState) {
          final specialities = state.specialization;
          if (specialities.isEmpty) {
            return const Center(child: Text("No specialities found"));
          }
          return SizedBox(
            height: 602,
            child: GridView.builder(
              itemCount: specialities.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                final isSelected = index == selectIndex;
                final speciality = specialities[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectIndex = index;
                    });
                  },
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border:
                          isSelected ? Border.all(
                              color: Color.fromRGBO(36, 124, 255, 1)) : null,
                        ),
                        child: Center(
                          child: Image.asset(specialitytype[index% specialitytype.length],
                            width: 30, height: 30,),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        decoration: BoxDecoration(
                        ),
                        child: Text(speciality.name,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }
        return SizedBox.shrink();
      }
    );
  }
}
